#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContentPrefetcherTime.ahk
#Include .\IContentPrefetcher.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides properties for specifying web resources to be prefetched. Windows will use heuristics to attempt to download the specified resources in advance of your app being launched by the user.
 * @remarks
 * Many categories of apps need to download significant amounts of web content upon launch. This can result in poor user experiences where users must wait for content to load before the app becomes fully functional. The ContentPrefetcher class provides mechanisms for specifying resources that Windows should attempt to download in advance of your app being launched by the user.
 * 
 * Heuristics are used to determine when prefetching should occur and which resources will be downloaded. These heuristics take into account system network and power conditions, user app usage history, and the results of prior prefetch attempts to provide maximum user benefit, but there is no guarantee that any particular resource will have been downloaded before a given app launch.
 * 
 * Resources that have been successfully prefetched will be placed in the app-specific [WinINet](/windows/desktop/WinInet/about-wininet) cache. No changes are required to existing HTTP requests for these resources once the app is running; [WinINet](/windows/desktop/WinInet/about-wininet) will simply transparently serve the content from cache if it is available. In the event that a requested resource was not prefetched, an HTTP request for content simply results in a cache miss, and the request is made to the server. Note that this caching strategy works for HTTP requests made using [WinJS.xhr](/previous-versions/windows/apps/br229787(v=win.10)), [Windows.Web.Http.HttpClient](../windows.web.http/httpclient.md), and [IXMLHTTPRequest2](/previous-versions/windows/desktop/api/msxml6/nn-msxml6-ixmlhttprequest2) interface. The .NET Framework  [HttpClient](/dotnet/api/system.net.http.httpclient?view=dotnet-uwp-10.0&preserve-view=true) is not supported.
 * 
 * The ContentPrefetcher class provides two mechanisms for specifying resources that should be prefetched:
 * 
 * 
 * + The [ContentUris](contentprefetcher_contenturis.md) property allows direct, client-side specification of resources to prefetch. This is useful for content with URIs that are fairly static in that they don’t change between subsequent use of the application. An example would be the URIs associated with sections of an app a user is subscribed to which would only change when the user updates their subscription options with the application.
 * + The [IndirectContentUri](contentprefetcher_indirectcontenturi.md) property provides for specifying the location of an XML file that lists resources to prefetch. The resources to prefetch can then be dynamically updated by modifying the contents of the XML. This is useful in cases where content is more dynamic in that the content URIs are expected to change between subsequent use of the application.
 * 
 * An example would be prefetching images for the latest news articles, the news articles and corresponding images change frequently and the XML file can be kept up to date with the latest URIs to prefetch. Apps may use both properties to specify resources to prefetch. Note that a maximum of 40 content URIs are supported and resources specified via the [ContentUri](contentprefetcher_contenturis.md) property will be downloaded in preference to those specified by the [IndirectContentUri](contentprefetcher_indirectcontenturi.md) XML.
 * You should prioritize prefetching content that a user first sees, or that a user frequently uses in order to gain the most benefit from the prefetching operation. You should indicate content that has a reasonably long lifetime for your app. Do not prefetch content that has an immediate or very short expire time, or content that would be retired from a user’s view in a short period of time. Short lived content is a poor choice for prefetched content as it is likely that the content would expire or not be show before the app is used and hence not be a benefit for users.
 * 
 * As mentioned above, the system determines when prefetching is performed for an app. For development purposes, however, you can initiate immediate prefetch for your app by calling the **IContentPrefetcherTaskTrigger** interface desktop API.
 * 
 * To aid in debugging, you can listen to ETW events on the **Microsoft-Windows-BackgroundTransfer-ContentPrefetcher** channel. Occurrences like initiation and completion of prefetching, initiation and completion of an HTTP request, and XML validation will trigger events.
 * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.contentprefetcher
 * @namespace Windows.Networking.BackgroundTransfer
 * @version WindowsRuntime 1.4
 */
class ContentPrefetcher extends IInspectable {
;@region Static Properties
    /**
     * Gets the date and time of the last successful content prefetch operation.
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.contentprefetcher.lastsuccessfulprefetchtime
     * @type {IReference<DateTime>} 
     */
    static LastSuccessfulPrefetchTime {
        get => ContentPrefetcher.get_LastSuccessfulPrefetchTime()
    }

