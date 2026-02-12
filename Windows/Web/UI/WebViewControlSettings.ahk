#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWebViewControlSettings.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines properties that enable or disable [IWebViewControl](iwebviewcontrol.md) features.
 * @remarks
 * To get an instance of this class, use the [IWebViewControl.Settings](iwebviewcontrol_settings.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolsettings
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class WebViewControlSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWebViewControlSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWebViewControlSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether the use of JavaScript is allowed.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolsettings.isjavascriptenabled
     * @type {Boolean} 
     */
    IsJavaScriptEnabled {
        get => this.get_IsJavaScriptEnabled()
        set => this.put_IsJavaScriptEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether the use of IndexedDB is allowed.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolsettings.isindexeddbenabled
     * @type {Boolean} 
     */
    IsIndexedDBEnabled {
        get => this.get_IsIndexedDBEnabled()
        set => this.put_IsIndexedDBEnabled(value)
    }

    /**
     * Gets or sets whether [ScriptNotify](iwebviewcontrol_scriptnotify.md) is allowed.
     * @see https://learn.microsoft.com/uwp/api/windows.web.ui.webviewcontrolsettings.isscriptnotifyallowed
     * @type {Boolean} 
     */
    IsScriptNotifyAllowed {
        get => this.get_IsScriptNotifyAllowed()
        set => this.put_IsScriptNotifyAllowed(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsJavaScriptEnabled(value) {
        if (!this.HasProp("__IWebViewControlSettings")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSettings := IWebViewControlSettings(outPtr)
        }

        return this.__IWebViewControlSettings.put_IsJavaScriptEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsJavaScriptEnabled() {
        if (!this.HasProp("__IWebViewControlSettings")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSettings := IWebViewControlSettings(outPtr)
        }

        return this.__IWebViewControlSettings.get_IsJavaScriptEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsIndexedDBEnabled(value) {
        if (!this.HasProp("__IWebViewControlSettings")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSettings := IWebViewControlSettings(outPtr)
        }

        return this.__IWebViewControlSettings.put_IsIndexedDBEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIndexedDBEnabled() {
        if (!this.HasProp("__IWebViewControlSettings")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSettings := IWebViewControlSettings(outPtr)
        }

        return this.__IWebViewControlSettings.get_IsIndexedDBEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsScriptNotifyAllowed(value) {
        if (!this.HasProp("__IWebViewControlSettings")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSettings := IWebViewControlSettings(outPtr)
        }

        return this.__IWebViewControlSettings.put_IsScriptNotifyAllowed(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsScriptNotifyAllowed() {
        if (!this.HasProp("__IWebViewControlSettings")) {
            if ((queryResult := this.QueryInterface(IWebViewControlSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWebViewControlSettings := IWebViewControlSettings(outPtr)
        }

        return this.__IWebViewControlSettings.get_IsScriptNotifyAllowed()
    }

;@endregion Instance Methods
}
