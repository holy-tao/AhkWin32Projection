#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IADsNameTranslateinterface translates distinguished names (DNs) among various formats as defined in the ADS_NAME_TYPE_ENUM enumeration. The feature is available to objects in Active Directory.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsnametranslate
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsNameTranslate extends IDispatch{
    /**
     * The interface identifier for IADsNameTranslate
     * @type {Guid}
     */
    static IID => Guid("{b1b272a3-3625-11d1-a3a4-00c04fb950dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Integer} lnChaseReferral 
     * @returns {HRESULT} 
     */
    put_ChaseReferral(lnChaseReferral) {
        result := ComCall(7, this, "int", lnChaseReferral, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnSetType 
     * @param {BSTR} bstrADsPath 
     * @returns {HRESULT} 
     */
    Init(lnSetType, bstrADsPath) {
        bstrADsPath := bstrADsPath is String ? BSTR.Alloc(bstrADsPath).Value : bstrADsPath

        result := ComCall(8, this, "int", lnSetType, "ptr", bstrADsPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnSetType 
     * @param {BSTR} bstrADsPath 
     * @param {BSTR} bstrUserID 
     * @param {BSTR} bstrDomain 
     * @param {BSTR} bstrPassword 
     * @returns {HRESULT} 
     */
    InitEx(lnSetType, bstrADsPath, bstrUserID, bstrDomain, bstrPassword) {
        bstrADsPath := bstrADsPath is String ? BSTR.Alloc(bstrADsPath).Value : bstrADsPath
        bstrUserID := bstrUserID is String ? BSTR.Alloc(bstrUserID).Value : bstrUserID
        bstrDomain := bstrDomain is String ? BSTR.Alloc(bstrDomain).Value : bstrDomain
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(9, this, "int", lnSetType, "ptr", bstrADsPath, "ptr", bstrUserID, "ptr", bstrDomain, "ptr", bstrPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnSetType 
     * @param {BSTR} bstrADsPath 
     * @returns {HRESULT} 
     */
    Set(lnSetType, bstrADsPath) {
        bstrADsPath := bstrADsPath is String ? BSTR.Alloc(bstrADsPath).Value : bstrADsPath

        result := ComCall(10, this, "int", lnSetType, "ptr", bstrADsPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnFormatType 
     * @param {Pointer<BSTR>} pbstrADsPath 
     * @returns {HRESULT} 
     */
    Get(lnFormatType, pbstrADsPath) {
        result := ComCall(11, this, "int", lnFormatType, "ptr", pbstrADsPath, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnFormatType 
     * @param {VARIANT} pvar 
     * @returns {HRESULT} 
     */
    SetEx(lnFormatType, pvar) {
        result := ComCall(12, this, "int", lnFormatType, "ptr", pvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} lnFormatType 
     * @param {Pointer<VARIANT>} pvar 
     * @returns {HRESULT} 
     */
    GetEx(lnFormatType, pvar) {
        result := ComCall(13, this, "int", lnFormatType, "ptr", pvar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
