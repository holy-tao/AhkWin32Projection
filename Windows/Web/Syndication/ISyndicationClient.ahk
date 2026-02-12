#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Security\Credentials\PasswordCredential.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\SyndicationFeed.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Encapsulates the data and methods needed to retrieve feeds from a URI asynchronously. It supports authentication.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.isyndicationclient
 * @namespace Windows.Web.Syndication
 * @version WindowsRuntime 1.4
 */
class ISyndicationClient extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISyndicationClient
     * @type {Guid}
     */
    static IID => Guid("{9e18a9b7-7249-4b45-b229-7df895a5a1f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ServerCredential", "put_ServerCredential", "get_ProxyCredential", "put_ProxyCredential", "get_MaxResponseBufferSize", "put_MaxResponseBufferSize", "get_Timeout", "put_Timeout", "get_BypassCacheOnRetrieve", "put_BypassCacheOnRetrieve", "SetRequestHeader", "RetrieveFeedAsync"]

    /**
     * Gets or sets the credentials to use when making requests to the server.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.isyndicationclient.servercredential
     * @type {PasswordCredential} 
     */
    ServerCredential {
        get => this.get_ServerCredential()
        set => this.put_ServerCredential(value)
    }

    /**
     * Gets or sets the credentials to use when making requests using a proxy.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.isyndicationclient.proxycredential
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
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.isyndicationclient.maxresponsebuffersize
     * @type {Integer} 
     */
    MaxResponseBufferSize {
        get => this.get_MaxResponseBufferSize()
        set => this.put_MaxResponseBufferSize(value)
    }

    /**
     * Gets or sets the maximum amount of time, in milliseconds, to wait for any of the asynchronous operations to complete. If the operation is not complete within this amount of time, it will fail with a status code indicating that it timed out.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.isyndicationclient.timeout
     * @type {Integer} 
     */
    Timeout {
        get => this.get_Timeout()
        set => this.put_Timeout(value)
    }

    /**
     * Gets or sets a Boolean that indicates whether cache will be bypassed when retrieving the feed.
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.isyndicationclient.bypasscacheonretrieve
     * @type {Boolean} 
     */
    BypassCacheOnRetrieve {
        get => this.get_BypassCacheOnRetrieve()
        set => this.put_BypassCacheOnRetrieve(value)
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_ServerCredential() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PasswordCredential(value)
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_ServerCredential(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_ProxyCredential() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PasswordCredential(value)
    }

    /**
     * 
     * @param {PasswordCredential} value 
     * @returns {HRESULT} 
     */
    put_ProxyCredential(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxResponseBufferSize() {
        result := ComCall(10, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxResponseBufferSize(value) {
        result := ComCall(11, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Timeout() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Timeout(value) {
        result := ComCall(13, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_BypassCacheOnRetrieve() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_BypassCacheOnRetrieve(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Sets an HTTP header for the request. This method can be called multiple times to set multiple headers. When the same header is set multiple times, the values will be concatenated and separated by ",".
     * @param {HSTRING} name The name of the header.
     * @param {HSTRING} value The value of the header.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.isyndicationclient.setrequestheader
     */
    SetRequestHeader(name, value) {
        if(name is String) {
            pin := HSTRING.Create(name)
            name := pin.Value
        }
        name := name is Win32Handle ? NumGet(name, "ptr") : name
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(16, this, "ptr", name, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Initiates an asynchronous operation to download the syndication feed from the given URI. This method instantiates a [SyndicationFeed](syndicationfeed.md) object from the feed string, which can be in one of the formats specified in [SyndicationFormat](syndicationformat.md).
     * @remarks
     * You can call this method multiple times to get several feeds simultaneously.
     * @param {Uri} uri_ The URI from which the feed is downloaded.
     * @returns {IAsyncOperationWithProgress<SyndicationFeed, RetrievalProgress>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.syndication.isyndicationclient.retrievefeedasync
     */
    RetrieveFeedAsync(uri_) {
        result := ComCall(17, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(SyndicationFeed, (ptr) => IPropertyValue(ptr).GetRetrievalProgress(), operation)
    }
}
