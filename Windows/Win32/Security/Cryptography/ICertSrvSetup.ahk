#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * Defines functionality to install and uninstall Certification Authority (CA) and Certification Authority Web Enrollment roles on a Certificate Services computer.
 * @see https://docs.microsoft.com/windows/win32/api//casetup/nn-casetup-icertsrvsetup
 * @namespace Windows.Win32.Security.Cryptography
 * @version v4.0.30319
 */
class ICertSrvSetup extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICertSrvSetup
     * @type {Guid}
     */
    static IID => Guid("{b760a1bb-4784-44c0-8f12-555f0780ff25}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CAErrorId", "get_CAErrorString", "InitializeDefaults", "GetCASetupProperty", "SetCASetupProperty", "IsPropertyEditable", "GetSupportedCATypes", "GetProviderNameList", "GetKeyLengthList", "GetHashAlgorithmList", "GetPrivateKeyContainerList", "GetExistingCACertificates", "CAImportPFX", "SetCADistinguishedName", "SetDatabaseInformation", "SetParentCAInformation", "SetWebCAInformation", "Install", "PreUnInstall", "PostUnInstall"]

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-get_caerrorid
     */
    get_CAErrorId(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-get_caerrorstring
     */
    get_CAErrorString(pVal) {
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bServer 
     * @param {VARIANT_BOOL} bClient 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-initializedefaults
     */
    InitializeDefaults(bServer, bClient) {
        result := ComCall(9, this, "short", bServer, "short", bClient, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {Pointer<VARIANT>} pPropertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-getcasetupproperty
     */
    GetCASetupProperty(propertyId, pPropertyValue) {
        result := ComCall(10, this, "int", propertyId, "ptr", pPropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {Pointer<VARIANT>} pPropertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-setcasetupproperty
     */
    SetCASetupProperty(propertyId, pPropertyValue) {
        result := ComCall(11, this, "int", propertyId, "ptr", pPropertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {Pointer<VARIANT_BOOL>} pbEditable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-ispropertyeditable
     */
    IsPropertyEditable(propertyId, pbEditable) {
        result := ComCall(12, this, "int", propertyId, "ptr", pbEditable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pCATypes 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-getsupportedcatypes
     */
    GetSupportedCATypes(pCATypes) {
        result := ComCall(13, this, "ptr", pCATypes, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-getprovidernamelist
     */
    GetProviderNameList(pVal) {
        result := ComCall(14, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProviderName 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-getkeylengthlist
     */
    GetKeyLengthList(bstrProviderName, pVal) {
        bstrProviderName := bstrProviderName is String ? BSTR.Alloc(bstrProviderName).Value : bstrProviderName

        result := ComCall(15, this, "ptr", bstrProviderName, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProviderName 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-gethashalgorithmlist
     */
    GetHashAlgorithmList(bstrProviderName, pVal) {
        bstrProviderName := bstrProviderName is String ? BSTR.Alloc(bstrProviderName).Value : bstrProviderName

        result := ComCall(16, this, "ptr", bstrProviderName, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrProviderName 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-getprivatekeycontainerlist
     */
    GetPrivateKeyContainerList(bstrProviderName, pVal) {
        bstrProviderName := bstrProviderName is String ? BSTR.Alloc(bstrProviderName).Value : bstrProviderName

        result := ComCall(17, this, "ptr", bstrProviderName, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ICertSrvSetupKeyInformationCollection>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-getexistingcacertificates
     */
    GetExistingCACertificates(ppVal) {
        result := ComCall(18, this, "ptr*", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrFileName 
     * @param {BSTR} bstrPasswd 
     * @param {VARIANT_BOOL} bOverwriteExistingKey 
     * @param {Pointer<ICertSrvSetupKeyInformation>} ppVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-caimportpfx
     */
    CAImportPFX(bstrFileName, bstrPasswd, bOverwriteExistingKey, ppVal) {
        bstrFileName := bstrFileName is String ? BSTR.Alloc(bstrFileName).Value : bstrFileName
        bstrPasswd := bstrPasswd is String ? BSTR.Alloc(bstrPasswd).Value : bstrPasswd

        result := ComCall(19, this, "ptr", bstrFileName, "ptr", bstrPasswd, "short", bOverwriteExistingKey, "ptr*", ppVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrCADN 
     * @param {VARIANT_BOOL} bIgnoreUnicode 
     * @param {VARIANT_BOOL} bOverwriteExistingKey 
     * @param {VARIANT_BOOL} bOverwriteExistingCAInDS 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-setcadistinguishedname
     */
    SetCADistinguishedName(bstrCADN, bIgnoreUnicode, bOverwriteExistingKey, bOverwriteExistingCAInDS) {
        bstrCADN := bstrCADN is String ? BSTR.Alloc(bstrCADN).Value : bstrCADN

        result := ComCall(20, this, "ptr", bstrCADN, "short", bIgnoreUnicode, "short", bOverwriteExistingKey, "short", bOverwriteExistingCAInDS, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDBDirectory 
     * @param {BSTR} bstrLogDirectory 
     * @param {BSTR} bstrSharedFolder 
     * @param {VARIANT_BOOL} bForceOverwrite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-setdatabaseinformation
     */
    SetDatabaseInformation(bstrDBDirectory, bstrLogDirectory, bstrSharedFolder, bForceOverwrite) {
        bstrDBDirectory := bstrDBDirectory is String ? BSTR.Alloc(bstrDBDirectory).Value : bstrDBDirectory
        bstrLogDirectory := bstrLogDirectory is String ? BSTR.Alloc(bstrLogDirectory).Value : bstrLogDirectory
        bstrSharedFolder := bstrSharedFolder is String ? BSTR.Alloc(bstrSharedFolder).Value : bstrSharedFolder

        result := ComCall(21, this, "ptr", bstrDBDirectory, "ptr", bstrLogDirectory, "ptr", bstrSharedFolder, "short", bForceOverwrite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrCAConfiguration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-setparentcainformation
     */
    SetParentCAInformation(bstrCAConfiguration) {
        bstrCAConfiguration := bstrCAConfiguration is String ? BSTR.Alloc(bstrCAConfiguration).Value : bstrCAConfiguration

        result := ComCall(22, this, "ptr", bstrCAConfiguration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrCAConfiguration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-setwebcainformation
     */
    SetWebCAInformation(bstrCAConfiguration) {
        bstrCAConfiguration := bstrCAConfiguration is String ? BSTR.Alloc(bstrCAConfiguration).Value : bstrCAConfiguration

        result := ComCall(23, this, "ptr", bstrCAConfiguration, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-install
     */
    Install() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bClientOnly 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-preuninstall
     */
    PreUnInstall(bClientOnly) {
        result := ComCall(25, this, "short", bClientOnly, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/casetup/nf-casetup-icertsrvsetup-postuninstall
     */
    PostUnInstall() {
        result := ComCall(26, this, "HRESULT")
        return result
    }
}
