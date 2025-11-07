#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IShellUIHelper.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IShellUIHelper2 extends IShellUIHelper{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IShellUIHelper2
     * @type {Guid}
     */
    static IID => Guid("{a7fe6eda-1932-4281-b881-87b31b8bc52c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddSearchProvider", "RunOnceShown", "SkipRunOnce", "CustomizeSettings", "SqmEnabled", "PhishingEnabled", "BrandImageUri", "SkipTabsWelcome", "DiagnoseConnection", "CustomizeClearType", "IsSearchProviderInstalled", "IsSearchMigrated", "DefaultSearchProvider", "RunOnceRequiredSettingsComplete", "RunOnceHasShown", "SearchGuideUrl"]

    /**
     * 
     * @param {BSTR} URL 
     * @returns {HRESULT} 
     */
    AddSearchProvider(URL) {
        URL := URL is String ? BSTR.Alloc(URL).Value : URL

        result := ComCall(20, this, "ptr", URL, "HRESULT")
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

        result := ComCall(23, this, "short", fSQM, "short", fPhishing, "ptr", bstrLocale, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    SqmEnabled() {
        result := ComCall(24, this, "short*", &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    PhishingEnabled() {
        result := ComCall(25, this, "short*", &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * 
     * @returns {BSTR} 
     */
    BrandImageUri() {
        pbstrUri := BSTR()
        result := ComCall(26, this, "ptr", pbstrUri, "HRESULT")
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
        result := ComCall(29, this, "short", fSet, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} URL 
     * @returns {Integer} 
     */
    IsSearchProviderInstalled(URL) {
        URL := URL is String ? BSTR.Alloc(URL).Value : URL

        result := ComCall(30, this, "ptr", URL, "uint*", &pdwResult := 0, "HRESULT")
        return pdwResult
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    IsSearchMigrated() {
        result := ComCall(31, this, "short*", &pfMigrated := 0, "HRESULT")
        return pfMigrated
    }

    /**
     * 
     * @returns {BSTR} 
     */
    DefaultSearchProvider() {
        pbstrName := BSTR()
        result := ComCall(32, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * 
     * @param {VARIANT_BOOL} fComplete 
     * @returns {HRESULT} 
     */
    RunOnceRequiredSettingsComplete(fComplete) {
        result := ComCall(33, this, "short", fComplete, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    RunOnceHasShown() {
        result := ComCall(34, this, "short*", &pfShown := 0, "HRESULT")
        return pfShown
    }

    /**
     * 
     * @returns {BSTR} 
     */
    SearchGuideUrl() {
        pbstrUrl := BSTR()
        result := ComCall(35, this, "ptr", pbstrUrl, "HRESULT")
        return pbstrUrl
    }
}
