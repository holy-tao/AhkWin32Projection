#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IObjectAccessControl extends IUnknown{
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
     * 
     * @param {Pointer<SEC_OBJECT>} pObject 
     * @param {Pointer<UInt32>} pcAccessEntries 
     * @param {Pointer<EXPLICIT_ACCESS_W>} prgAccessEntries 
     * @returns {HRESULT} 
     */
    GetObjectAccessRights(pObject, pcAccessEntries, prgAccessEntries) {
        result := ComCall(3, this, "ptr", pObject, "uint*", pcAccessEntries, "ptr", prgAccessEntries, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SEC_OBJECT>} pObject 
     * @param {Pointer<TRUSTEE_W>} ppOwner 
     * @returns {HRESULT} 
     */
    GetObjectOwner(pObject, ppOwner) {
        result := ComCall(4, this, "ptr", pObject, "ptr", ppOwner, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(5, this, "ptr", pObject, "ptr", pAccessEntry, "ptr", pfResult, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(6, this, "ptr", pObject, "uint", cAccessEntries, "ptr", prgAccessEntries, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<SEC_OBJECT>} pObject 
     * @param {Pointer<TRUSTEE_W>} pOwner 
     * @returns {HRESULT} 
     */
    SetObjectOwner(pObject, pOwner) {
        result := ComCall(7, this, "ptr", pObject, "ptr", pOwner, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
