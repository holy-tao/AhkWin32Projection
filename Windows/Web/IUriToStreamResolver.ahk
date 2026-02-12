#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\IAsyncOperation.ahk
#Include ..\Storage\Streams\IInputStream.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides a method to translate a URI to a content stream for use by the [WebView.NavigateToLocalStreamUri](../windows.ui.xaml.controls/webview_navigatetolocalstreamuri_1538250901.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.web.iuritostreamresolver
 * @namespace Windows.Web
 * @version WindowsRuntime 1.4
 */
class IUriToStreamResolver extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUriToStreamResolver
     * @type {Guid}
     */
    static IID => Guid("{b0aba86a-9aeb-4d3a-9590-003e3ca7e290}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["UriToStreamAsync"]

    /**
     * Translates a URI to a content stream for use by the [WebView.NavigateToLocalStreamUri](../windows.ui.xaml.controls/webview_navigatetolocalstreamuri_1538250901.md) method.
     * @remarks
     * If you need to perform a seek operation on the content stream, be sure to return an [IRandomAccessStream](../windows.storage.streams/irandomaccessstream.md). For example, suppose the stream represents a page with embedded media, and you return the result of a [GetInputStreamAt](../windows.storage.streams/irandomaccessstream_getinputstreamat_1916887525.md) call, which is an [IInputStream](../windows.storage.streams/iinputstream.md), but not an [IRandomAccessStream](../windows.storage.streams/irandomaccessstream.md). In this case, the media will play, but the user will not be able to change the playback position.
     * @param {Uri} uri_ The URI to translate.
     * @returns {IAsyncOperation<IInputStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.web.iuritostreamresolver.uritostreamasync
     */
    UriToStreamAsync(uri_) {
        result := ComCall(6, this, "ptr", uri_, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IInputStream, operation)
    }
}
