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
     * @param {Pointer<VARIANT_BOOL>} pfEnabled 
     * @returns {HRESULT} 
     */
    SqmEnabled(pfEnabled) {
        result := ComCall(24, this, "ptr", pfEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfEnabled 
     * @returns {HRESULT} 
     */
    PhishingEnabled(pfEnabled) {
        result := ComCall(25, this, "ptr", pfEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUri 
     * @returns {HRESULT} 
     */
    BrandImageUri(pbstrUri) {
        result := ComCall(26, this, "ptr", pbstrUri, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pdwResult 
     * @returns {HRESULT} 
     */
    IsSearchProviderInstalled(URL, pdwResult) {
        URL := URL is String ? BSTR.Alloc(URL).Value : URL

        pdwResultMarshal := pdwResult is VarRef ? "uint*" : "ptr"

        result := ComCall(30, this, "ptr", URL, pdwResultMarshal, pdwResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pfMigrated 
     * @returns {HRESULT} 
     */
    IsSearchMigrated(pfMigrated) {
        result := ComCall(31, this, "ptr", pfMigrated, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     */
    DefaultSearchProvider(pbstrName) {
        result := ComCall(32, this, "ptr", pbstrName, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pfShown 
     * @returns {HRESULT} 
     */
    RunOnceHasShown(pfShown) {
        result := ComCall(34, this, "ptr", pfShown, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrUrl 
     * @returns {HRESULT} 
     */
    SearchGuideUrl(pbstrUrl) {
        result := ComCall(35, this, "ptr", pbstrUrl, "HRESULT")
        return result
    }
}
