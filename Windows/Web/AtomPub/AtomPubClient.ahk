#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IAtomPubClient.ahk
#Include ..\Syndication\ISyndicationClient.ahk
#Include .\IAtomPubClientFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Encapsulates the methods needed to implement the AtomPub protocol which enables HTTP CRUD access to Web resources using the Atom 1.0 wire format.
 * @remarks
 * For examples of how these class methods are implemented to create, retrieve, update, or delete syndicated content, see [Quickstart: Managing Feed Entries](/previous-versions/windows/apps/hh700368(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient
 * @namespace Windows.Web.AtomPub
 * @version WindowsRuntime 1.4
 */
class AtomPubClient extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IAtomPubClient

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IAtomPubClient.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [AtomPubClient](atompubclient.md) object with the credential to use when making requests to the server. Initially, a 'username/password' tuple. However, for domain credentials, the username must be in 'domain\user form'.
     * @param {PasswordCredential} serverCredential The specified security credentials.
     * @returns {AtomPubClient} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient.#ctor
     */
    static CreateAtomPubClientWithCredentials(serverCredential) {
        if (!AtomPubClient.HasProp("__IAtomPubClientFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.AtomPub.AtomPubClient")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IAtomPubClientFactory.IID)
            AtomPubClient.__IAtomPubClientFactory := IAtomPubClientFactory(factoryPtr)
        }

        return AtomPubClient.__IAtomPubClientFactory.CreateAtomPubClientWithCredentials(serverCredential)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the credentials to use when making requests to the server.
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient.servercredential
     * @type {PasswordCredential} 
     */
    ServerCredential {
        get => this.get_ServerCredential()
        set => this.put_ServerCredential(value)
    }

    /**
     * Gets or sets the credentials to use when making requests via a proxy.
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient.proxycredential
     * @type {PasswordCredential} 
     */
    ProxyCredential {
        get => this.get_ProxyCredential()
        set => this.put_ProxyCredential(value)
    }

    /**
     * Gets or sets the maximum number of bytes to buffer when receiving a response from a server.
     * @remarks
     * Applications can protect themselves against a malicious server which sends an excessively large response body to DoS the client by setting the property to a smaller number.
     * 
     * If the response from the server contains a **Content-Length** header with a value greater than the value of this property, the request will be aborted immediately and the operation will immediately fail with an error indicating that the response body was too large. If no **Content-Length** header is present in the response, the response body will be buffered up to the point of this value. As soon as the response body grows to be larger than this value, the request will be aborted, the buffered response data will be released, and the operation will immediately fail with an error indicating that the response body was too large.
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient.maxresponsebuffersize
     * @type {Integer} 
     */
    MaxResponseBufferSize {
        get => this.get_MaxResponseBufferSize()
        set => this.put_MaxResponseBufferSize(value)
    }

    /**
     * Gets or sets the maximum amount of time, in milliseconds, to wait for any of the asynchronous operations to complete. If the operation is not complete within this amount of time, it will fail with a status code indicating that it timed out.
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient.timeout
     * @type {Integer} 
     */
    Timeout {
        get => this.get_Timeout()
        set => this.put_Timeout(value)
    }

    /**
     * Gets or sets a **Boolean** value that specifies whether to bypass the cache when retrieving the feed.
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient.bypasscacheonretrieve
     * @type {Boolean} 
     */
    BypassCacheOnRetrieve {
        get => this.get_BypassCacheOnRetrieve()
        set => this.put_BypassCacheOnRetrieve(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [AtomPubClient](atompubclient.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Web.AtomPub.AtomPubClient")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Retrieves a service document from the specified Uri.
     * @param {Uri} uri_ The specified Uri.
     * @returns {IAsyncOperationWithProgress<ServiceDocument, RetrievalProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient.retrieveservicedocumentasync
     */
    RetrieveServiceDocumentAsync(uri_) {
        if (!this.HasProp("__IAtomPubClient")) {
            if ((queryResult := this.QueryInterface(IAtomPubClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAtomPubClient := IAtomPubClient(outPtr)
        }

        return this.__IAtomPubClient.RetrieveServiceDocumentAsync(uri_)
    }

    /**
     * Retrieves a media link resource from the specified Uniform Resource Identifier (URI).
     * @param {Uri} uri_ The Uniform Resource Identifier (URI) for the media resource.
     * @returns {IAsyncOperationWithProgress<IInputStream, RetrievalProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient.retrievemediaresourceasync
     */
    RetrieveMediaResourceAsync(uri_) {
        if (!this.HasProp("__IAtomPubClient")) {
            if ((queryResult := this.QueryInterface(IAtomPubClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAtomPubClient := IAtomPubClient(outPtr)
        }

        return this.__IAtomPubClient.RetrieveMediaResourceAsync(uri_)
    }

    /**
     * Retrieves an Entry resource or Media Link resource from the specified Uniform Resource Identifier (URI).
     * @param {Uri} uri_ The specified Uniform Resource Identifier (URI).
     * @returns {IAsyncOperationWithProgress<SyndicationItem, RetrievalProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient.retrieveresourceasync
     */
    RetrieveResourceAsync(uri_) {
        if (!this.HasProp("__IAtomPubClient")) {
            if ((queryResult := this.QueryInterface(IAtomPubClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAtomPubClient := IAtomPubClient(outPtr)
        }

        return this.__IAtomPubClient.RetrieveResourceAsync(uri_)
    }

    /**
     * Creates a new Entry resource in the specified collection. The Uri of the collection in which to create the new resource can be discovered from the [ResourceCollection](resourcecollection.md) object retrieved from the [RetrieveResourceAsync](atompubclient_retrieveresourceasync_1946100714.md) method.
     * @param {Uri} uri_ The Uri of the specified collection in which the new resource should be created.
     * @param {HSTRING} description The description of the new resource that is turned into the Slug: header of the POST request.
     * @param {SyndicationItem} item The new resource to be created.
     * @returns {IAsyncOperationWithProgress<SyndicationItem, TransferProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient.createresourceasync
     */
    CreateResourceAsync(uri_, description, item) {
        if (!this.HasProp("__IAtomPubClient")) {
            if ((queryResult := this.QueryInterface(IAtomPubClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAtomPubClient := IAtomPubClient(outPtr)
        }

        return this.__IAtomPubClient.CreateResourceAsync(uri_, description, item)
    }

    /**
     * Creates a new media resource in the specified collection.
     * @param {Uri} uri_ The Uniform Resource Identifier (URI) of the specified collection in which the new resource should be created.
     * @param {HSTRING} mediaType_ The type for the media resource.
     * @param {HSTRING} description The description of the new resource that is turned into the Slug: header of the POST request.
     * @param {IInputStream} mediaStream Specifies the [IInputStream](../windows.storage.streams/iinputstream.md) to use as the media resource.
     * @returns {IAsyncOperationWithProgress<SyndicationItem, TransferProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient.createmediaresourceasync
     */
    CreateMediaResourceAsync(uri_, mediaType_, description, mediaStream) {
        if (!this.HasProp("__IAtomPubClient")) {
            if ((queryResult := this.QueryInterface(IAtomPubClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAtomPubClient := IAtomPubClient(outPtr)
        }

        return this.__IAtomPubClient.CreateMediaResourceAsync(uri_, mediaType_, description, mediaStream)
    }

    /**
     * Updates a media link resource from the specified Uniform Resource Identifier (URI).
     * @param {Uri} uri_ The Uniform Resource Identifier (URI) of the resource to be updated.
     * @param {HSTRING} mediaType_ The media type of the resource.
     * @param {IInputStream} mediaStream The [IInputStream](../windows.storage.streams/iinputstream.md) of the media that is updating the media resource.
     * @returns {IAsyncActionWithProgress<TransferProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient.updatemediaresourceasync
     */
    UpdateMediaResourceAsync(uri_, mediaType_, mediaStream) {
        if (!this.HasProp("__IAtomPubClient")) {
            if ((queryResult := this.QueryInterface(IAtomPubClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAtomPubClient := IAtomPubClient(outPtr)
        }

        return this.__IAtomPubClient.UpdateMediaResourceAsync(uri_, mediaType_, mediaStream)
    }

    /**
     * Updates an existing Entry or Media Link resource. If an ETag: header has previously been seen while retrieving this resource (in a response to [RetrieveResourceAsync](atompubclient_retrieveresourceasync_1946100714.md), [CreateResourceAsync](atompubclient_createresourceasync_823380555.md) or a previous call to UpdateResourceAsync), this method automatically sends an If-Match: header with the remembered value.
     * @remarks
     * For an example of how this method is implemented to update syndicated content see [Quickstart: Managing Feed Entries](/previous-versions/windows/apps/hh700368(v=win.10)).
     * @param {Uri} uri_ The Uniform Resource Identifier (URI) of the resource to be updated.
     * @param {SyndicationItem} item The resource to be updated.
     * @returns {IAsyncActionWithProgress<TransferProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient.updateresourceasync
     */
    UpdateResourceAsync(uri_, item) {
        if (!this.HasProp("__IAtomPubClient")) {
            if ((queryResult := this.QueryInterface(IAtomPubClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAtomPubClient := IAtomPubClient(outPtr)
        }

        return this.__IAtomPubClient.UpdateResourceAsync(uri_, item)
    }

    /**
     * Updates an existing Entry or Media Link resource. This differs from the [UpdateResourceAsync](atompubclient_updateresourceasync_241802746.md) method in that the [EditUri](../windows.web.syndication/syndicationitem_edituri.md) property of the specified [SyndicationItem](../windows.web.syndication/syndicationitem.md) object is used as the Uri of the resource to be updated.
     * @param {SyndicationItem} item The resource to be updated.
     * @returns {IAsyncActionWithProgress<TransferProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient.updateresourceitemasync
     */
    UpdateResourceItemAsync(item) {
        if (!this.HasProp("__IAtomPubClient")) {
            if ((queryResult := this.QueryInterface(IAtomPubClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAtomPubClient := IAtomPubClient(outPtr)
        }

        return this.__IAtomPubClient.UpdateResourceItemAsync(item)
    }

    /**
     * Deletes an existing Entry or Media Link resource.
     * @remarks
     * For an example of how this methods is implemented to delete syndicated content, see [Quickstart: Managing Feed Entries](/previous-versions/windows/apps/hh700368(v=win.10)).
     * @param {Uri} uri_ The Uri of the resource to be deleted.
     * @returns {IAsyncActionWithProgress<TransferProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient.deleteresourceasync
     */
    DeleteResourceAsync(uri_) {
        if (!this.HasProp("__IAtomPubClient")) {
            if ((queryResult := this.QueryInterface(IAtomPubClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAtomPubClient := IAtomPubClient(outPtr)
        }

        return this.__IAtomPubClient.DeleteResourceAsync(uri_)
    }

    /**
     * Deletes an existing Entry or Media Link resource. This differs from the [DeleteResourceAsync](atompubclient_deleteresourceasync_1093618628.md) method in that the [SyndicationItem](../windows.web.syndication/syndicationitem.md) object that represents the resource to be deleted is specified instead of the Uri. The DeleteResourceItemAsync method uses the  property of the specified [SyndicationItem](../windows.web.syndication/syndicationitem.md) as the Uri of the resource to be deleted.
     * @param {SyndicationItem} item The resource to be deleted.
     * @returns {IAsyncActionWithProgress<TransferProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient.deleteresourceitemasync
     */
    DeleteResourceItemAsync(item) {
        if (!this.HasProp("__IAtomPubClient")) {
            if ((queryResult := this.QueryInterface(IAtomPubClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAtomPubClient := IAtomPubClient(outPtr)
        }

        return this.__IAtomPubClient.DeleteResourceItemAsync(item)
    }

    /**
     * Cancels any in-progress asynchronous operations, causing them to fail (asynchronously) with an error code indicating cancellation.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient.cancelasyncoperations
     */
    CancelAsyncOperations() {
        if (!this.HasProp("__IAtomPubClient")) {
            if ((queryResult := this.QueryInterface(IAtomPubClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IAtomPubClient := IAtomPubClient(outPtr)
        }

        return this.__IAtomPubClient.CancelAsyncOperations()
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_ServerCredential() {
        if (!this.HasProp("__ISyndicationClient")) {
            if ((queryResult := this.QueryInterface(ISyndicationClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationClient := ISyndicationClient(outPtr)
        }

        return this.__ISyndicationClient.get_ServerCredential()
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_ServerCredential(value) {
        if (!this.HasProp("__ISyndicationClient")) {
            if ((queryResult := this.QueryInterface(ISyndicationClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationClient := ISyndicationClient(outPtr)
        }

        return this.__ISyndicationClient.put_ServerCredential(value)
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_ProxyCredential() {
        if (!this.HasProp("__ISyndicationClient")) {
            if ((queryResult := this.QueryInterface(ISyndicationClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationClient := ISyndicationClient(outPtr)
        }

        return this.__ISyndicationClient.get_ProxyCredential()
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_ProxyCredential(value) {
        if (!this.HasProp("__ISyndicationClient")) {
            if ((queryResult := this.QueryInterface(ISyndicationClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationClient := ISyndicationClient(outPtr)
        }

        return this.__ISyndicationClient.put_ProxyCredential(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxResponseBufferSize() {
        if (!this.HasProp("__ISyndicationClient")) {
            if ((queryResult := this.QueryInterface(ISyndicationClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationClient := ISyndicationClient(outPtr)
        }

        return this.__ISyndicationClient.get_MaxResponseBufferSize()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxResponseBufferSize(value) {
        if (!this.HasProp("__ISyndicationClient")) {
            if ((queryResult := this.QueryInterface(ISyndicationClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationClient := ISyndicationClient(outPtr)
        }

        return this.__ISyndicationClient.put_MaxResponseBufferSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Timeout() {
        if (!this.HasProp("__ISyndicationClient")) {
            if ((queryResult := this.QueryInterface(ISyndicationClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationClient := ISyndicationClient(outPtr)
        }

        return this.__ISyndicationClient.get_Timeout()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Timeout(value) {
        if (!this.HasProp("__ISyndicationClient")) {
            if ((queryResult := this.QueryInterface(ISyndicationClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationClient := ISyndicationClient(outPtr)
        }

        return this.__ISyndicationClient.put_Timeout(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_BypassCacheOnRetrieve() {
        if (!this.HasProp("__ISyndicationClient")) {
            if ((queryResult := this.QueryInterface(ISyndicationClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationClient := ISyndicationClient(outPtr)
        }

        return this.__ISyndicationClient.get_BypassCacheOnRetrieve()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_BypassCacheOnRetrieve(value) {
        if (!this.HasProp("__ISyndicationClient")) {
            if ((queryResult := this.QueryInterface(ISyndicationClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationClient := ISyndicationClient(outPtr)
        }

        return this.__ISyndicationClient.put_BypassCacheOnRetrieve(value)
    }

    /**
     * Sets an HTTP header for the request. This method can be called multiple times to set multiple headers. When the same header is set multiple times, the values will be concatenated and separated by ",".
     * @param {HSTRING} name The name of the header.
     * @param {HSTRING} value The value of the header.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient.setrequestheader
     */
    SetRequestHeader(name, value) {
        if (!this.HasProp("__ISyndicationClient")) {
            if ((queryResult := this.QueryInterface(ISyndicationClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationClient := ISyndicationClient(outPtr)
        }

        return this.__ISyndicationClient.SetRequestHeader(name, value)
    }

    /**
     * Starts an asynchronous operation to download the syndication feed from the given URI. This method instantiates a [SyndicationFeed](../windows.web.syndication/syndicationfeed.md) object from the feed string, which can be in one of the formats specified in [SyndicationFormat](../windows.web.syndication/syndicationformat.md).
     * @param {Uri} uri_ The URI from which the feed is downloaded.
     * @returns {IAsyncOperationWithProgress<SyndicationFeed, RetrievalProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.atompub.atompubclient.retrievefeedasync
     */
    RetrieveFeedAsync(uri_) {
        if (!this.HasProp("__ISyndicationClient")) {
            if ((queryResult := this.QueryInterface(ISyndicationClient.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISyndicationClient := ISyndicationClient(outPtr)
        }

        return this.__ISyndicationClient.RetrieveFeedAsync(uri_)
    }

;@endregion Instance Methods
}
