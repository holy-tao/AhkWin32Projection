#Requires AutoHotkey v2.0
#Include Guid.ahk
#Include ./Windows/Win32/System/WinRT/Apis.ahk

/**
 * The base class for Windows Runtime event handlers. The handler itself implements `Invoke` and is used to implement
 * the event handler interface for the appropriate type. WinRT classes then register the handler with the runtime,
 * and the handler manages parameter marshalling and calling callbacks.
 * 
 * WinRTEventHandler handles events using the same pattern as the built-in AHK events like `OnEvent` and `OnError`.
 * Callbacks are all called in the same thread, and can return a non-zero integer to prevent further callbacks from
 * being called.
 */
class WinRTEventHandler {

    /**
     * The handlers' registered callbacks
     * @type {Array<Func>} 
     */
    _callbacks := []

    /**
     * Array of functions used to marshal parameters into AHK types
     * @type {Array<Func(Any) => Any | String}
     */
    _marshallers := []

    /**
     * The actual implemented interface - WinRT classes can use this to access the vtable pointer and should pass
     * this into the appropriate add_* method to register the handler after creating it. The WinRT class will need
     * to call Delete() on this interface to fully clean up the handler.
     * @type {Win32ComInterface}
     */
    iface := unset

    /**
     * Constructor - sets up the handler and creates the appropriate interface.
     * 
     * @param {Class} iface the Interface class that this event handler needs to implement
     * @param {Guid} iid the IID of the interface. If the interface is parameterized, this must be the parameterized
     *          interface id, otherwise it can be `iface.IID`
     * @param {Array<Func(Any) => Any | String} marashallers Any number of functions to use to marshal event arguments
     *          into their respective AHK types. Can be an empty string or other non-callable object if the parameter 
     *          does not require transformation (e.g. primitive integers). Must match the number of arguments sent to 
     *          the callback.
     */
    __New(iface, iid, marshallers*) {
        if(!(iid is Guid)) {
            throw TypeError("Expected a Guid but got a(n) " type(iid), -1, iid)
        }

        for(fn in marshallers) {
            if(!HasMethod(fn, , 1)) {
                msg := Format("Invalid marshalling function - object of type {1} is not callable with 1 parameter", type(fn))
                throw MethodError(msg)
            }
        }

        this.iface := iface.Call(this)
        this.iface.IID := iid
        this._marshallers := marshallers
    }

    /**
     * Adds or removes an event handler.
     * 
     * @param {Func} callback The callback to add. The shape of the callback depends on the arguments passed to the
     *          event. The callback can return a non-zero integer to prevent any subsequent callbacks from 
     * @param {Integer} addRemove If omitted, it defaults to 1. Otherwise, specify one of the following numbers:
     *          - `1`: Call the callback after any previously registered callbacks.
     *          - `-1`: Call the callback before any previously registered callbacks.
     *          - `0`: Remove the callback from the list of registered callbacks
     */
    Call(_, callback, addRemove := 1) {
        if(!HasMethod(callback)) {
            throw TypeError(Format("Object of type '{1}' is not callable", type(callback)), -1, callback)
        }

        switch (addRemove) {
            case 1:
                this._callbacks.Push(callback)
            case -1: 
                this._callbacks.InsertAt(1, callback)
            case 0:
                for (cb in this._callbacks) {
                    if (cb == callback) {
                        this._callbacks.RemoveAt(A_Index)
                        return
                    }
                }

                throw TargetError("Cannot remove callback because it was not registered with this event handler", -1, callback)
            default:
                throw ValueError("Invalid Add/Remove value, expected one of -1, 0, or 1", -1, addRemove)
        }
    }

    /**
     * The actual invoke method. This method is invoked by the Windows Runtime when an event is invoked and is
     * responsible for marshalling parameters and calling AHK callbacks. 
     * 
     * If any AHK callback throws an error, the handler returns `E_FAIL` (unspecified error) to the runtime, unless 
     * the error is an OSError, in which case the OSError number is returned. The error is also logged via
     * [`RoOriginateError`](https://learn.microsoft.com/en-us/windows/win32/api/roerrorapi/nf-roerrorapi-rooriginateerror).
     * Note that this may truncate the error message to 512 characters. Downstream code can retrieve the error with
     * [`GetRestrictedErrorInfo`](https://learn.microsoft.com/en-us/windows/win32/api/roerrorapi/nf-roerrorapi-getrestrictederrorinfo).
     * 
     * @param {Integer} cppThis Unused. The `this` parameter passed by c++. This is a pointer to the interface
     *          vtable.
     * @param {Array<Integer>} params The parameters passed by the runtime
     * @returns {HRESULT} S_OK (0) on success, or an error HRESULT if any callback throws an error.
     */
    Invoke(cppThis, params*) {
        if(this._callbacks.length <= 0)
            return 0

        try {
            ; Marshal all our pointers
            loop (params.length) {
                if(!HasMethod(this._marshallers[A_Index]))
                    continue

                params[A_Index] := marshalled := this._marshallers[A_Index].Call(params[A_Index])
                if(marshalled is IUnknown) {
                    marshalled.AddRef()
                }
            }

            for(callback in this._callbacks) {
                result := callback.Call(params*)

                if((result is Integer) && result != 0)
                    break   ; Stop calling callbacks for non-zero Integer return values
            }

            return 0
        }
        catch Any as err {
            errNo := (err is OSError)? err.Number : 0x80004005 ; E_FAIL

            ; Limit message to MAX_ERROR_MESSAGE_CHARS for RoOriginateErrorW
            msg := Format("{1} thrown in {2}", type(err), type(this.iface))
            if(err is Error) {
                msg .= Format(": {1}{2}", err.message, (err.extra != "" ? " (" err.extra ")" : ""))
            }

            if(StrLen(msg) > WinRT.MAX_ERROR_MESSAGE_CHARS) {
                msg := SubStr(msg, 1, WinRT.MAX_ERROR_MESSAGE_CHARS - 3) "..."
            }
            
            WinRT.RoOriginateErrorW(errNo, StrLen(msg), msg)
            WinRT.RoCaptureErrorContext(errNo)

            return errNo
        }
    }
}