#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISyndicationClient.ahk
#Include .\ISyndicationClientFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Implements the [ISyndicationClient](isyndicationclient.md) interface which retrieves feeds from a URI asynchronously.
 * @remarks
 * The following code demonstrates how to retrieve a feed using [RetrieveFeedAsync](syndicationclient_retrievefeedasync_2072117461.md).
 * 
 * ```csharp
 * using Windows.Foundation;
 * using Windows.Web.Syndication;
 * 
 * async Task GetFeedAsync(string feedUri)
 * {
 *     var uri = new Uri(feedUri);
 *     var client = new SyndicationClient(){ BypassCacheOnRetrieve = true };
 *     currentFeed = await client.RetrieveFeedAsync(uri);
 * }
 * ```
 * 
 * For additional examples that demonstrate how this class is used to retrieve syndicated content from the web, see [Quickstart: Accessing a web feed](/previous-versions/windows/apps/hh700374(v=win.10)).
 * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationclient
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class SyndicationClient extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISyndicationClient

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISyndicationClient.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new [SyndicationClient](syndicationclient.md) object with authentication credentials.
     * @param {PasswordCredential} serverCredential Credentials for user authentication.
     * @returns {SyndicationClient} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationclient.#ctor
     */
    static CreateSyndicationClient(serverCredential) {
        if (!SyndicationClient.HasProp("__ISyndicationClientFactory")) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationClient")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISyndicationClientFactory.IID)
            SyndicationClient.__ISyndicationClientFactory := ISyndicationClientFactory(factoryPtr)
        }

        return SyndicationClient.__ISyndicationClientFactory.CreateSyndicationClient(serverCredential)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the credentials to use when making requests to the server.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationclient.servercredential
     * @type {PasswordCredential} 
     */
    ServerCredential {
        get => this.get_ServerCredential()
        set => this.put_ServerCredential(value)
    }

    /**
     * Gets or sets the credentials to use when making requests via a proxy.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationclient.proxycredential
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
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationclient.maxresponsebuffersize
     * @type {Integer} 
     */
    MaxResponseBufferSize {
        get => this.get_MaxResponseBufferSize()
        set => this.put_MaxResponseBufferSize(value)
    }

    /**
     * Gets or sets the maximum amount of time, in milliseconds, to wait for any of the asynchronous operations to complete. If the operation is not complete within this amount of time, it will fail with a status code indicating that it timed out.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationclient.timeout
     * @type {Integer} 
     */
    Timeout {
        get => this.get_Timeout()
        set => this.put_Timeout(value)
    }

    /**
     * Gets or sets a **Boolean** value that specifies whether to bypass the cache when retrieving the feed.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationclient.bypasscacheonretrieve
     * @type {Boolean} 
     */
    BypassCacheOnRetrieve {
        get => this.get_BypassCacheOnRetrieve()
        set => this.put_BypassCacheOnRetrieve(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Creates a new [SyndicationClient](syndicationclient.md) object.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Web.Syndication.SyndicationClient")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
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
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationclient.setrequestheader
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
     * Starts an asynchronous operation to download the syndication feed from the given URI. This method instantiates a [SyndicationFeed](syndicationfeed.md) object from the feed string, which can be in one of the formats specified in [SyndicationFormat](syndicationformat.md).
     * @param {Uri} uri_ The URI from which the feed is downloaded.
     * @returns {IAsyncOperationWithProgress<SyndicationFeed, RetrievalProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.syndicationclient.retrievefeedasync
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
