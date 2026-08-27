#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\ISpDataKey.ahk" { ISpDataKey }
#Import ".\ISpObjectTokenCategory.ahk" { ISpObjectTokenCategory }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.Media.Speech
 */
export default struct ISpObjectToken extends ISpDataKey {
    /**
     * The interface identifier for ISpObjectToken
     * @type {Guid}
     */
    static IID := Guid("{14056589-e16c-11d2-bb90-00c04f8ee6c0}")

    /**
     * The class identifier for SpObjectToken
     * @type {Guid}
     */
    static CLSID := Guid("{ef411752-3736-4cb4-9c8c-8ef4ccb58efe}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISpObjectToken interfaces
    */
    struct Vtbl extends ISpDataKey.Vtbl {
        SetId                 : IntPtr
        GetId                 : IntPtr
        GetCategory           : IntPtr
        CreateInstance        : IntPtr
        GetStorageFileName    : IntPtr
        RemoveStorageFileName : IntPtr
        Remove                : IntPtr
        IsUISupported         : IntPtr
        DisplayUI             : IntPtr
        MatchesAttributes     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISpObjectToken.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @param {PWSTR} pszCategoryId 
     * @param {PWSTR} pszTokenId 
     * @param {BOOL} fCreateIfNotExist 
     * @returns {HRESULT} 
     */
    SetId(pszCategoryId, pszTokenId, fCreateIfNotExist) {
        pszCategoryId := pszCategoryId is String ? StrPtr(pszCategoryId) : pszCategoryId
        pszTokenId := pszTokenId is String ? StrPtr(pszTokenId) : pszTokenId

        pszCategoryIdMarshal := pszCategoryId == 0 ? IntPtr : PWSTR

        result := ComCall(15, this, pszCategoryIdMarshal, pszCategoryId, "ptr", pszTokenId, BOOL, fCreateIfNotExist, "HRESULT")
        return result
    }

    /**
     * @returns {PWSTR} 
     */
    GetId() {
        result := ComCall(16, this, PWSTR.Ptr, &ppszCoMemTokenId := 0, "HRESULT")
        return ppszCoMemTokenId
    }

    /**
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
        ppvObjectMarshal := ppvObject is VarRef ? "ptr*" : IntPtr

        result := ComCall(18, this, "ptr", pUnkOuter, UInt32, dwClsContext, Guid.Ptr, riid, ppvObjectMarshal, ppvObject, "HRESULT")
        return result
    }

    /**
     * @param {Pointer<Guid>} clsidCaller 
     * @param {PWSTR} pszValueName 
     * @param {PWSTR} pszFileNameSpecifier 
     * @param {Integer} nFolder 
     * @returns {PWSTR} 
     */
    GetStorageFileName(clsidCaller, pszValueName, pszFileNameSpecifier, nFolder) {
        pszValueName := pszValueName is String ? StrPtr(pszValueName) : pszValueName
        pszFileNameSpecifier := pszFileNameSpecifier is String ? StrPtr(pszFileNameSpecifier) : pszFileNameSpecifier

        pszFileNameSpecifierMarshal := pszFileNameSpecifier == 0 ? IntPtr : PWSTR

        result := ComCall(19, this, Guid.Ptr, clsidCaller, "ptr", pszValueName, pszFileNameSpecifierMarshal, pszFileNameSpecifier, UInt32, nFolder, PWSTR.Ptr, &ppszFilePath := 0, "HRESULT")
        return ppszFilePath
    }

    /**
     * @param {Pointer<Guid>} clsidCaller 
     * @param {PWSTR} pszKeyName 
     * @param {BOOL} fDeleteFile 
     * @returns {HRESULT} 
     */
    RemoveStorageFileName(clsidCaller, pszKeyName, fDeleteFile) {
        pszKeyName := pszKeyName is String ? StrPtr(pszKeyName) : pszKeyName

        result := ComCall(20, this, Guid.Ptr, clsidCaller, "ptr", pszKeyName, BOOL, fDeleteFile, "HRESULT")
        return result
    }

    /**
     * @param {Pointer<Guid>} pclsidCaller 
     * @returns {HRESULT} 
     */
    Remove(pclsidCaller) {
        pclsidCallerMarshal := pclsidCaller == 0 ? IntPtr : Guid.Ptr

        result := ComCall(21, this, pclsidCallerMarshal, pclsidCaller, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} pszTypeOfUI 
     * @param {Pointer<Void>} pvExtraData 
     * @param {Integer} cbExtraData 
     * @param {IUnknown} punkObject 
     * @param {Pointer<BOOL>} pfSupported 
     * @returns {HRESULT} 
     */
    IsUISupported(pszTypeOfUI, pvExtraData, cbExtraData, punkObject, pfSupported) {
        pszTypeOfUI := pszTypeOfUI is String ? StrPtr(pszTypeOfUI) : pszTypeOfUI

        pvExtraDataMarshal := pvExtraData is VarRef ? "ptr" : IntPtr
        pfSupportedMarshal := pfSupported is VarRef ? "int*" : IntPtr

        result := ComCall(22, this, "ptr", pszTypeOfUI, pvExtraDataMarshal, pvExtraData, UInt32, cbExtraData, "ptr", punkObject, pfSupportedMarshal, pfSupported, "HRESULT")
        return result
    }

    /**
     * @param {HWND} hwndParent 
     * @param {PWSTR} pszTitle 
     * @param {PWSTR} pszTypeOfUI 
     * @param {Pointer<Void>} pvExtraData 
     * @param {Integer} cbExtraData 
     * @param {IUnknown} punkObject 
     * @returns {HRESULT} 
     */
    DisplayUI(hwndParent, pszTitle, pszTypeOfUI, pvExtraData, cbExtraData, punkObject) {
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle
        pszTypeOfUI := pszTypeOfUI is String ? StrPtr(pszTypeOfUI) : pszTypeOfUI

        pvExtraDataMarshal := pvExtraData is VarRef ? "ptr" : IntPtr

        result := ComCall(23, this, HWND, hwndParent, "ptr", pszTitle, "ptr", pszTypeOfUI, pvExtraDataMarshal, pvExtraData, UInt32, cbExtraData, "ptr", punkObject, "HRESULT")
        return result
    }

    /**
     * @param {PWSTR} pszAttributes 
     * @param {Pointer<BOOL>} pfMatches 
     * @returns {HRESULT} 
     */
    MatchesAttributes(pszAttributes, pfMatches) {
        pszAttributes := pszAttributes is String ? StrPtr(pszAttributes) : pszAttributes

        pfMatchesMarshal := pfMatches is VarRef ? "int*" : IntPtr

        result := ComCall(24, this, "ptr", pszAttributes, pfMatchesMarshal, pfMatches, "HRESULT")
        return result
    }

    _Query(iid) {
        if (ISpObjectToken.IID.Equals(iid)) {
            return true
        }
        return super._Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetId := CallbackCreate(ObjBindMethod(implObj, "SetId"), flags, 4)
        this.vtbl.GetId := CallbackCreate(ObjBindMethod(implObj, "GetId"), flags, 2)
        this.vtbl.GetCategory := CallbackCreate(ObjBindMethod(implObj, "GetCategory"), flags, 2)
        this.vtbl.CreateInstance := CallbackCreate(ObjBindMethod(implObj, "CreateInstance"), flags, 5)
        this.vtbl.GetStorageFileName := CallbackCreate(ObjBindMethod(implObj, "GetStorageFileName"), flags, 6)
        this.vtbl.RemoveStorageFileName := CallbackCreate(ObjBindMethod(implObj, "RemoveStorageFileName"), flags, 4)
        this.vtbl.Remove := CallbackCreate(ObjBindMethod(implObj, "Remove"), flags, 2)
        this.vtbl.IsUISupported := CallbackCreate(ObjBindMethod(implObj, "IsUISupported"), flags, 6)
        this.vtbl.DisplayUI := CallbackCreate(ObjBindMethod(implObj, "DisplayUI"), flags, 7)
        this.vtbl.MatchesAttributes := CallbackCreate(ObjBindMethod(implObj, "MatchesAttributes"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetId)
        CallbackFree(this.vtbl.GetId)
        CallbackFree(this.vtbl.GetCategory)
        CallbackFree(this.vtbl.CreateInstance)
        CallbackFree(this.vtbl.GetStorageFileName)
        CallbackFree(this.vtbl.RemoveStorageFileName)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.IsUISupported)
        CallbackFree(this.vtbl.DisplayUI)
        CallbackFree(this.vtbl.MatchesAttributes)
    }
}
