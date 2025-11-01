#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IShellUIHelper2.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellUIHelper3 extends IShellUIHelper2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellUIHelper3
     * @type {Guid}
     */
    static IID => Guid("{528df2ec-d419-40bc-9b6d-dcdbf9c1b25d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 36

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddService", "IsServiceInstalled", "InPrivateFilteringEnabled", "AddToFavoritesBar", "BuildNewTabPage", "SetRecentlyClosedVisible", "SetActivitiesVisible", "ContentDiscoveryReset", "IsSuggestedSitesEnabled", "EnableSuggestedSites", "NavigateToSuggestedSites", "ShowTabsHelp", "ShowInPrivateHelp"]

    /**
     * 
     * @param {BSTR} URL 
     * @returns {HRESULT} 
     */
    AddService(URL) {
        URL := URL is String ? BSTR.Alloc(URL).Value : URL

        result := ComCall(36, this, "ptr", URL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} URL 
     * @param {BSTR} Verb 
     * @param {Pointer<Integer>} pdwResult 
     * @returns {HRESULT} 
     */
    IsServiceInstalled(URL, Verb, pdwResult) {
        URL := URL is String ? BSTR.Alloc(URL).Value : URL
        Verb := Verb is String ? BSTR.Alloc(Verb).Value : Verb

        result := ComCall(37, this, "ptr", URL, "ptr", Verb, "uint*", pdwResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfEnabled 
     * @returns {HRESULT} 
     */
    InPrivateFilteringEnabled(pfEnabled) {
        result := ComCall(38, this, "ptr", pfEnabled, "HRESULT")
        return result
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

        result := ComCall(39, this, "ptr", URL, "ptr", Title, "ptr", Type, "HRESULT")
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
        result := ComCall(41, this, "short", fVisible, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fVisible 
     * @returns {HRESULT} 
     */
    SetActivitiesVisible(fVisible) {
        result := ComCall(42, this, "short", fVisible, "HRESULT")
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
     * @param {Pointer<VARIANT_BOOL>} pfEnabled 
     * @returns {HRESULT} 
     */
    IsSuggestedSitesEnabled(pfEnabled) {
        result := ComCall(44, this, "ptr", pfEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} fEnable 
     * @returns {HRESULT} 
     */
    EnableSuggestedSites(fEnable) {
        result := ComCall(45, this, "short", fEnable, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRelativeUrl 
     * @returns {HRESULT} 
     */
    NavigateToSuggestedSites(bstrRelativeUrl) {
        bstrRelativeUrl := bstrRelativeUrl is String ? BSTR.Alloc(bstrRelativeUrl).Value : bstrRelativeUrl

        result := ComCall(46, this, "ptr", bstrRelativeUrl, "HRESULT")
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
}
