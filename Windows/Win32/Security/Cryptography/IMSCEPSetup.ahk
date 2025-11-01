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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_MSCEPErrorId", "get_MSCEPErrorString", "InitializeDefaults", "GetMSCEPSetupProperty", "SetMSCEPSetupProperty", "SetAccountInformation", "IsMSCEPStoreEmpty", "GetProviderNameList", "GetKeyLengthList", "Install", "PreUnInstall", "PostUnInstall"]

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-get_msceperrorid
     */
    get_MSCEPErrorId(pVal) {
        result := ComCall(7, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-get_msceperrorstring
     */
    get_MSCEPErrorString(pVal) {
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-initializedefaults
     */
    InitializeDefaults() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-getmscepsetupproperty
     */
    GetMSCEPSetupProperty(propertyId, pVal) {
        result := ComCall(10, this, "int", propertyId, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {Pointer<VARIANT>} pPropertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-setmscepsetupproperty
     */
    SetMSCEPSetupProperty(propertyId, pPropertyValue) {
        result := ComCall(11, this, "int", propertyId, "ptr", pPropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrUserName 
     * @param {BSTR} bstrPassword 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-setaccountinformation
     */
    SetAccountInformation(bstrUserName, bstrPassword) {
        bstrUserName := bstrUserName is String ? BSTR.Alloc(bstrUserName).Value : bstrUserName
        bstrPassword := bstrPassword is String ? BSTR.Alloc(bstrPassword).Value : bstrPassword

        result := ComCall(12, this, "ptr", bstrUserName, "ptr", bstrPassword, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEmpty 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-ismscepstoreempty
     */
    IsMSCEPStoreEmpty(pbEmpty) {
        result := ComCall(13, this, "ptr", pbEmpty, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bExchange 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-getprovidernamelist
     */
    GetProviderNameList(bExchange, pVal) {
        result := ComCall(14, this, "short", bExchange, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bExchange 
     * @param {BSTR} bstrProviderName 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-getkeylengthlist
     */
    GetKeyLengthList(bExchange, bstrProviderName, pVal) {
        bstrProviderName := bstrProviderName is String ? BSTR.Alloc(bstrProviderName).Value : bstrProviderName

        result := ComCall(15, this, "short", bExchange, "ptr", bstrProviderName, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-install
     */
    Install() {
        result := ComCall(16, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-preuninstall
     */
    PreUnInstall() {
        result := ComCall(17, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-imscepsetup-postuninstall
     */
    PostUnInstall() {
        result := ComCall(18, this, "HRESULT")
        return result
    }
}
