#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the type of a client-side (proxy) UI Automation provider.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcoreapi/ne-uiautomationcoreapi-providertype
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ProviderType extends Win32Enum{

    /**
     * The provider is window-based.
     * @type {Integer (Int32)}
     */
    static ProviderType_BaseHwnd => 0

    /**
     * The provider is one of the Win32 or Windows Forms providers from Microsoft, or a third-party proxy provider.
     * @type {Integer (Int32)}
     */
    static ProviderType_Proxy => 1

    /**
     * The provider is a proxy for the window's non-client-area elements.
     * @type {Integer (Int32)}
     */
    static ProviderType_NonClientArea => 2
}
