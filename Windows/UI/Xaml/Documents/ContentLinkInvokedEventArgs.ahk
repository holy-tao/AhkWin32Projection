#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContentLinkInvokedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [ContentLink.Invoked](contentlink_invoked.md) event.
 * @remarks
 * > [!IMPORTANT]
 * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlinkinvokedeventargs
 * @namespace Windows.UI.Xaml.Documents
 * @version WindowsRuntime 1.4
 */
class ContentLinkInvokedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContentLinkInvokedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContentLinkInvokedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the ContentLinkInfo object that contains the data for the invoked link.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlinkinvokedeventargs.contentlinkinfo
     * @type {ContentLinkInfo} 
     */
    ContentLinkInfo {
        get => this.get_ContentLinkInfo()
    }

    /**
     * Gets or sets a value that marks the event as handled.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.documents.contentlinkinvokedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {ContentLinkInfo} 
     */
    get_ContentLinkInfo() {
        if (!this.HasProp("__IContentLinkInvokedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContentLinkInvokedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLinkInvokedEventArgs := IContentLinkInvokedEventArgs(outPtr)
        }

        return this.__IContentLinkInvokedEventArgs.get_ContentLinkInfo()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IContentLinkInvokedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContentLinkInvokedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLinkInvokedEventArgs := IContentLinkInvokedEventArgs(outPtr)
        }

        return this.__IContentLinkInvokedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IContentLinkInvokedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContentLinkInvokedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLinkInvokedEventArgs := IContentLinkInvokedEventArgs(outPtr)
        }

        return this.__IContentLinkInvokedEventArgs.put_Handled(value)
    }

;@endregion Instance Methods
}
