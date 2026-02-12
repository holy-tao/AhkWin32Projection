#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IContentLinkChangedEventArgs.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides data for the [RichEditBox.ContentLinkChanged](richeditbox_contentlinkchanged.md) event.
 * @remarks
 * > [!IMPORTANT]
 * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentlinkchangedeventargs
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ContentLinkChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IContentLinkChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IContentLinkChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets a value that indicates how the content link is changed.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentlinkchangedeventargs.changekind
     * @type {Integer} 
     */
    ChangeKind {
        get => this.get_ChangeKind()
    }

    /**
     * Gets an object that contains information about the content link.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentlinkchangedeventargs.contentlinkinfo
     * @type {ContentLinkInfo} 
     */
    ContentLinkInfo {
        get => this.get_ContentLinkInfo()
    }

    /**
     * Gets the text range that contains the content link.
     * @remarks
     * > [!IMPORTANT]
     * > This API supports content links. The Windows features that enable content links are not available in versions of Windows after Windows 10 version 1903. Content links for XAML text controls will not function in versions of Windows later than version 1903.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.contentlinkchangedeventargs.textrange
     * @type {TextRange} 
     */
    TextRange {
        get => this.get_TextRange()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeKind() {
        if (!this.HasProp("__IContentLinkChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContentLinkChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLinkChangedEventArgs := IContentLinkChangedEventArgs(outPtr)
        }

        return this.__IContentLinkChangedEventArgs.get_ChangeKind()
    }

    /**
     * 
     * @returns {ContentLinkInfo} 
     */
    get_ContentLinkInfo() {
        if (!this.HasProp("__IContentLinkChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContentLinkChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLinkChangedEventArgs := IContentLinkChangedEventArgs(outPtr)
        }

        return this.__IContentLinkChangedEventArgs.get_ContentLinkInfo()
    }

    /**
     * 
     * @returns {TextRange} 
     */
    get_TextRange() {
        if (!this.HasProp("__IContentLinkChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IContentLinkChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IContentLinkChangedEventArgs := IContentLinkChangedEventArgs(outPtr)
        }

        return this.__IContentLinkChangedEventArgs.get_TextRange()
    }

;@endregion Instance Methods
}
