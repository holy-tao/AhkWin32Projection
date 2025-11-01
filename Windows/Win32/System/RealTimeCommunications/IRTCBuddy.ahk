#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IRTCPresenceContact.ahk

/**
 * @namespace Windows.Win32.System.RealTimeCommunications
 * @version v4.0.30319
 */
class IRTCBuddy extends IRTCPresenceContact{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRTCBuddy
     * @type {Guid}
     */
    static IID => Guid("{fcb136c8-7b90-4e0c-befe-56edf0ba6f1c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "get_Notes"]

    /**
     * 
     * @param {Pointer<Integer>} penStatus 
     * @returns {HRESULT} 
     */
    get_Status(penStatus) {
        penStatusMarshal := penStatus is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, penStatusMarshal, penStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrNotes 
     * @returns {HRESULT} 
     */
    get_Notes(pbstrNotes) {
        result := ComCall(12, this, "ptr", pbstrNotes, "HRESULT")
        return result
    }
}
