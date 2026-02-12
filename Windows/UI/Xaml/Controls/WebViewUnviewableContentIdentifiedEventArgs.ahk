#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewUnviewableContentIdentifiedEventArgs.ahk
#Include .\IWebViewUnviewableContentIdentifiedEventArgs2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [WebView.UnviewableContentIdentified](webview_unviewablecontentidentified.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewunviewablecontentidentifiedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class WebViewUnviewableContentIdentifiedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewUnviewableContentIdentifiedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewUnviewableContentIdentifiedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the Uniform Resource Identifier (URI) of the content the [WebView](webview.md) attempted to load.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewunviewablecontentidentifiedeventargs.uri
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * Gets the Uniform Resource Identifier (URI) of the page that contains the link to the unviewable content.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewunviewablecontentidentifiedeventargs.referrer
     * @type {Uri} 
     */
    Referrer {
        get => this.get_Referrer()
    }

    /**
     * Gets the media type of content that can't be viewed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewunviewablecontentidentifiedeventargs.mediatype
     * @type {HSTRING} 
     */
    MediaType {
        get => this.get_MediaType()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        if (!this.HasProp("__IWebViewUnviewableContentIdentifiedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewUnviewableContentIdentifiedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewUnviewableContentIdentifiedEventArgs := IWebViewUnviewableContentIdentifiedEventArgs(outPtr)
        }

        return this.__IWebViewUnviewableContentIdentifiedEventArgs.get_Uri()
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Referrer() {
        if (!this.HasProp("__IWebViewUnviewableContentIdentifiedEventArgs")) {
            if ((queryResult := this.QueryInterface(IWebViewUnviewableContentIdentifiedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewUnviewableContentIdentifiedEventArgs := IWebViewUnviewableContentIdentifiedEventArgs(outPtr)
        }

        return this.__IWebViewUnviewableContentIdentifiedEventArgs.get_Referrer()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_MediaType() {
        if (!this.HasProp("__IWebViewUnviewableContentIdentifiedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IWebViewUnviewableContentIdentifiedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewUnviewableContentIdentifiedEventArgs2 := IWebViewUnviewableContentIdentifiedEventArgs2(outPtr)
        }

        return this.__IWebViewUnviewableContentIdentifiedEventArgs2.get_MediaType()
    }

;@endregion Instance Methods
}
