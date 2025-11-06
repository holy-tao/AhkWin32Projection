#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISearchPersistentItemsChangedSink.ahk
#Include ..\Com\IEnumString.ahk
#Include .\ISearchQueryHelper.ahk
#Include .\ISearchCrawlScopeManager.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Provides methods to manage a search catalog for purposes such as re-indexing or setting timeouts.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-isearchcatalogmanager
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class ISearchCatalogManager extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "GetParameter", "SetParameter", "GetCatalogStatus", "Reset", "Reindex", "ReindexMatchingURLs", "ReindexSearchRoot", "put_ConnectTimeout", "get_ConnectTimeout", "put_DataTimeout", "get_DataTimeout", "NumberOfItems", "NumberOfItemsToIndex", "URLBeingIndexed", "GetURLIndexingState", "GetPersistentItemsChangedSink", "RegisterViewForNotification", "GetItemsChangedSink", "UnregisterViewForNotification", "SetExtensionClusion", "EnumerateExcludedExtensions", "GetQueryHelper", "put_DiacriticSensitivity", "get_DiacriticSensitivity", "GetCrawlScopeManager"]

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-get_name
     */
    get_Name() {
        result := ComCall(3, this, "ptr*", &pszName := 0, "HRESULT")
        return pszName
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @returns {Pointer<PROPVARIANT>} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-getparameter
     */
    GetParameter(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "ptr", pszName, "ptr*", &ppValue := 0, "HRESULT")
        return ppValue
    }

    /**
     * 
     * @param {PWSTR} pszName 
     * @param {Pointer<PROPVARIANT>} pValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-setparameter
     */
    SetParameter(pszName, pValue) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStatus 
     * @param {Pointer<Integer>} pPausedReason 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-getcatalogstatus
     */
    GetCatalogStatus(pStatus, pPausedReason) {
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"
        pPausedReasonMarshal := pPausedReason is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pStatusMarshal, pStatus, pPausedReasonMarshal, pPausedReason, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-reset
     */
    Reset() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-reindex
     */
    Reindex() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszPattern 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-reindexmatchingurls
     */
    ReindexMatchingURLs(pszPattern) {
        pszPattern := pszPattern is String ? StrPtr(pszPattern) : pszPattern

        result := ComCall(9, this, "ptr", pszPattern, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszRootURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-reindexsearchroot
     */
    ReindexSearchRoot(pszRootURL) {
        pszRootURL := pszRootURL is String ? StrPtr(pszRootURL) : pszRootURL

        result := ComCall(10, this, "ptr", pszRootURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwConnectTimeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-put_connecttimeout
     */
    put_ConnectTimeout(dwConnectTimeout) {
        result := ComCall(11, this, "uint", dwConnectTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-get_connecttimeout
     */
    get_ConnectTimeout() {
        result := ComCall(12, this, "uint*", &pdwConnectTimeout := 0, "HRESULT")
        return pdwConnectTimeout
    }

    /**
     * 
     * @param {Integer} dwDataTimeout 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-put_datatimeout
     */
    put_DataTimeout(dwDataTimeout) {
        result := ComCall(13, this, "uint", dwDataTimeout, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-get_datatimeout
     */
    get_DataTimeout() {
        result := ComCall(14, this, "uint*", &pdwDataTimeout := 0, "HRESULT")
        return pdwDataTimeout
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-numberofitems
     */
    NumberOfItems() {
        result := ComCall(15, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * 
     * @param {Pointer<Integer>} plIncrementalCount 
     * @param {Pointer<Integer>} plNotificationQueue 
     * @param {Pointer<Integer>} plHighPriorityQueue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-numberofitemstoindex
     */
    NumberOfItemsToIndex(plIncrementalCount, plNotificationQueue, plHighPriorityQueue) {
        plIncrementalCountMarshal := plIncrementalCount is VarRef ? "int*" : "ptr"
        plNotificationQueueMarshal := plNotificationQueue is VarRef ? "int*" : "ptr"
        plHighPriorityQueueMarshal := plHighPriorityQueue is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, plIncrementalCountMarshal, plIncrementalCount, plNotificationQueueMarshal, plNotificationQueue, plHighPriorityQueueMarshal, plHighPriorityQueue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-urlbeingindexed
     */
    URLBeingIndexed() {
        result := ComCall(17, this, "ptr*", &pszUrl := 0, "HRESULT")
        return pszUrl
    }

    /**
     * 
     * @param {PWSTR} pszURL 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-geturlindexingstate
     */
    GetURLIndexingState(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(18, this, "ptr", pszURL, "uint*", &pdwState := 0, "HRESULT")
        return pdwState
    }

    /**
     * 
     * @returns {ISearchPersistentItemsChangedSink} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-getpersistentitemschangedsink
     */
    GetPersistentItemsChangedSink() {
        result := ComCall(19, this, "ptr*", &ppISearchPersistentItemsChangedSink := 0, "HRESULT")
        return ISearchPersistentItemsChangedSink(ppISearchPersistentItemsChangedSink)
    }

    /**
     * 
     * @param {PWSTR} pszView 
     * @param {ISearchViewChangedSink} pViewChangedSink 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-registerviewfornotification
     */
    RegisterViewForNotification(pszView, pViewChangedSink) {
        pszView := pszView is String ? StrPtr(pszView) : pszView

        result := ComCall(20, this, "ptr", pszView, "ptr", pViewChangedSink, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * 
     * @param {ISearchNotifyInlineSite} pISearchNotifyInlineSite 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppv 
     * @param {Pointer<Guid>} pGUIDCatalogResetSignature 
     * @param {Pointer<Guid>} pGUIDCheckPointSignature 
     * @param {Pointer<Integer>} pdwLastCheckPointNumber 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-getitemschangedsink
     */
    GetItemsChangedSink(pISearchNotifyInlineSite, riid, ppv, pGUIDCatalogResetSignature, pGUIDCheckPointSignature, pdwLastCheckPointNumber) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"
        pdwLastCheckPointNumberMarshal := pdwLastCheckPointNumber is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "ptr", pISearchNotifyInlineSite, "ptr", riid, ppvMarshal, ppv, "ptr", pGUIDCatalogResetSignature, "ptr", pGUIDCheckPointSignature, pdwLastCheckPointNumberMarshal, pdwLastCheckPointNumber, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwCookie 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-unregisterviewfornotification
     */
    UnregisterViewForNotification(dwCookie) {
        result := ComCall(22, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszExtension 
     * @param {BOOL} fExclude 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-setextensionclusion
     */
    SetExtensionClusion(pszExtension, fExclude) {
        pszExtension := pszExtension is String ? StrPtr(pszExtension) : pszExtension

        result := ComCall(23, this, "ptr", pszExtension, "int", fExclude, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEnumString} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-enumerateexcludedextensions
     */
    EnumerateExcludedExtensions() {
        result := ComCall(24, this, "ptr*", &ppExtensions := 0, "HRESULT")
        return IEnumString(ppExtensions)
    }

    /**
     * 
     * @returns {ISearchQueryHelper} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-getqueryhelper
     */
    GetQueryHelper() {
        result := ComCall(25, this, "ptr*", &ppSearchQueryHelper := 0, "HRESULT")
        return ISearchQueryHelper(ppSearchQueryHelper)
    }

    /**
     * 
     * @param {BOOL} fDiacriticSensitive 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-put_diacriticsensitivity
     */
    put_DiacriticSensitivity(fDiacriticSensitive) {
        result := ComCall(26, this, "int", fDiacriticSensitive, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-get_diacriticsensitivity
     */
    get_DiacriticSensitivity() {
        result := ComCall(27, this, "int*", &pfDiacriticSensitive := 0, "HRESULT")
        return pfDiacriticSensitive
    }

    /**
     * 
     * @returns {ISearchCrawlScopeManager} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-getcrawlscopemanager
     */
    GetCrawlScopeManager() {
        result := ComCall(28, this, "ptr*", &ppCrawlScopeManager := 0, "HRESULT")
        return ISearchCrawlScopeManager(ppCrawlScopeManager)
    }
}
