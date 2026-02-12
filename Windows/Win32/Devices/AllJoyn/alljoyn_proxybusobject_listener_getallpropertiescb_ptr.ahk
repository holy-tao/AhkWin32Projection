#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class alljoyn_proxybusobject_listener_getallpropertiescb_ptr extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Integer} status_ 
     * @param {alljoyn_proxybusobject} obj 
     * @param {alljoyn_msgarg} values 
     * @param {Pointer<Void>} context_ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(status_, obj, values, context_) {
        obj := obj is Win32Handle ? NumGet(obj, "ptr") : obj
        values := values is Win32Handle ? NumGet(values, "ptr") : values

        context_Marshal := context_ is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "int", status_, "ptr", obj, "ptr", values, context_Marshal, context_)
    }
}
