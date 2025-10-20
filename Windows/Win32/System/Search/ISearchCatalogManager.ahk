#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods to manage a search catalog for purposes such as re-indexing or setting timeouts.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchcatalogmanager
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchCatalogManager extends IUnknown{
    /**
     * The interface identifier for ISearchCatalogManager
     * @type {Guid}
     */
    static IID => Guid("{ab310581-ac80-11d1-8df3-00c04fb6ef50}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} pszName 
     * @returns {HRESULT} 
     */
    get_Name(pszName) {
        result := ComCall(3, this, "ptr", pszName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<PROPVARIANT>} ppValue 
     * @returns {HRESULT} 
     */
    GetParameter(pszName, ppValue) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "ptr", pszName, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     */
    SetParameter(pszName, pValue) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pStatus 
     * @param {Pointer<Int32>} pPausedReason 
     * @returns {HRESULT} 
     */
    GetCatalogStatus(pStatus, pPausedReason) {
        result := ComCall(6, this, "int*", pStatus, "int*", pPausedReason, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reset() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reindex() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszPattern 
     * @returns {HRESULT} 
     */
    ReindexMatchingURLs(pszPattern) {
        pszPattern := pszPattern is String ? StrPtr(pszPattern) : pszPattern

        result := ComCall(9, this, "ptr", pszPattern, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszRootURL 
     * @returns {HRESULT} 
     */
    ReindexSearchRoot(pszRootURL) {
        pszRootURL := pszRootURL is String ? StrPtr(pszRootURL) : pszRootURL

        result := ComCall(10, this, "ptr", pszRootURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwConnectTimeout 
     * @returns {HRESULT} 
     */
    put_ConnectTimeout(dwConnectTimeout) {
        result := ComCall(11, this, "uint", dwConnectTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwConnectTimeout 
     * @returns {HRESULT} 
     */
    get_ConnectTimeout(pdwConnectTimeout) {
        result := ComCall(12, this, "uint*", pdwConnectTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwDataTimeout 
     * @returns {HRESULT} 
     */
    put_DataTimeout(dwDataTimeout) {
        result := ComCall(13, this, "uint", dwDataTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwDataTimeout 
     * @returns {HRESULT} 
     */
    get_DataTimeout(pdwDataTimeout) {
        result := ComCall(14, this, "uint*", pdwDataTimeout, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plCount 
     * @returns {HRESULT} 
     */
    NumberOfItems(plCount) {
        result := ComCall(15, this, "int*", plCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} plIncrementalCount 
     * @param {Pointer<Int32>} plNotificationQueue 
     * @param {Pointer<Int32>} plHighPriorityQueue 
     * @returns {HRESULT} 
     */
    NumberOfItemsToIndex(plIncrementalCount, plNotificationQueue, plHighPriorityQueue) {
        result := ComCall(16, this, "int*", plIncrementalCount, "int*", plNotificationQueue, "int*", plHighPriorityQueue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} pszUrl 
     * @returns {HRESULT} 
     */
    URLBeingIndexed(pszUrl) {
        result := ComCall(17, this, "ptr", pszUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszURL 
     * @param {Pointer<UInt32>} pdwState 
     * @returns {HRESULT} 
     */
    GetURLIndexingState(pszURL, pdwState) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(18, this, "ptr", pszURL, "uint*", pdwState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISearchPersistentItemsChangedSink>} ppISearchPersistentItemsChangedSink 
     * @returns {HRESULT} 
     */
    GetPersistentItemsChangedSink(ppISearchPersistentItemsChangedSink) {
        result := ComCall(19, this, "ptr", ppISearchPersistentItemsChangedSink, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszView 
     * @param {Pointer<ISearchViewChangedSink>} pViewChangedSink 
     * @param {Pointer<UInt32>} pdwCookie 
     * @returns {HRESULT} 
     */
    RegisterViewForNotification(pszView, pViewChangedSink, pdwCookie) {
        pszView := pszView is String ? StrPtr(pszView) : pszView

        result := ComCall(20, this, "ptr", pszView, "ptr", pViewChangedSink, "uint*", pdwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISearchNotifyInlineSite>} pISearchNotifyInlineSite 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @param {Pointer<Guid>} pGUIDCatalogResetSignature 
     * @param {Pointer<Guid>} pGUIDCheckPointSignature 
     * @param {Pointer<UInt32>} pdwLastCheckPointNumber 
     * @returns {HRESULT} 
     */
    GetItemsChangedSink(pISearchNotifyInlineSite, riid, ppv, pGUIDCatalogResetSignature, pGUIDCheckPointSignature, pdwLastCheckPointNumber) {
        result := ComCall(21, this, "ptr", pISearchNotifyInlineSite, "ptr", riid, "ptr", ppv, "ptr", pGUIDCatalogResetSignature, "ptr", pGUIDCheckPointSignature, "uint*", pdwLastCheckPointNumber, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     */
    UnregisterViewForNotification(dwCookie) {
        result := ComCall(22, this, "uint", dwCookie, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszExtension 
     * @param {BOOL} fExclude 
     * @returns {HRESULT} 
     */
    SetExtensionClusion(pszExtension, fExclude) {
        pszExtension := pszExtension is String ? StrPtr(pszExtension) : pszExtension

        result := ComCall(23, this, "ptr", pszExtension, "int", fExclude, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumString>} ppExtensions 
     * @returns {HRESULT} 
     */
    EnumerateExcludedExtensions(ppExtensions) {
        result := ComCall(24, this, "ptr", ppExtensions, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISearchQueryHelper>} ppSearchQueryHelper 
     * @returns {HRESULT} 
     */
    GetQueryHelper(ppSearchQueryHelper) {
        result := ComCall(25, this, "ptr", ppSearchQueryHelper, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fDiacriticSensitive 
     * @returns {HRESULT} 
     */
    put_DiacriticSensitivity(fDiacriticSensitive) {
        result := ComCall(26, this, "int", fDiacriticSensitive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfDiacriticSensitive 
     * @returns {HRESULT} 
     */
    get_DiacriticSensitivity(pfDiacriticSensitive) {
        result := ComCall(27, this, "ptr", pfDiacriticSensitive, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISearchCrawlScopeManager>} ppCrawlScopeManager 
     * @returns {HRESULT} 
     */
    GetCrawlScopeManager(ppCrawlScopeManager) {
        result := ComCall(28, this, "ptr", ppCrawlScopeManager, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
