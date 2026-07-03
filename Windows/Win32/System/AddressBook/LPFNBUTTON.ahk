#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ENTRYID.ahk" { ENTRYID }

/**
 * Describes the LPFNBUTTON function and provides syntax, parameters, return value, and additional remarks.
 * @remarks
 * Client applications call a callback function based on the **LPFNBUTTON** prototype to define a button in a details dialog box. The client passes a pointer to the callback function in calls to the [IAddrBook::Details](iaddrbook-details.md) method.
 *   
 * Service providers call a hook function based on the **LPFNBUTTON** prototype to define a button in a details dialog box. The provider passes a pointer to this hook function in calls to the [IMAPISupport::Details](imapisupport-details.md) method.
 *   
 * In both cases, when the dialog box is displayed and the user chooses the defined button, MAPI calls **LPFNBUTTON**.
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/lpfnbutton
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct LPFNBUTTON {
    value : IntPtr

    __value {
        set {
            if (value is LPFNBUTTON) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ulUIParam > [in] Handle of the parent windows for any dialog boxes or windows this function displays.
     * @param {Pointer<Void>} lpvContext > [in] Pointer to an arbitrary value passed to the callback function when MAPI calls it. This value can represent an address of significance to the client application. Typically, for C++ code, _lpvContext_ represents a pointer to a C++ object.
     * @param {Integer} cbEntryID > [in] Size, in bytes, of the entry identifier pointed to by the  _lpSelection_ parameter.
     * @param {Pointer<ENTRYID>} lpSelection > [in] Pointer to the entry identifier defining the selection in the dialog box.
     * @param {Integer} ulFlags > [in] Reserved; must be zero.
     * @returns {Integer} S_OK
     *   
     * > The call succeeded and has returned the expected value or values.
     */
    Call(ulUIParam, lpvContext, cbEntryID, lpSelection, ulFlags) {
        lpvContextMarshal := lpvContext is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, IntPtr, ulUIParam, lpvContextMarshal, lpvContext, UInt32, cbEntryID, ENTRYID.Ptr, lpSelection, UInt32, ulFlags, Int32)
        return result
    }

    /**
     * A LPFNBUTTON that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNBUTTON {
        /**
         * Creates a LPFNBUTTON pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, "ptr", UInt32, ENTRYID, UInt32) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "ptr", UInt32, ENTRYID.Ptr, UInt32, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
