#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IShellUIHelper2.ahk" { IShellUIHelper2 }
#Import "..\..\System\Variant\VARIANT.ahk" { VARIANT }

/**
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IShellUIHelper3 extends IShellUIHelper2 {
    /**
     * The interface identifier for IShellUIHelper3
     * @type {Guid}
     */
    static IID := Guid("{528df2ec-d419-40bc-9b6d-dcdbf9c1b25d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IShellUIHelper3 interfaces
    */
    struct Vtbl extends IShellUIHelper2.Vtbl {
        AddService                : IntPtr
        IsServiceInstalled        : IntPtr
        InPrivateFilteringEnabled : IntPtr
        AddToFavoritesBar         : IntPtr
        BuildNewTabPage           : IntPtr
        SetRecentlyClosedVisible  : IntPtr
        SetActivitiesVisible      : IntPtr
        ContentDiscoveryReset     : IntPtr
        IsSuggestedSitesEnabled   : IntPtr
        EnableSuggestedSites      : IntPtr
        NavigateToSuggestedSites  : IntPtr
        ShowTabsHelp              : IntPtr
        ShowInPrivateHelp         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IShellUIHelper3.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {BSTR} URL 
     * @returns {HRESULT} 
     */
    AddService(URL) {
        URL := URL is String ? BSTR.Alloc(URL).Value : URL

        result := ComCall(36, this, BSTR, URL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} URL 
     * @param {BSTR} Verb 
     * @returns {Integer} 
     */
    IsServiceInstalled(URL, Verb) {
        URL := URL is String ? BSTR.Alloc(URL).Value : URL
        Verb := Verb is String ? BSTR.Alloc(Verb).Value : Verb

        result := ComCall(37, this, BSTR, URL, BSTR, Verb, "uint*", &pdwResult := 0, "HRESULT")
        return pdwResult
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    InPrivateFilteringEnabled() {
        result := ComCall(38, this, VARIANT_BOOL.Ptr, &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * 
     * @param {BSTR} URL 
     * @param {BSTR} Title 
     * @param {Pointer<VARIANT>} Type 
     * @returns {HRESULT} 
     */
    AddToFavoritesBar(URL, Title, Type) {
        URL := URL is String ? BSTR.Alloc(URL).Value : URL
        Title := Title is String ? BSTR.Alloc(Title).Value : Title

        result := ComCall(39, this, BSTR, URL, BSTR, Title, VARIANT.Ptr, Type, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    BuildNewTabPage() {
        result := ComCall(40, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fVisible 
     * @returns {HRESULT} 
     */
    SetRecentlyClosedVisible(fVisible) {
        result := ComCall(41, this, VARIANT_BOOL, fVisible, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fVisible 
     * @returns {HRESULT} 
     */
    SetActivitiesVisible(fVisible) {
        result := ComCall(42, this, VARIANT_BOOL, fVisible, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ContentDiscoveryReset() {
        result := ComCall(43, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    IsSuggestedSitesEnabled() {
        result := ComCall(44, this, VARIANT_BOOL.Ptr, &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEnable 
     * @returns {HRESULT} 
     */
    EnableSuggestedSites(fEnable) {
        result := ComCall(45, this, VARIANT_BOOL, fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRelativeUrl 
     * @returns {HRESULT} 
     */
    NavigateToSuggestedSites(bstrRelativeUrl) {
        bstrRelativeUrl := bstrRelativeUrl is String ? BSTR.Alloc(bstrRelativeUrl).Value : bstrRelativeUrl

        result := ComCall(46, this, BSTR, bstrRelativeUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowTabsHelp() {
        result := ComCall(47, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowInPrivateHelp() {
        result := ComCall(48, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IShellUIHelper3.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.AddService := CallbackCreate(GetMethod(implObj, "AddService"), flags, 2)
        this.vtbl.IsServiceInstalled := CallbackCreate(GetMethod(implObj, "IsServiceInstalled"), flags, 4)
        this.vtbl.InPrivateFilteringEnabled := CallbackCreate(GetMethod(implObj, "InPrivateFilteringEnabled"), flags, 2)
        this.vtbl.AddToFavoritesBar := CallbackCreate(GetMethod(implObj, "AddToFavoritesBar"), flags, 4)
        this.vtbl.BuildNewTabPage := CallbackCreate(GetMethod(implObj, "BuildNewTabPage"), flags, 1)
        this.vtbl.SetRecentlyClosedVisible := CallbackCreate(GetMethod(implObj, "SetRecentlyClosedVisible"), flags, 2)
        this.vtbl.SetActivitiesVisible := CallbackCreate(GetMethod(implObj, "SetActivitiesVisible"), flags, 2)
        this.vtbl.ContentDiscoveryReset := CallbackCreate(GetMethod(implObj, "ContentDiscoveryReset"), flags, 1)
        this.vtbl.IsSuggestedSitesEnabled := CallbackCreate(GetMethod(implObj, "IsSuggestedSitesEnabled"), flags, 2)
        this.vtbl.EnableSuggestedSites := CallbackCreate(GetMethod(implObj, "EnableSuggestedSites"), flags, 2)
        this.vtbl.NavigateToSuggestedSites := CallbackCreate(GetMethod(implObj, "NavigateToSuggestedSites"), flags, 2)
        this.vtbl.ShowTabsHelp := CallbackCreate(GetMethod(implObj, "ShowTabsHelp"), flags, 1)
        this.vtbl.ShowInPrivateHelp := CallbackCreate(GetMethod(implObj, "ShowInPrivateHelp"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.AddService)
        CallbackFree(this.vtbl.IsServiceInstalled)
        CallbackFree(this.vtbl.InPrivateFilteringEnabled)
        CallbackFree(this.vtbl.AddToFavoritesBar)
        CallbackFree(this.vtbl.BuildNewTabPage)
        CallbackFree(this.vtbl.SetRecentlyClosedVisible)
        CallbackFree(this.vtbl.SetActivitiesVisible)
        CallbackFree(this.vtbl.ContentDiscoveryReset)
        CallbackFree(this.vtbl.IsSuggestedSitesEnabled)
        CallbackFree(this.vtbl.EnableSuggestedSites)
        CallbackFree(this.vtbl.NavigateToSuggestedSites)
        CallbackFree(this.vtbl.ShowTabsHelp)
        CallbackFree(this.vtbl.ShowInPrivateHelp)
    }
}
