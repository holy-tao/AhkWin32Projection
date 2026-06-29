#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IShellUIHelper.ahk" { IShellUIHelper }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellUIHelper2 extends IShellUIHelper {
    /**
     * The interface identifier for IShellUIHelper2
     * @type {Guid}
     */
    static IID := Guid("{a7fe6eda-1932-4281-b881-87b31b8bc52c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellUIHelper2 interfaces
    */
    struct Vtbl extends IShellUIHelper.Vtbl {
        AddSearchProvider               : IntPtr
        RunOnceShown                    : IntPtr
        SkipRunOnce                     : IntPtr
        CustomizeSettings               : IntPtr
        SqmEnabled                      : IntPtr
        PhishingEnabled                 : IntPtr
        BrandImageUri                   : IntPtr
        SkipTabsWelcome                 : IntPtr
        DiagnoseConnection              : IntPtr
        CustomizeClearType              : IntPtr
        IsSearchProviderInstalled       : IntPtr
        IsSearchMigrated                : IntPtr
        DefaultSearchProvider           : IntPtr
        RunOnceRequiredSettingsComplete : IntPtr
        RunOnceHasShown                 : IntPtr
        SearchGuideUrl                  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellUIHelper2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} URL 
     * @returns {HRESULT} 
     */
    AddSearchProvider(URL) {
        URL := URL is String ? BSTR.Alloc(URL).Value : URL

        result := ComCall(20, this, BSTR, URL, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    RunOnceShown() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SkipRunOnce() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fSQM 
     * @param {VARIANT_BOOL} fPhishing 
     * @param {BSTR} bstrLocale 
     * @returns {HRESULT} 
     */
    CustomizeSettings(fSQM, fPhishing, bstrLocale) {
        bstrLocale := bstrLocale is String ? BSTR.Alloc(bstrLocale).Value : bstrLocale

        result := ComCall(23, this, VARIANT_BOOL, fSQM, VARIANT_BOOL, fPhishing, BSTR, bstrLocale, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    SqmEnabled() {
        result := ComCall(24, this, VARIANT_BOOL.Ptr, &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    PhishingEnabled() {
        result := ComCall(25, this, VARIANT_BOOL.Ptr, &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * 
     * @returns {BSTR} 
     */
    BrandImageUri() {
        pbstrUri := BSTR.Owned()
        result := ComCall(26, this, BSTR.Ptr, pbstrUri, "HRESULT")
        return pbstrUri
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SkipTabsWelcome() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    DiagnoseConnection() {
        result := ComCall(28, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fSet 
     * @returns {HRESULT} 
     */
    CustomizeClearType(fSet) {
        result := ComCall(29, this, VARIANT_BOOL, fSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} URL 
     * @returns {Integer} 
     */
    IsSearchProviderInstalled(URL) {
        URL := URL is String ? BSTR.Alloc(URL).Value : URL

        result := ComCall(30, this, BSTR, URL, "uint*", &pdwResult := 0, "HRESULT")
        return pdwResult
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    IsSearchMigrated() {
        result := ComCall(31, this, VARIANT_BOOL.Ptr, &pfMigrated := 0, "HRESULT")
        return pfMigrated
    }

    /**
     * 
     * @returns {BSTR} 
     */
    DefaultSearchProvider() {
        pbstrName := BSTR.Owned()
        result := ComCall(32, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {VARIANT_BOOL} fComplete 
     * @returns {HRESULT} 
     */
    RunOnceRequiredSettingsComplete(fComplete) {
        result := ComCall(33, this, VARIANT_BOOL, fComplete, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    RunOnceHasShown() {
        result := ComCall(34, this, VARIANT_BOOL.Ptr, &pfShown := 0, "HRESULT")
        return pfShown
    }

    /**
     * 
     * @returns {BSTR} 
     */
    SearchGuideUrl() {
        pbstrUrl := BSTR.Owned()
        result := ComCall(35, this, BSTR.Ptr, pbstrUrl, "HRESULT")
        return pbstrUrl
    }

    Query(iid) {
        if (IShellUIHelper2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddSearchProvider := CallbackCreate(GetMethod(implObj, "AddSearchProvider"), flags, 2)
        this.vtbl.RunOnceShown := CallbackCreate(GetMethod(implObj, "RunOnceShown"), flags, 1)
        this.vtbl.SkipRunOnce := CallbackCreate(GetMethod(implObj, "SkipRunOnce"), flags, 1)
        this.vtbl.CustomizeSettings := CallbackCreate(GetMethod(implObj, "CustomizeSettings"), flags, 4)
        this.vtbl.SqmEnabled := CallbackCreate(GetMethod(implObj, "SqmEnabled"), flags, 2)
        this.vtbl.PhishingEnabled := CallbackCreate(GetMethod(implObj, "PhishingEnabled"), flags, 2)
        this.vtbl.BrandImageUri := CallbackCreate(GetMethod(implObj, "BrandImageUri"), flags, 2)
        this.vtbl.SkipTabsWelcome := CallbackCreate(GetMethod(implObj, "SkipTabsWelcome"), flags, 1)
        this.vtbl.DiagnoseConnection := CallbackCreate(GetMethod(implObj, "DiagnoseConnection"), flags, 1)
        this.vtbl.CustomizeClearType := CallbackCreate(GetMethod(implObj, "CustomizeClearType"), flags, 2)
        this.vtbl.IsSearchProviderInstalled := CallbackCreate(GetMethod(implObj, "IsSearchProviderInstalled"), flags, 3)
        this.vtbl.IsSearchMigrated := CallbackCreate(GetMethod(implObj, "IsSearchMigrated"), flags, 2)
        this.vtbl.DefaultSearchProvider := CallbackCreate(GetMethod(implObj, "DefaultSearchProvider"), flags, 2)
        this.vtbl.RunOnceRequiredSettingsComplete := CallbackCreate(GetMethod(implObj, "RunOnceRequiredSettingsComplete"), flags, 2)
        this.vtbl.RunOnceHasShown := CallbackCreate(GetMethod(implObj, "RunOnceHasShown"), flags, 2)
        this.vtbl.SearchGuideUrl := CallbackCreate(GetMethod(implObj, "SearchGuideUrl"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddSearchProvider)
        CallbackFree(this.vtbl.RunOnceShown)
        CallbackFree(this.vtbl.SkipRunOnce)
        CallbackFree(this.vtbl.CustomizeSettings)
        CallbackFree(this.vtbl.SqmEnabled)
        CallbackFree(this.vtbl.PhishingEnabled)
        CallbackFree(this.vtbl.BrandImageUri)
        CallbackFree(this.vtbl.SkipTabsWelcome)
        CallbackFree(this.vtbl.DiagnoseConnection)
        CallbackFree(this.vtbl.CustomizeClearType)
        CallbackFree(this.vtbl.IsSearchProviderInstalled)
        CallbackFree(this.vtbl.IsSearchMigrated)
        CallbackFree(this.vtbl.DefaultSearchProvider)
        CallbackFree(this.vtbl.RunOnceRequiredSettingsComplete)
        CallbackFree(this.vtbl.RunOnceHasShown)
        CallbackFree(this.vtbl.SearchGuideUrl)
    }
}
