#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ITrusteeAdmin extends IUnknown{
    /**
     * The interface identifier for ITrusteeAdmin
     * @type {Guid}
     */
    static IID => Guid("{0c733aa1-2a1c-11ce-ade5-00aa0044773d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pTrustee1 
     * @param {Pointer<TRUSTEE_W>} pTrustee2 
     * @returns {HRESULT} 
     */
    CompareTrustees(pTrustee1, pTrustee2) {
        result := ComCall(3, this, "ptr", pTrustee1, "ptr", pTrustee2, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pTrustee 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {HRESULT} 
     */
    CreateTrustee(pTrustee, cPropertySets, rgPropertySets) {
        result := ComCall(4, this, "ptr", pTrustee, "uint", cPropertySets, "ptr", rgPropertySets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pTrustee 
     * @returns {HRESULT} 
     */
    DeleteTrustee(pTrustee) {
        result := ComCall(5, this, "ptr", pTrustee, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pTrustee 
     * @param {Integer} cPropertySets 
     * @param {Pointer<DBPROPSET>} rgPropertySets 
     * @returns {HRESULT} 
     */
    SetTrusteeProperties(pTrustee, cPropertySets, rgPropertySets) {
        result := ComCall(6, this, "ptr", pTrustee, "uint", cPropertySets, "ptr", rgPropertySets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<TRUSTEE_W>} pTrustee 
     * @param {Integer} cPropertyIDSets 
     * @param {Pointer<DBPROPIDSET>} rgPropertyIDSets 
     * @param {Pointer<UInt32>} pcPropertySets 
     * @param {Pointer<DBPROPSET>} prgPropertySets 
     * @returns {HRESULT} 
     */
    GetTrusteeProperties(pTrustee, cPropertyIDSets, rgPropertyIDSets, pcPropertySets, prgPropertySets) {
        result := ComCall(7, this, "ptr", pTrustee, "uint", cPropertyIDSets, "ptr", rgPropertyIDSets, "uint*", pcPropertySets, "ptr", prgPropertySets, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
