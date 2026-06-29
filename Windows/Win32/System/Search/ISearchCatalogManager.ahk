#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISearchQueryHelper.ahk" { ISearchQueryHelper }
#Import ".\ISearchViewChangedSink.ahk" { ISearchViewChangedSink }
#Import ".\ISearchPersistentItemsChangedSink.ahk" { ISearchPersistentItemsChangedSink }
#Import ".\ISearchCrawlScopeManager.ahk" { ISearchCrawlScopeManager }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\Com\IUnknown.ahk" { IUnknown }
#Import "..\Com\IEnumString.ahk" { IEnumString }
#Import ".\CatalogStatus.ahk" { CatalogStatus }
#Import ".\CatalogPausedReason.ahk" { CatalogPausedReason }
#Import "..\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import ".\ISearchNotifyInlineSite.ahk" { ISearchNotifyInlineSite }

/**
 * Provides methods to manage a search catalog for purposes such as re-indexing or setting timeouts.
 * @see https://learn.microsoft.com/windows/win32/api/searchapi/nn-searchapi-isearchcatalogmanager
 * @namespace Windows.Win32.System.Search
 */
export default struct ISearchCatalogManager extends IUnknown {
    /**
     * The interface identifier for ISearchCatalogManager
     * @type {Guid}
     */
    static IID := Guid("{ab310581-ac80-11d1-8df3-00c04fb6ef50}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISearchCatalogManager interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        get_Name                      : IntPtr
        GetParameter                  : IntPtr
        SetParameter                  : IntPtr
        GetCatalogStatus              : IntPtr
        Reset                         : IntPtr
        Reindex                       : IntPtr
        ReindexMatchingURLs           : IntPtr
        ReindexSearchRoot             : IntPtr
        put_ConnectTimeout            : IntPtr
        get_ConnectTimeout            : IntPtr
        put_DataTimeout               : IntPtr
        get_DataTimeout               : IntPtr
        NumberOfItems                 : IntPtr
        NumberOfItemsToIndex          : IntPtr
        URLBeingIndexed               : IntPtr
        GetURLIndexingState           : IntPtr
        GetPersistentItemsChangedSink : IntPtr
        RegisterViewForNotification   : IntPtr
        GetItemsChangedSink           : IntPtr
        UnregisterViewForNotification : IntPtr
        SetExtensionClusion           : IntPtr
        EnumerateExcludedExtensions   : IntPtr
        GetQueryHelper                : IntPtr
        put_DiacriticSensitivity      : IntPtr
        get_DiacriticSensitivity      : IntPtr
        GetCrawlScopeManager          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISearchCatalogManager.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-get_name
     */
    get_Name() {
        result := ComCall(3, this, PWSTR.Ptr, &pszName := 0, "HRESULT")
        return pszName
    }

    /**
     * Not implemented. (ISearchCatalogManager.GetParameter)
     * @param {PWSTR} pszName Type: <b>LPCWSTR</b>
     * 
     * The name of the parameter to be retrieved.
     * @returns {Pointer<PROPVARIANT>} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/propidl/ns-propidl-propvariant">PROPVARIANT</a>**</b>
     * 
     * Receives a pointer to the value of the parameter.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-getparameter
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-setparameter
     */
    SetParameter(pszName, pValue) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "ptr", pszName, PROPVARIANT.Ptr, pValue, "HRESULT")
        return result
    }

    /**
     * Gets the status of the catalog.
     * @param {Pointer<CatalogStatus>} pStatus Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-catalogstatus">CatalogStatus</a>*</b>
     * 
     * Receives a pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-catalogstatus">CatalogStatus</a> enumeration. If <i>pStatus</i> is <i>CATALOG_STATUS_PAUSED</i>, further information can be obtained from the <i>pPausedReason</i> parameter.
     * @param {Pointer<CatalogPausedReason>} pPausedReason Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-catalogpausedreason">CatalogPausedReason</a>*</b>
     * 
     * Receives a pointer to a value from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ne-searchapi-catalogpausedreason">CatalogPausedReason</a> enumeration describing why the catalog is paused. If the catalog status is not <i>CATALOG_STATUS_PAUSED</i>, this parameter receives the value <i>CATALOG_PAUSED_REASON_NONE</i>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-getcatalogstatus
     */
    GetCatalogStatus(pStatus, pPausedReason) {
        pStatusMarshal := pStatus is VarRef ? "int*" : "ptr"
        pPausedReasonMarshal := pPausedReason is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, pStatusMarshal, pStatus, pPausedReasonMarshal, pPausedReason, "HRESULT")
        return result
    }

    /**
     * Resets the underlying catalog by rebuilding the databases and performing a full indexing.
     * @remarks
     * Resetting can take a very long time, during which little or no information is available to be searched.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-reset
     */
    Reset() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Re-indexes all URLs in the catalog.
     * @remarks
     * Old information remains in the catalog until replaced by new information during re-indexing.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-reindex
     */
    Reindex() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Reindexes all items that match the provided pattern. This method was not implemented prior to Windows 7.
     * @remarks
     * This method is fully implemented for Windows 7.
     * @param {PWSTR} pszPattern Type: <b>LPCWSTR</b>
     * 
     * A pointer to the pattern to be matched for reindexing. The pattern can be a standard pattern such as <c>*.pdf</code> or a pattern in the form of a URL such as <code>file:///c:\MyStuff\*.pdf</c>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-reindexmatchingurls
     */
    ReindexMatchingURLs(pszPattern) {
        pszPattern := pszPattern is String ? StrPtr(pszPattern) : pszPattern

        result := ComCall(9, this, "ptr", pszPattern, "HRESULT")
        return result
    }

    /**
     * Re-indexes all URLs from a specified root.
     * @remarks
     * The indexer begins an incremental crawl of all start pages under <i>pszRootURL</i> upon successful return of method.
     * 
     * Old information remains in the catalog until replaced by new information during the re-indexing.
     * @param {PWSTR} pszRootURL Type: <b>LPCWSTR</b>
     * 
     * Pointer to a null-terminated, Unicode buffer that contains the URL on which the search is rooted. This URL must be a search root previously registered with <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nf-searchapi-isearchcrawlscopemanager-addroot">ISearchCrawlScopeManager::AddRoot</a>.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-reindexsearchroot
     */
    ReindexSearchRoot(pszRootURL) {
        pszRootURL := pszRootURL is String ? StrPtr(pszRootURL) : pszRootURL

        result := ComCall(10, this, "ptr", pszRootURL, "HRESULT")
        return result
    }

    /**
     * Sets the connection time-out value in the TIMEOUT_INFO structure, in seconds.
     * @remarks
     * The indexer expects the first chunk of the document to be received within the connection time-out interval and any subsequent chunks to be received within the data time-out interval. These time-out values help prevent filters and protocol handlers from  failing or causing performance issues.
     * @param {Integer} dwConnectTimeout Type: <b>DWORD</b>
     * 
     * The number of seconds to wait for a connection response.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-put_connecttimeout
     */
    put_ConnectTimeout(dwConnectTimeout) {
        result := ComCall(11, this, "uint", dwConnectTimeout, "HRESULT")
        return result
    }

    /**
     * Gets the connection time-out value for connecting to a store for indexing.
     * @remarks
     * The indexer expects the first chunk of the document to be received within the connection time-out interval and any subsequent chunks to be received within the data time-out interval. These time-out values help prevent filters and protocol handlers from  failing or causing performance issues.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the time-out value, in seconds, from the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-timeout_info">TIMEOUT_INFO</a> structure.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-get_connecttimeout
     */
    get_ConnectTimeout() {
        result := ComCall(12, this, "uint*", &pdwConnectTimeout := 0, "HRESULT")
        return pdwConnectTimeout
    }

    /**
     * Sets the time-out value for data transactions between the indexer and the search filter host. This information is stored in the TIMEOUT_INFO structure and is measured in seconds.
     * @remarks
     * The indexer expects the first chunk of the document to be received within the connection time-out interval and any subsequent chunks to be received within the data time-out interval. These time-out values help prevent filters and protocol handlers from  failing or causing performance issues.
     * @param {Integer} dwDataTimeout Type: <b>DWORD</b>
     * 
     * The number of seconds that the indexer will wait between chunks of data.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-put_datatimeout
     */
    put_DataTimeout(dwDataTimeout) {
        result := ComCall(13, this, "uint", dwDataTimeout, "HRESULT")
        return result
    }

    /**
     * Gets the data time-out value, in seconds, for data transactions between the indexer and the search filter host. This value is contained in a TIMEOUT_INFO structure.
     * @remarks
     * The indexer expects the first chunk of a document to be received within the connection time-out interval and any subsequent chunks to be received within the data time-out interval. These time-out values help prevent filters and protocol handlers from  failing or causing performance issues.
     * @returns {Integer} Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/ns-searchapi-timeout_info">TIMEOUT_INFO</a> value for data transactions (the amount of time to wait for a data transaction).
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-get_datatimeout
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
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-numberofitems
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
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
     * Gets the URL that is currently being indexed. If no indexing is currently in process, pszUrl is set to NULL.
     * @returns {PWSTR} Type: <b>LPWSTR*</b>
     * 
     * Receives a pointer to the URL that is currently being indexed.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-urlbeingindexed
     */
    URLBeingIndexed() {
        result := ComCall(17, this, PWSTR.Ptr, &pszUrl := 0, "HRESULT")
        return pszUrl
    }

    /**
     * Not implemented. (ISearchCatalogManager.GetURLIndexingState)
     * @param {PWSTR} pszURL Type: <b>LPCWSTR</b>
     * @returns {Integer} Type: <b>DWORD*</b>
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-geturlindexingstate
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
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-getpersistentitemschangedsink
     */
    GetPersistentItemsChangedSink() {
        result := ComCall(19, this, "ptr*", &ppISearchPersistentItemsChangedSink := 0, "HRESULT")
        return ISearchPersistentItemsChangedSink(ppISearchPersistentItemsChangedSink)
    }

    /**
     * Not implemented. (ISearchCatalogManager.RegisterViewForNotification)
     * @param {PWSTR} pszView Type: <b>LPCWSTR</b>
     * 
     * A pointer to the name of the view.
     * @param {ISearchViewChangedSink} pViewChangedSink Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchviewchangedsink">ISearchViewChangedSink</a>*</b>
     * 
     * Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchviewchangedsink">ISearchViewChangedSink</a> object to receive notifications.
     * @returns {Integer} Type: <b>DWORD*</b>
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-registerviewfornotification
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-getitemschangedsink
     */
    GetItemsChangedSink(pISearchNotifyInlineSite, riid, ppv, pGUIDCatalogResetSignature, pGUIDCheckPointSignature, pdwLastCheckPointNumber) {
        ppvMarshal := ppv is VarRef ? "ptr*" : "ptr"
        pdwLastCheckPointNumberMarshal := pdwLastCheckPointNumber is VarRef ? "uint*" : "ptr"

        result := ComCall(21, this, "ptr", pISearchNotifyInlineSite, Guid.Ptr, riid, ppvMarshal, ppv, Guid.Ptr, pGUIDCatalogResetSignature, Guid.Ptr, pGUIDCheckPointSignature, pdwLastCheckPointNumberMarshal, pdwLastCheckPointNumber, "HRESULT")
        return result
    }

    /**
     * Not implemented. (ISearchCatalogManager.UnregisterViewForNotification)
     * @param {Integer} dwCookie Type: <b>DWORD</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-unregisterviewfornotification
     */
    UnregisterViewForNotification(dwCookie) {
        result := ComCall(22, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * Not implemented. (ISearchCatalogManager.SetExtensionClusion)
     * @param {PWSTR} pszExtension Type: <b>LPCWSTR</b>
     * @param {BOOL} fExclude Type: <b>BOOL</b>
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-setextensionclusion
     */
    SetExtensionClusion(pszExtension, fExclude) {
        pszExtension := pszExtension is String ? StrPtr(pszExtension) : pszExtension

        result := ComCall(23, this, "ptr", pszExtension, BOOL, fExclude, "HRESULT")
        return result
    }

    /**
     * Not implemented. (ISearchCatalogManager.EnumerateExcludedExtensions)
     * @returns {IEnumString} Type: <b>IEnumString**</b>
     * 
     * Returns the address of a pointer to an enumerated list of extensions being excluded.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-enumerateexcludedextensions
     */
    EnumerateExcludedExtensions() {
        result := ComCall(24, this, "ptr*", &ppExtensions := 0, "HRESULT")
        return IEnumString(ppExtensions)
    }

    /**
     * Gets the ISearchQueryHelper interface for the current catalog.
     * @remarks
     * After the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a> interface is created, use the put... methods for this interface to change settings. Settings for the <b>ISearchQueryHelper</b> object are relevant only until the settings are changed again or the item is released. When the item is next created, settings are set to default values.
     * @returns {ISearchQueryHelper} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a>**</b>
     * 
     * Receives the address of a pointer to a new instance of the <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchqueryhelper">ISearchQueryHelper</a> interface with default settings.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-getqueryhelper
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
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-put_diacriticsensitivity
     */
    put_DiacriticSensitivity(fDiacriticSensitive) {
        result := ComCall(26, this, BOOL, fDiacriticSensitive, "HRESULT")
        return result
    }

    /**
     * Gets a value that indicates whether the catalog is sensitive to diacritics. A diacritic is a mark added to a letter to indicate a special phonetic value or pronunciation.
     * @returns {BOOL} Type: <b>BOOL*</b>
     * 
     * Receives a pointer to a Boolean value that indicates whether the catalog is sensitive to diacritics. <b>TRUE</b> if the catalog is sensitive to and recognizes diacritics; otherwise, <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-get_diacriticsensitivity
     */
    get_DiacriticSensitivity() {
        result := ComCall(27, this, BOOL.Ptr, &pfDiacriticSensitive := 0, "HRESULT")
        return pfDiacriticSensitive
    }

    /**
     * Gets an ISearchCrawlScopeManager interface for this search catalog.
     * @returns {ISearchCrawlScopeManager} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchcrawlscopemanager">ISearchCrawlScopeManager</a>**</b>
     * 
     * Receives a pointer to a new <a href="https://docs.microsoft.com/windows/desktop/api/searchapi/nn-searchapi-isearchcrawlscopemanager">ISearchCrawlScopeManager</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-isearchcatalogmanager-getcrawlscopemanager
     */
    GetCrawlScopeManager() {
        result := ComCall(28, this, "ptr*", &ppCrawlScopeManager := 0, "HRESULT")
        return ISearchCrawlScopeManager(ppCrawlScopeManager)
    }

    Query(iid) {
        if (ISearchCatalogManager.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.GetParameter := CallbackCreate(GetMethod(implObj, "GetParameter"), flags, 3)
        this.vtbl.SetParameter := CallbackCreate(GetMethod(implObj, "SetParameter"), flags, 3)
        this.vtbl.GetCatalogStatus := CallbackCreate(GetMethod(implObj, "GetCatalogStatus"), flags, 3)
        this.vtbl.Reset := CallbackCreate(GetMethod(implObj, "Reset"), flags, 1)
        this.vtbl.Reindex := CallbackCreate(GetMethod(implObj, "Reindex"), flags, 1)
        this.vtbl.ReindexMatchingURLs := CallbackCreate(GetMethod(implObj, "ReindexMatchingURLs"), flags, 2)
        this.vtbl.ReindexSearchRoot := CallbackCreate(GetMethod(implObj, "ReindexSearchRoot"), flags, 2)
        this.vtbl.put_ConnectTimeout := CallbackCreate(GetMethod(implObj, "put_ConnectTimeout"), flags, 2)
        this.vtbl.get_ConnectTimeout := CallbackCreate(GetMethod(implObj, "get_ConnectTimeout"), flags, 2)
        this.vtbl.put_DataTimeout := CallbackCreate(GetMethod(implObj, "put_DataTimeout"), flags, 2)
        this.vtbl.get_DataTimeout := CallbackCreate(GetMethod(implObj, "get_DataTimeout"), flags, 2)
        this.vtbl.NumberOfItems := CallbackCreate(GetMethod(implObj, "NumberOfItems"), flags, 2)
        this.vtbl.NumberOfItemsToIndex := CallbackCreate(GetMethod(implObj, "NumberOfItemsToIndex"), flags, 4)
        this.vtbl.URLBeingIndexed := CallbackCreate(GetMethod(implObj, "URLBeingIndexed"), flags, 2)
        this.vtbl.GetURLIndexingState := CallbackCreate(GetMethod(implObj, "GetURLIndexingState"), flags, 3)
        this.vtbl.GetPersistentItemsChangedSink := CallbackCreate(GetMethod(implObj, "GetPersistentItemsChangedSink"), flags, 2)
        this.vtbl.RegisterViewForNotification := CallbackCreate(GetMethod(implObj, "RegisterViewForNotification"), flags, 4)
        this.vtbl.GetItemsChangedSink := CallbackCreate(GetMethod(implObj, "GetItemsChangedSink"), flags, 7)
        this.vtbl.UnregisterViewForNotification := CallbackCreate(GetMethod(implObj, "UnregisterViewForNotification"), flags, 2)
        this.vtbl.SetExtensionClusion := CallbackCreate(GetMethod(implObj, "SetExtensionClusion"), flags, 3)
        this.vtbl.EnumerateExcludedExtensions := CallbackCreate(GetMethod(implObj, "EnumerateExcludedExtensions"), flags, 2)
        this.vtbl.GetQueryHelper := CallbackCreate(GetMethod(implObj, "GetQueryHelper"), flags, 2)
        this.vtbl.put_DiacriticSensitivity := CallbackCreate(GetMethod(implObj, "put_DiacriticSensitivity"), flags, 2)
        this.vtbl.get_DiacriticSensitivity := CallbackCreate(GetMethod(implObj, "get_DiacriticSensitivity"), flags, 2)
        this.vtbl.GetCrawlScopeManager := CallbackCreate(GetMethod(implObj, "GetCrawlScopeManager"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.GetParameter)
        CallbackFree(this.vtbl.SetParameter)
        CallbackFree(this.vtbl.GetCatalogStatus)
        CallbackFree(this.vtbl.Reset)
        CallbackFree(this.vtbl.Reindex)
        CallbackFree(this.vtbl.ReindexMatchingURLs)
        CallbackFree(this.vtbl.ReindexSearchRoot)
        CallbackFree(this.vtbl.put_ConnectTimeout)
        CallbackFree(this.vtbl.get_ConnectTimeout)
        CallbackFree(this.vtbl.put_DataTimeout)
        CallbackFree(this.vtbl.get_DataTimeout)
        CallbackFree(this.vtbl.NumberOfItems)
        CallbackFree(this.vtbl.NumberOfItemsToIndex)
        CallbackFree(this.vtbl.URLBeingIndexed)
        CallbackFree(this.vtbl.GetURLIndexingState)
        CallbackFree(this.vtbl.GetPersistentItemsChangedSink)
        CallbackFree(this.vtbl.RegisterViewForNotification)
        CallbackFree(this.vtbl.GetItemsChangedSink)
        CallbackFree(this.vtbl.UnregisterViewForNotification)
        CallbackFree(this.vtbl.SetExtensionClusion)
        CallbackFree(this.vtbl.EnumerateExcludedExtensions)
        CallbackFree(this.vtbl.GetQueryHelper)
        CallbackFree(this.vtbl.put_DiacriticSensitivity)
        CallbackFree(this.vtbl.get_DiacriticSensitivity)
        CallbackFree(this.vtbl.GetCrawlScopeManager)
    }
}