    /**
     * Array of URIs to download when prefetch is performed for the app.
     * @remarks
     * The following example demonstrates the creation and assignment of URIs for prefetching:
     * 
     * 
     * 
     * ```css
     * //First, create content URIs
     * var uris = [new Windows.Foundation.Uri("http://www.microsoft.com/logo.jpg"),
     *             new Windows.Foundation.Uri("http://www.microsoft.com/heroimage.jpg")];
     * 
     * //clear the old list
     * Windows.Networking.BackgroundTransfer.ContentPrefetcher.ContentUris.Clear();
     * Windows.Networking.BackgroundTransfer.ContentPrefetcher.IndirectContentUri = null; // Remove this if your app never uses IndirectContentUri
     * 
     * //next set these as the content URIs:
     * for(vari=0;i<uris.length;i++){
     * Windows.Networking.BackgroundTransfer.ContentPrefetcher.ContentUris.Append(uris[i]);
     * }
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.contentprefetcher.contenturis
     * @type {IVector<Uri>} 
     */
    static ContentUris {
        get => ContentPrefetcher.get_ContentUris()
    }

    /**
     * Specifies the location of a well-formed XML file that contains a list of resources to be prefetched.
     * @remarks
     * The specified resource will be downloaded at the beginning of a prefetch task for an app. Fetching this URL must return a well formatted XML list of additional resources to prefetch.
     * 
     * 
     * 
     * This resource must be of type application/xml and must adhere to the following schema:
     * 
     * ```
     * <?xml version="1.0" encoding="utf-8"?>
     * <xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
     *   <xs:element name="PrefetchUris">
     *     <xs:complexType>
     *       <xs:sequence>
     *         <xs:element minOccurs="1" name="uri" type="xs:anyURI" />
     *       </xs:sequence>
     *     </xs:complexType>
     *   </xs:element>
     * </xs:schema>
     * ```
     * 
     * 
     * 
     * For example:
     * 
     * ```
     * <?xml version="1.0" encoding="utf-8"?>
     * <prefetchUris>
     * 	<uri>http://example.com/2013-02-28-headlines.json</uri>
     * 	<uri>http://example.com/2013-02-28-img1295.jpg</uri> 
     * 	<uri>http://example.com/2013-02-28-img1296.jpg</uri>
     * </prefetchUris>
     * ```
     * 
     * Azure Mobile Services is an option for developers wishing to host a prefetch XML file. To learn more about Azure Mobile Services, see the [Microsoft Azure Mobile Apps site](https://azure.microsoft.com/services/app-service/mobile/).
     * @see https://learn.microsoft.com/uwp/api/windows.networking.backgroundtransfer.contentprefetcher.indirectcontenturi
     * @type {Uri} 
     */
    static IndirectContentUri {
        get => ContentPrefetcher.get_IndirectContentUri()
        set => ContentPrefetcher.put_IndirectContentUri(value)
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    static get_LastSuccessfulPrefetchTime() {
        if (!ContentPrefetcher.HasProp("__IContentPrefetcherTime")) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.ContentPrefetcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPrefetcherTime.IID)
            ContentPrefetcher.__IContentPrefetcherTime := IContentPrefetcherTime(factoryPtr)
        }

        return ContentPrefetcher.__IContentPrefetcherTime.get_LastSuccessfulPrefetchTime()
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    static get_ContentUris() {
        if (!ContentPrefetcher.HasProp("__IContentPrefetcher")) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.ContentPrefetcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPrefetcher.IID)
            ContentPrefetcher.__IContentPrefetcher := IContentPrefetcher(factoryPtr)
        }

        return ContentPrefetcher.__IContentPrefetcher.get_ContentUris()
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    static put_IndirectContentUri(value) {
        if (!ContentPrefetcher.HasProp("__IContentPrefetcher")) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.ContentPrefetcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPrefetcher.IID)
            ContentPrefetcher.__IContentPrefetcher := IContentPrefetcher(factoryPtr)
        }

        return ContentPrefetcher.__IContentPrefetcher.put_IndirectContentUri(value)
    }

    /**
     * 
     * @returns {Uri} 
     */
    static get_IndirectContentUri() {
        if (!ContentPrefetcher.HasProp("__IContentPrefetcher")) {
            activatableClassId := HSTRING.Create("Windows.Networking.BackgroundTransfer.ContentPrefetcher")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IContentPrefetcher.IID)
            ContentPrefetcher.__IContentPrefetcher := IContentPrefetcher(factoryPtr)
        }

        return ContentPrefetcher.__IContentPrefetcher.get_IndirectContentUri()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
