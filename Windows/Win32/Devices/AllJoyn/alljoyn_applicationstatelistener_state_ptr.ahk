#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class alljoyn_applicationstatelistener_state_ptr extends IUnknown {

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
     * @param {Pointer<Integer>} busName 
     * @param {Pointer<Integer>} publicKey 
     * @param {Integer} applicationState 
     * @param {Pointer<Void>} context_ 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(busName, publicKey, applicationState, context_) {
        busNameMarshal := busName is VarRef ? "char*" : "ptr"
        publicKeyMarshal := publicKey is VarRef ? "char*" : "ptr"
        context_Marshal := context_ is VarRef ? "ptr" : "ptr"

        ComCall(3, this, busNameMarshal, busName, publicKeyMarshal, publicKey, "int", applicationState, context_Marshal, context_)
    }
}
