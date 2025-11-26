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
     * @type {PWSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    ConnectTimeout {
        get => this.get_ConnectTimeout()
        set => this.put_ConnectTimeout(value)
    }

    /**
     * @type {Integer} 
     */
    DataTimeout {
        get => this.get_DataTimeout()
        set => this.put_DataTimeout(value)
    }

    /**
     * @type {BOOL} 
     */
    DiacriticSensitivity {
        get => this.get_DiacriticSensitivity()
        set => this.put_DiacriticSensitivity(value)
    }

    /**
     * Gets the name of the current catalog.
     * @returns {PWSTR} Type: <b>LPCWSTR*</b>
     * 
     * Receives a pointer to a null-terminated Unicode buffer that contains the name of the current catalog.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-get_name
     */
    get_Name() {
        result := ComCall(3, this, "ptr*", &pszName := 0, "HRESULT")
        return pszName
    }

    /**
     * Not implemented.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * The name of the parameter to be retrieved.
     * @returns {Pointer<PROPVARIANT>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>**</b>
     * 
     * Receives a pointer to the value of the parameter.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-getparameter
     */
    GetParameter(pszName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(4, this, "ptr", pszName, "ptr*", &ppValue := 0, "HRESULT")
        return ppValue
    }

    /**
     * Sets a name/value parameter for the catalog.
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * The name of the parameter to change.
     * @param {Pointer<PROPVARIANT>} pValue Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>*</b>
     * 
     * A pointer to the new value for the parameter.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-setparameter
     */
    SetParameter(pszName, pValue) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * Gets the status of the catalog.
     * @param {Pointer<Integer>} pStatus Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-catalogstatus">CatalogStatus</a>*</b>
     * 
     * Receives a pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-catalogstatus">CatalogStatus</a> enumeration. If <i>pStatus</i> is <i>CATALOG_STATUS_PAUSED</i>, further information can be obtained from the <i>pPausedReason</i> parameter.
     * @param {Pointer<Integer>} pPausedReason Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-catalogpausedreason">CatalogPausedReason</a>*</b>
     * 
     * Receives a pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-catalogpausedreason">CatalogPausedReason</a> enumeration describing why the catalog is paused. If the catalog status is not <i>CATALOG_STATUS_PAUSED</i>, this parameter receives the value <i>CATALOG_PAUSED_REASON_NONE</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-getcatalogstatus
     */
    GetCatalogStatus(pStatus, pPausedReason) {
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"
        pPausedReasonMarshal := pPausedReason is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pStatusMarshal, pStatus, pPausedReasonMarshal, pPausedReason, "HRESULT")
        return result
    }

    /**
     * Resets the underlying catalog by rebuilding the databases and performing a full indexing.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-reset
     */
    Reset() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Re-indexes all URLs in the catalog.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-reindex
     */
    Reindex() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Reindexes all items that match the provided pattern. This method was not implemented prior to Windows 7.
     * @param {PWSTR} pszPattern Type: <b>LPCWSTR</b>
     * 
     * A pointer to the pattern to be matched for reindexing. The pattern can be a standard pattern such as <c>*.pdf</code> or a pattern in the form of a URL such as <code>file:///c:\MyStuff\*.pdf</c>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-reindexmatchingurls
     */
    ReindexMatchingURLs(pszPattern) {
        pszPattern := pszPattern is String ? StrPtr(pszPattern) : pszPattern

        result := ComCall(9, this, "ptr", pszPattern, "HRESULT")
        return result
    }

    /**
     * Re-indexes all URLs from a specified root.
     * @param {PWSTR} pszRootURL Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated, Unicode buffer that contains the URL on which the search is rooted. This URL must be a search root previously registered with <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchcrawlscopemanager-addroot">ISearchCrawlScopeManager::AddRoot</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-reindexsearchroot
     */
    ReindexSearchRoot(pszRootURL) {
        pszRootURL := pszRootURL is String ? StrPtr(pszRootURL) : pszRootURL

        result := ComCall(10, this, "ptr", pszRootURL, "HRESULT")
        return result
    }

    /**
     * Sets the connection time-out value in the TIMEOUT_INFO structure, in seconds.
     * @param {Integer} dwConnectTimeout Type: <b>DWORD</b>
     * 
     * The number of seconds to wait for a connection response.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-put_connecttimeout
     */
    put_ConnectTimeout(dwConnectTimeout) {
        result := ComCall(11, this, "uint", dwConnectTimeout, "HRESULT")
        return result
    }

    /**
     * Gets the connection time-out value for connecting to a store for indexing.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the time-out value, in seconds, from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-timeout_info">TIMEOUT_INFO</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-get_connecttimeout
     */
    get_ConnectTimeout() {
        result := ComCall(12, this, "uint*", &pdwConnectTimeout := 0, "HRESULT")
        return pdwConnectTimeout
    }

    /**
     * Sets the time-out value for data transactions between the indexer and the search filter host. This information is stored in the TIMEOUT_INFO structure and is measured in seconds.
     * @param {Integer} dwDataTimeout Type: <b>DWORD</b>
     * 
     * The number of seconds that the indexer will wait between chunks of data.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-put_datatimeout
     */
    put_DataTimeout(dwDataTimeout) {
        result := ComCall(13, this, "uint", dwDataTimeout, "HRESULT")
        return result
    }

    /**
     * Gets the data time-out value, in seconds, for data transactions between the indexer and the search filter host. This value is contained in a TIMEOUT_INFO structure.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-timeout_info">TIMEOUT_INFO</a> value for data transactions (the amount of time to wait for a data transaction).
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-get_datatimeout
     */
    get_DataTimeout() {
        result := ComCall(14, this, "uint*", &pdwDataTimeout := 0, "HRESULT")
        return pdwDataTimeout
    }

    /**
     * Gets the number of items in the catalog.
     * @returns {Integer} Type: <b>LONG*</b>
     * 
     * Receives a pointer to the number of items in the catalog.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-numberofitems
     */
    NumberOfItems() {
        result := ComCall(15, this, "int*", &plCount := 0, "HRESULT")
        return plCount
    }

    /**
     * Gets the number of items to be indexed within the catalog.
     * @param {Pointer<Integer>} plIncrementalCount Type: <b>LONG*</b>
     * 
     * Receives a pointer to the number of items to be indexed in the next incremental index.
     * @param {Pointer<Integer>} plNotificationQueue Type: <b>LONG*</b>
     * 
     * Receives a pointer to the number of items in the notification queue.
     * @param {Pointer<Integer>} plHighPriorityQueue Type: <b>LONG*</b>
     * 
     * Receives a pointer to the number of items in the high-priority queue. Items in the <i>plHighPriorityQueue</i> are indexed first.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-numberofitemstoindex
     */
    NumberOfItemsToIndex(plIncrementalCount, plNotificationQueue, plHighPriorityQueue) {
        plIncrementalCountMarshal := plIncrementalCount is VarRef ? "int*" : "ptr"
        plNotificationQueueMarshal := plNotificationQueue is VarRef ? "int*" : "ptr"
        plHighPriorityQueueMarshal := plHighPriorityQueue is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, plIncrementalCountMarshal, plIncrementalCount, plNotificationQueueMarshal, plNotificationQueue, plHighPriorityQueueMarshal, plHighPriorityQueue, "HRESULT")
        return result
    }

    /**
     * Gets the URL that is currently being indexed. If no indexing is currently in process, pszUrl is set to NULL.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to the URL that is currently being indexed.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-urlbeingindexed
     */
    URLBeingIndexed() {
        result := ComCall(17, this, "ptr*", &pszUrl := 0, "HRESULT")
        return pszUrl
    }

    /**
     * Not implemented.
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * @returns {Integer} Type: <b>DWORD*</b>
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-geturlindexingstate
     */
    GetURLIndexingState(pszURL) {
        pszURL := pszURL is String ? StrPtr(pszURL) : pszURL

        result := ComCall(18, this, "ptr", pszURL, "uint*", &pdwState := 0, "HRESULT")
        return pdwState
    }

    /**
     * Gets the change notification event sink interface for a client. This method is used by client applications and protocol handlers to notify the indexer of changes.
     * @returns {ISearchPersistentItemsChangedSink} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchpersistentitemschangedsink">ISearchPersistentItemsChangedSink</a>**</b>
     * 
     * Receives the address of a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchpersistentitemschangedsink">ISearchPersistentItemsChangedSink</a> interface for this catalog.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-getpersistentitemschangedsink
     */
    GetPersistentItemsChangedSink() {
        result := ComCall(19, this, "ptr*", &ppISearchPersistentItemsChangedSink := 0, "HRESULT")
        return ISearchPersistentItemsChangedSink(ppISearchPersistentItemsChangedSink)
    }

    /**
     * Not implemented.
     * @param {PWSTR} pszView Type: <b>LPCWSTR</b>
     * 
     * A pointer to the name of the view.
     * @param {ISearchViewChangedSink} pViewChangedSink Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchviewchangedsink">ISearchViewChangedSink</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchviewchangedsink">ISearchViewChangedSink</a> object to receive notifications.
     * @returns {Integer} Type: <b>DWORD*</b>
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-registerviewfornotification
     */
    RegisterViewForNotification(pszView, pViewChangedSink) {
        pszView := pszView is String ? StrPtr(pszView) : pszView

        result := ComCall(20, this, "ptr", pszView, "ptr", pViewChangedSink, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * Gets the change notification sink interface.
     * @param {ISearchNotifyInlineSite} pISearchNotifyInlineSite Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchnotifyinlinesite">ISearchNotifyInlineSite</a>*</b>
     * 
     * A pointer to your <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchnotifyinlinesite">ISearchNotifyInlineSite</a> interface.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * The UUID of the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchitemschangedsink">ISearchItemsChangedSink</a> interface.
     * @param {Pointer<Pointer<Void>>} ppv Type: <b>void*</b>
     * 
     * Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchitemschangedsink">ISearchItemsChangedSink</a> interface.
     * @param {Pointer<Guid>} pGUIDCatalogResetSignature Type: <b>GUID*</b>
     * 
     * Receives a pointer to the GUID representing the catalog reset. If this GUID changes, all notifications must be resent.
     * @param {Pointer<Guid>} pGUIDCheckPointSignature Type: <b>GUID*</b>
     * 
     * Receives a pointer to the GUID representing a checkpoint.
     * @param {Pointer<Integer>} pdwLastCheckPointNumber Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the number indicating the last checkpoint to be saved.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-getitemschangedsink
     */
    GetItemsChangedSink(pISearchNotifyInlineSite, riid, ppv, pGUIDCatalogResetSignature, pGUIDCheckPointSignature, pdwLastCheckPointNumber) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"
        pdwLastCheckPointNumberMarshal := pdwLastCheckPointNumber is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "ptr", pISearchNotifyInlineSite, "ptr", riid, ppvMarshal, ppv, "ptr", pGUIDCatalogResetSignature, "ptr", pGUIDCheckPointSignature, pdwLastCheckPointNumberMarshal, pdwLastCheckPointNumber, "HRESULT")
        return result
    }

    /**
     * Not implemented.
     * @param {Integer} dwCookie Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-unregisterviewfornotification
     */
    UnregisterViewForNotification(dwCookie) {
        result := ComCall(22, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * Not implemented.
     * @param {PWSTR} pszExtension Type: <b>LPCWSTR</b>
     * @param {BOOL} fExclude Type: <b>BOOL</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-setextensionclusion
     */
    SetExtensionClusion(pszExtension, fExclude) {
        pszExtension := pszExtension is String ? StrPtr(pszExtension) : pszExtension

        result := ComCall(23, this, "ptr", pszExtension, "int", fExclude, "HRESULT")
        return result
    }

    /**
     * Not implemented.
     * @returns {IEnumString} Type: <b>IEnumString**</b>
     * 
     * Returns the address of a pointer to an enumerated list of extensions being excluded.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-enumerateexcludedextensions
     */
    EnumerateExcludedExtensions() {
        result := ComCall(24, this, "ptr*", &ppExtensions := 0, "HRESULT")
        return IEnumString(ppExtensions)
    }

    /**
     * Gets the ISearchQueryHelper interface for the current catalog.
     * @returns {ISearchQueryHelper} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>**</b>
     * 
     * Receives the address of a pointer to a new instance of the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a> interface with default settings.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-getqueryhelper
     */
    GetQueryHelper() {
        result := ComCall(25, this, "ptr*", &ppSearchQueryHelper := 0, "HRESULT")
        return ISearchQueryHelper(ppSearchQueryHelper)
    }

    /**
     * Sets a value that determines whether the catalog is sensitive to diacritics. A diacritic is a mark added to a letter to indicate a special phonetic value or pronunciation.
     * @param {BOOL} fDiacriticSensitive Type: <b>BOOL</b>
     * 
     * A Boolean value that determines whether the catalog is sensitive to diacritics. <b>TRUE</b> if the catalog is sensitive to and recognizes diacritics; otherwise, <b>FALSE</b>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-put_diacriticsensitivity
     */
    put_DiacriticSensitivity(fDiacriticSensitive) {
        result := ComCall(26, this, "int", fDiacriticSensitive, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether the catalog is sensitive to diacritics. A diacritic is a mark added to a letter to indicate a special phonetic value or pronunciation.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives a pointer to a Boolean value that indicates whether the catalog is sensitive to diacritics. <b>TRUE</b> if the catalog is sensitive to and recognizes diacritics; otherwise, <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-get_diacriticsensitivity
     */
    get_DiacriticSensitivity() {
        result := ComCall(27, this, "int*", &pfDiacriticSensitive := 0, "HRESULT")
        return pfDiacriticSensitive
    }

    /**
     * Gets an ISearchCrawlScopeManager interface for this search catalog.
     * @returns {ISearchCrawlScopeManager} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchcrawlscopemanager">ISearchCrawlScopeManager</a>**</b>
     * 
     * Receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchcrawlscopemanager">ISearchCrawlScopeManager</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-isearchcatalogmanager-getcrawlscopemanager
     */
    GetCrawlScopeManager() {
        result := ComCall(28, this, "ptr*", &ppCrawlScopeManager := 0, "HRESULT")
        return ISearchCrawlScopeManager(ppCrawlScopeManager)
    }
}
