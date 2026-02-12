#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewSettings.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines properties that enable or disable [WebView](webview.md) features.
 * @remarks
 * To get an instance of this class, use the [WebView.Settings](webview_settings.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewsettings
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class WebViewSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the use of JavaScript is allowed in the [WebView](webview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewsettings.isjavascriptenabled
     * @type {Boolean} 
     */
    IsJavaScriptEnabled {
        get => this.get_IsJavaScriptEnabled()
        set => this.put_IsJavaScriptEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the use of **IndexedDB** is allowed in the [WebView](webview.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.webviewsettings.isindexeddbenabled
     * @type {Boolean} 
     */
    IsIndexedDBEnabled {
        get => this.get_IsIndexedDBEnabled()
        set => this.put_IsIndexedDBEnabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsJavaScriptEnabled() {
        if (!this.HasProp("__IWebViewSettings")) {
            if ((queryResult := this.QueryInterface(IWebViewSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewSettings := IWebViewSettings(outPtr)
        }

        return this.__IWebViewSettings.get_IsJavaScriptEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsJavaScriptEnabled(value) {
        if (!this.HasProp("__IWebViewSettings")) {
            if ((queryResult := this.QueryInterface(IWebViewSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewSettings := IWebViewSettings(outPtr)
        }

        return this.__IWebViewSettings.put_IsJavaScriptEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIndexedDBEnabled() {
        if (!this.HasProp("__IWebViewSettings")) {
            if ((queryResult := this.QueryInterface(IWebViewSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewSettings := IWebViewSettings(outPtr)
        }

        return this.__IWebViewSettings.get_IsIndexedDBEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsIndexedDBEnabled(value) {
        if (!this.HasProp("__IWebViewSettings")) {
            if ((queryResult := this.QueryInterface(IWebViewSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewSettings := IWebViewSettings(outPtr)
        }

        return this.__IWebViewSettings.put_IsIndexedDBEnabled(value)
    }

;@endregion Instance Methods
}
