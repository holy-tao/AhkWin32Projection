#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines functionality to install and uninstall a Network Device Enrollment Service (NDES) role on a Certificate Services computer.
 * @see https://docs.microsoft.com/windows/win32/api//casetup/nn-casetup-imscepsetup
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class IMSCEPSetup extends IDispatch{
    /**
     * The interface identifier for IMSCEPSetup
     * @type {Guid}
     */
    static IID => Guid("{4f7761bb-9f3b-4592-9ee0-9a73259c313e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_MSCEPErrorId(pVal) {
        result := ComCall(7, this, "int*", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_MSCEPErrorString(pVal) {
        result := ComCall(8, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    InitializeDefaults() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     */
    GetMSCEPSetupProperty(propertyId, pVal) {
        result := ComCall(10, this, "int", propertyId, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {Pointer<VARIANT>} pPropertyValue 
     * @returns {HRESULT} 
     */
    SetMSCEPSetupProperty(propertyId, pPropertyValue) {
        result := ComCall(11, this, "int", propertyId, "ptr", pPropertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrUserName 
     * @param {BSTR} bstrPassword 
     * @returns {HRESULT} 
     */
    SetAccountInformation(bstrUserName, bstrPassword) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(12, this, "ptr", bstrUserName, "ptr", bstrPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEmpty 
     * @returns {HRESULT} 
     */
    IsMSCEPStoreEmpty(pbEmpty) {
        result := ComCall(13, this, "ptr", pbEmpty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bExchange 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     */
    GetProviderNameList(bExchange, pVal) {
        result := ComCall(14, this, "short", bExchange, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bExchange 
     * @param {BSTR} bstrProviderName 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     */
    GetKeyLengthList(bExchange, bstrProviderName, pVal) {
        bstrProviderName := bstrProviderName is String ? BSTR.Alloc(bstrProviderName).Value : bstrProviderName

        result := ComCall(15, this, "short", bExchange, "ptr", bstrProviderName, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Install() {
        result := ComCall(16, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PreUnInstall() {
        result := ComCall(17, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PostUnInstall() {
        result := ComCall(18, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
