#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISpObjectTokenCategory.ahk
#Include .\ISpDataKey.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpObjectToken extends ISpDataKey{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpObjectToken
     * @type {Guid}
     */
    static IID => Guid("{14056589-e16c-11d2-bb90-00c04f8ee6c0}")

    /**
     * The class identifier for SpObjectToken
     * @type {Guid}
     */
    static CLSID => Guid("{ef411752-3736-4cb4-9c8c-8ef4ccb58efe}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 15

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetId", "GetId", "GetCategory", "CreateInstance", "GetStorageFileName", "RemoveStorageFileName", "Remove", "IsUISupported", "DisplayUI", "MatchesAttributes"]

    /**
     * Sets the specified identifier string in the volume's metadata.
     * @param {PWSTR} pszCategoryId 
     * @param {PWSTR} pszTokenId 
     * @param {BOOL} fCreateIfNotExist 
     * @returns {HRESULT} Type: **uint32**
     * 
     * This method returns one of the following codes or another error code if it fails.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                                                  | Description                                                                                                     |
     * |------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl>                                  | The method was successful.<br/>                                                                           |
     * | <dl> <dt>**FVE\_E\_LOCKED\_VOLUME**</dt> <dt>2150694912 (0x80310000)</dt> </dl> | This drive is locked by BitLocker Drive Encryption. You must unlock this volume from Control Panel. <br/> |
     * | <dl> <dt>**FVE\_E\_NOT\_ACTIVATED**</dt> <dt>2150694920 (0x80310008)</dt> </dl> | BitLocker is not enabled on the volume. Add a key protector to enable BitLocker. <br/>                    |
     * @see https://learn.microsoft.com/windows/win32/SecProv/setidentificationfield-win32-encryptablevolume
     */
    SetId(pszCategoryId, pszTokenId, fCreateIfNotExist) {
        pszCategoryId := pszCategoryId is String ? StrPtr(pszCategoryId) : pszCategoryId
        pszTokenId := pszTokenId is String ? StrPtr(pszTokenId) : pszTokenId

        result := ComCall(15, this, "ptr", pszCategoryId, "ptr", pszTokenId, "int", fCreateIfNotExist, "HRESULT")
        return result
    }

    /**
     * Returns the identifier string available in the volume's metadata.
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/SecProv/getidentificationfield-win32-encryptablevolume
     */
    GetId() {
        result := ComCall(16, this, "ptr*", &ppszCoMemTokenId := 0, "HRESULT")
        return ppszCoMemTokenId
    }

    /**
     * 
     * @returns {ISpObjectTokenCategory} 
     */
    GetCategory() {
        result := ComCall(17, this, "ptr*", &ppTokenCategory := 0, "HRESULT")
        return ISpObjectTokenCategory(ppTokenCategory)
    }

    /**
     * The CWbemGlueFactory class is part of the WMI Provider Framework. The Provider Framework implements methods of this interface internally to create new instances of classes for the provider.
     * @remarks
     * The destructor for the class is <b>CWbemGlueFactory::~CWbemGlueFactory.</b>
     * @param {IUnknown} pUnkOuter 
     * @param {Integer} dwClsContext 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wbemglue/nl-wbemglue-cwbemgluefactory
     */
    CreateInstance(pUnkOuter, dwClsContext, riid, ppvObject) {
        ppvObjectMarshal := ppvObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(18, this, "ptr", pUnkOuter, "uint", dwClsContext, "ptr", riid, ppvObjectMarshal, ppvObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} clsidCaller 
     * @param {PWSTR} pszValueName 
     * @param {PWSTR} pszFileNameSpecifier 
     * @param {Integer} nFolder 
     * @returns {PWSTR} 
     */
    GetStorageFileName(clsidCaller, pszValueName, pszFileNameSpecifier, nFolder) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName
        pszFileNameSpecifier := pszFileNameSpecifier is String ? StrPtr(pszFileNameSpecifier) : pszFileNameSpecifier

        result := ComCall(19, this, "ptr", clsidCaller, "ptr", pszValueName, "ptr", pszFileNameSpecifier, "uint", nFolder, "ptr*", &ppszFilePath := 0, "HRESULT")
        return ppszFilePath
    }

    /**
     * 
     * @param {Pointer<Guid>} clsidCaller 
     * @param {PWSTR} pszKeyName 
     * @param {BOOL} fDeleteFile 
     * @returns {HRESULT} 
     */
    RemoveStorageFileName(clsidCaller, pszKeyName, fDeleteFile) {
        pszKeyName := pszKeyName is String ? StrPtr(pszKeyName) : pszKeyName

        result := ComCall(20, this, "ptr", clsidCaller, "ptr", pszKeyName, "int", fDeleteFile, "HRESULT")
        return result
    }

    /**
     * Removes a TPM command from the local list of commands blocked from running on the computer.
     * @remarks
     * Managed Object Format (MOF) files contain the definitions for Windows Management Instrumentation (WMI) classes. MOF files are not installed as part of the Windows SDK. They are installed on the server when you add the associated role by using the Server Manager. For more information about MOF files, see [Managed Object Format (MOF)](../wmisdk/managed-object-format--mof-.md).
     * @param {Pointer<Guid>} pclsidCaller 
     * @returns {HRESULT} Type: **uint32**
     * 
     * All TPM errors as well as errors specific to TPM Base Services can be returned.
     * 
     * Common return codes are listed below.
     * 
     * 
     * 
     * | Return code/value                                                                                                                                 | Description                           |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------|
     * | <dl> <dt>**S\_OK**</dt> <dt>0 (0x0)</dt> </dl> | The method was successful.<br/> |
     * @see https://learn.microsoft.com/windows/win32/SecProv/removeblockedcommand-win32-tpm
     */
    Remove(pclsidCaller) {
        result := ComCall(21, this, "ptr", pclsidCaller, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszTypeOfUI 
     * @param {Pointer<Void>} pvExtraData 
     * @param {Integer} cbExtraData 
     * @param {IUnknown} punkObject 
     * @param {Pointer<BOOL>} pfSupported 
     * @returns {HRESULT} 
     */
    IsUISupported(pszTypeOfUI, pvExtraData, cbExtraData, punkObject, pfSupported) {
        pszTypeOfUI := pszTypeOfUI is String ? StrPtr(pszTypeOfUI) : pszTypeOfUI

        pvExtraDataMarshal := pvExtraData is VarRef ? "ptr" : "ptr"
        pfSupportedMarshal := pfSupported is VarRef ? "int*" : "ptr"

        result := ComCall(22, this, "ptr", pszTypeOfUI, pvExtraDataMarshal, pvExtraData, "uint", cbExtraData, "ptr", punkObject, pfSupportedMarshal, pfSupported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {PWSTR} pszTitle 
     * @param {PWSTR} pszTypeOfUI 
     * @param {Pointer<Void>} pvExtraData 
     * @param {Integer} cbExtraData 
     * @param {IUnknown} punkObject 
     * @returns {HRESULT} 
     */
    DisplayUI(hwndParent, pszTitle, pszTypeOfUI, pvExtraData, cbExtraData, punkObject) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle
        pszTypeOfUI := pszTypeOfUI is String ? StrPtr(pszTypeOfUI) : pszTypeOfUI

        pvExtraDataMarshal := pvExtraData is VarRef ? "ptr" : "ptr"

        result := ComCall(23, this, "ptr", hwndParent, "ptr", pszTitle, "ptr", pszTypeOfUI, pvExtraDataMarshal, pvExtraData, "uint", cbExtraData, "ptr", punkObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszAttributes 
     * @param {Pointer<BOOL>} pfMatches 
     * @returns {HRESULT} 
     */
    MatchesAttributes(pszAttributes, pfMatches) {
        pszAttributes := pszAttributes is String ? StrPtr(pszAttributes) : pszAttributes

        pfMatchesMarshal := pfMatches is VarRef ? "int*" : "ptr"

        result := ComCall(24, this, "ptr", pszAttributes, pfMatchesMarshal, pfMatches, "HRESULT")
        return result
    }
}
