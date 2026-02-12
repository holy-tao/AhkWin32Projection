#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class alljoyn_buslistener_name_owner_changed_ptr extends IUnknown {

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
     * @param {Pointer<Void>} context_ 
     * @param {PSTR} busName 
     * @param {PSTR} previousOwner 
     * @param {PSTR} newOwner 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(context_, busName, previousOwner, newOwner) {
        busName := busName is String ? StrPtr(busName) : busName
        previousOwner := previousOwner is String ? StrPtr(previousOwner) : previousOwner
        newOwner := newOwner is String ? StrPtr(newOwner) : newOwner

        context_Marshal := context_ is VarRef ? "ptr" : "ptr"

        ComCall(3, this, context_Marshal, context_, "ptr", busName, "ptr", previousOwner, "ptr", newOwner)
    }
}
