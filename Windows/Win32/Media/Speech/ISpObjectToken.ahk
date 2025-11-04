#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {PWSTR} pszCategoryId 
     * @param {PWSTR} pszTokenId 
     * @param {BOOL} fCreateIfNotExist 
     * @returns {HRESULT} 
     */
    SetId(pszCategoryId, pszTokenId, fCreateIfNotExist) {
        pszCategoryId := pszCategoryId is String ? StrPtr(pszCategoryId) : pszCategoryId
        pszTokenId := pszTokenId is String ? StrPtr(pszTokenId) : pszTokenId

        result := ComCall(15, this, "ptr", pszCategoryId, "ptr", pszTokenId, "int", fCreateIfNotExist, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppszCoMemTokenId 
     * @returns {HRESULT} 
     */
    GetId(ppszCoMemTokenId) {
        result := ComCall(16, this, "ptr", ppszCoMemTokenId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<ISpObjectTokenCategory>} ppTokenCategory 
     * @returns {HRESULT} 
     */
    GetCategory(ppTokenCategory) {
        result := ComCall(17, this, "ptr*", ppTokenCategory, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pUnkOuter 
     * @param {Integer} dwClsContext 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvObject 
     * @returns {HRESULT} 
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
     * @param {Pointer<PWSTR>} ppszFilePath 
     * @returns {HRESULT} 
     */
    GetStorageFileName(clsidCaller, pszValueName, pszFileNameSpecifier, nFolder, ppszFilePath) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName
        pszFileNameSpecifier := pszFileNameSpecifier is String ? StrPtr(pszFileNameSpecifier) : pszFileNameSpecifier

        result := ComCall(19, this, "ptr", clsidCaller, "ptr", pszValueName, "ptr", pszFileNameSpecifier, "uint", nFolder, "ptr", ppszFilePath, "HRESULT")
        return result
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
     * 
     * @param {Pointer<Guid>} pclsidCaller 
     * @returns {HRESULT} 
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

        result := ComCall(22, this, "ptr", pszTypeOfUI, pvExtraDataMarshal, pvExtraData, "uint", cbExtraData, "ptr", punkObject, "ptr", pfSupported, "HRESULT")
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

        result := ComCall(24, this, "ptr", pszAttributes, "ptr", pfMatches, "HRESULT")
        return result
    }
}
