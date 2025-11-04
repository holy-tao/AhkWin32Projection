#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IObjectAccessControl extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObjectAccessControl
     * @type {Guid}
     */
    static IID => Guid("{0c733aa3-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetObjectAccessRights", "GetObjectOwner", "IsObjectAccessAllowed", "SetObjectAccessRights", "SetObjectOwner"]

    /**
     * 
     * @param {Pointer<SEC_OBJECT>} pObject 
     * @param {Pointer<Integer>} pcAccessEntries 
     * @param {Pointer<Pointer<EXPLICIT_ACCESS_W>>} prgAccessEntries 
     * @returns {HRESULT} 
     */
    GetObjectAccessRights(pObject, pcAccessEntries, prgAccessEntries) {
        pcAccessEntriesMarshal := pcAccessEntries is VarRef ? "uint*" : "ptr"
        prgAccessEntriesMarshal := prgAccessEntries is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", pObject, pcAccessEntriesMarshal, pcAccessEntries, prgAccessEntriesMarshal, prgAccessEntries, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SEC_OBJECT>} pObject 
     * @param {Pointer<Pointer<TRUSTEE_W>>} ppOwner 
     * @returns {HRESULT} 
     */
    GetObjectOwner(pObject, ppOwner) {
        ppOwnerMarshal := ppOwner is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", pObject, ppOwnerMarshal, ppOwner, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SEC_OBJECT>} pObject 
     * @param {Pointer<EXPLICIT_ACCESS_W>} pAccessEntry 
     * @param {Pointer<BOOL>} pfResult 
     * @returns {HRESULT} 
     */
    IsObjectAccessAllowed(pObject, pAccessEntry, pfResult) {
        result := ComCall(5, this, "ptr", pObject, "ptr", pAccessEntry, "ptr", pfResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SEC_OBJECT>} pObject 
     * @param {Integer} cAccessEntries 
     * @param {Pointer<EXPLICIT_ACCESS_W>} prgAccessEntries 
     * @returns {HRESULT} 
     */
    SetObjectAccessRights(pObject, cAccessEntries, prgAccessEntries) {
        result := ComCall(6, this, "ptr", pObject, "uint", cAccessEntries, "ptr", prgAccessEntries, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SEC_OBJECT>} pObject 
     * @param {Pointer<TRUSTEE_W>} pOwner 
     * @returns {HRESULT} 
     */
    SetObjectOwner(pObject, pOwner) {
        result := ComCall(7, this, "ptr", pObject, "ptr", pOwner, "HRESULT")
        return result
    }
}
