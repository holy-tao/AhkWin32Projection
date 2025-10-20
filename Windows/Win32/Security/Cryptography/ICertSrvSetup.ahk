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
     * 
     * @param {Pointer<Int32>} pVal 
     * @returns {HRESULT} 
     */
    get_CAErrorId(pVal) {
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
    get_CAErrorString(pVal) {
        result := ComCall(8, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bServer 
     * @param {VARIANT_BOOL} bClient 
     * @returns {HRESULT} 
     */
    InitializeDefaults(bServer, bClient) {
        result := ComCall(9, this, "short", bServer, "short", bClient, "int")
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
    GetCASetupProperty(propertyId, pPropertyValue) {
        result := ComCall(10, this, "int", propertyId, "ptr", pPropertyValue, "int")
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
    SetCASetupProperty(propertyId, pPropertyValue) {
        result := ComCall(11, this, "int", propertyId, "ptr", pPropertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} propertyId 
     * @param {Pointer<VARIANT_BOOL>} pbEditable 
     * @returns {HRESULT} 
     */
    IsPropertyEditable(propertyId, pbEditable) {
        result := ComCall(12, this, "int", propertyId, "ptr", pbEditable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pCATypes 
     * @returns {HRESULT} 
     */
    GetSupportedCATypes(pCATypes) {
        result := ComCall(13, this, "ptr", pCATypes, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     */
    GetProviderNameList(pVal) {
        result := ComCall(14, this, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProviderName 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     */
    GetKeyLengthList(bstrProviderName, pVal) {
        bstrProviderName := bstrProviderName is String ? BSTR.Alloc(bstrProviderName).Value : bstrProviderName

        result := ComCall(15, this, "ptr", bstrProviderName, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProviderName 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     */
    GetHashAlgorithmList(bstrProviderName, pVal) {
        bstrProviderName := bstrProviderName is String ? BSTR.Alloc(bstrProviderName).Value : bstrProviderName

        result := ComCall(16, this, "ptr", bstrProviderName, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrProviderName 
     * @param {Pointer<VARIANT>} pVal 
     * @returns {HRESULT} 
     */
    GetPrivateKeyContainerList(bstrProviderName, pVal) {
        bstrProviderName := bstrProviderName is String ? BSTR.Alloc(bstrProviderName).Value : bstrProviderName

        result := ComCall(17, this, "ptr", bstrProviderName, "ptr", pVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ICertSrvSetupKeyInformationCollection>} ppVal 
     * @returns {HRESULT} 
     */
    GetExistingCACertificates(ppVal) {
        result := ComCall(18, this, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrFileName 
     * @param {BSTR} bstrPasswd 
     * @param {VARIANT_BOOL} bOverwriteExistingKey 
     * @param {Pointer<ICertSrvSetupKeyInformation>} ppVal 
     * @returns {HRESULT} 
     */
    CAImportPFX(bstrFileName, bstrPasswd, bOverwriteExistingKey, ppVal) {
        bstrFileName := bstrFileName is String ? BSTR.Alloc(bstrFileName).Value : bstrFileName
        bstrPasswd := bstrPasswd is String ? BSTR.Alloc(bstrPasswd).Value : bstrPasswd

        result := ComCall(19, this, "ptr", bstrFileName, "ptr", bstrPasswd, "short", bOverwriteExistingKey, "ptr", ppVal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrCADN 
     * @param {VARIANT_BOOL} bIgnoreUnicode 
     * @param {VARIANT_BOOL} bOverwriteExistingKey 
     * @param {VARIANT_BOOL} bOverwriteExistingCAInDS 
     * @returns {HRESULT} 
     */
    SetCADistinguishedName(bstrCADN, bIgnoreUnicode, bOverwriteExistingKey, bOverwriteExistingCAInDS) {
        bstrCADN := bstrCADN is String ? BSTR.Alloc(bstrCADN).Value : bstrCADN

        result := ComCall(20, this, "ptr", bstrCADN, "short", bIgnoreUnicode, "short", bOverwriteExistingKey, "short", bOverwriteExistingCAInDS, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDBDirectory 
     * @param {BSTR} bstrLogDirectory 
     * @param {BSTR} bstrSharedFolder 
     * @param {VARIANT_BOOL} bForceOverwrite 
     * @returns {HRESULT} 
     */
    SetDatabaseInformation(bstrDBDirectory, bstrLogDirectory, bstrSharedFolder, bForceOverwrite) {
        bstrDBDirectory := bstrDBDirectory is String ? BSTR.Alloc(bstrDBDirectory).Value : bstrDBDirectory
        bstrLogDirectory := bstrLogDirectory is String ? BSTR.Alloc(bstrLogDirectory).Value : bstrLogDirectory
        bstrSharedFolder := bstrSharedFolder is String ? BSTR.Alloc(bstrSharedFolder).Value : bstrSharedFolder

        result := ComCall(21, this, "ptr", bstrDBDirectory, "ptr", bstrLogDirectory, "ptr", bstrSharedFolder, "short", bForceOverwrite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrCAConfiguration 
     * @returns {HRESULT} 
     */
    SetParentCAInformation(bstrCAConfiguration) {
        bstrCAConfiguration := bstrCAConfiguration is String ? BSTR.Alloc(bstrCAConfiguration).Value : bstrCAConfiguration

        result := ComCall(22, this, "ptr", bstrCAConfiguration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrCAConfiguration 
     * @returns {HRESULT} 
     */
    SetWebCAInformation(bstrCAConfiguration) {
        bstrCAConfiguration := bstrCAConfiguration is String ? BSTR.Alloc(bstrCAConfiguration).Value : bstrCAConfiguration

        result := ComCall(23, this, "ptr", bstrCAConfiguration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Install() {
        result := ComCall(24, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bClientOnly 
     * @returns {HRESULT} 
     */
    PreUnInstall(bClientOnly) {
        result := ComCall(25, this, "short", bClientOnly, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    PostUnInstall() {
        result := ComCall(26, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
