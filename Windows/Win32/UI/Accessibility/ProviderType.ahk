#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the type of a client-side (proxy) UI Automation provider.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ne-uiautomationcoreapi-providertype
 * @namespace Windows.Win32.UI.Accessibility
 */
class ProviderType extends Win32Enum {

    /**
     * The provider is window-based.
     * Native name: ProviderType_BaseHwnd
     * @type {Integer (Int32)}
     */
    static BaseHwnd => 0

    /**
     * The provider is one of the Win32 or Windows Forms providers from Microsoft, or a third-party proxy provider.
     * Native name: ProviderType_Proxy
     * @type {Integer (Int32)}
     */
    static Proxy => 1

    /**
     * The provider is a proxy for the window's non-client-area elements.
     * Native name: ProviderType_NonClientArea
     * @type {Integer (Int32)}
     */
    static NonClientArea => 2
}
