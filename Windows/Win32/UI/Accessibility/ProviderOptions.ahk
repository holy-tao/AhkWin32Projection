#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the type of UI Automation provider. The IRawElementProviderSimple::ProviderOptions property uses this enumeration.
 * @see https://docs.microsoft.com/windows/win32/api//uiautomationcore/ne-uiautomationcore-provideroptions
 * @namespace Windows.Win32.UI.Accessibility
 * @version v4.0.30319
 */
class ProviderOptions extends Win32BitflagEnum{

    /**
     * The provider is a client-side (proxy) provider.
     * @type {Integer (Int32)}
     */
    static ProviderOptions_ClientSideProvider => 1

    /**
     * The provider is a server-side provider.
     * @type {Integer (Int32)}
     */
    static ProviderOptions_ServerSideProvider => 2

    /**
     * The provider is a non-client-area provider.
     * @type {Integer (Int32)}
     */
    static ProviderOptions_NonClientAreaProvider => 4

    /**
     * The provider overrides another provider.
     * @type {Integer (Int32)}
     */
    static ProviderOptions_OverrideProvider => 8

    /**
     * The provider handles its own focus, and does not want UI Automation to set focus to the nearest window on its behalf. This option is typically used by providers for windows that appear to take focus without actually receiving Win32 focus, such as menus and drop-downs.
     * @type {Integer (Int32)}
     */
    static ProviderOptions_ProviderOwnsSetFocus => 16

    /**
     * The provider has explicit support for COM threading models, so that calls by UI Automation on COM-based providers are received on the appropriate thread. This means that STA-based provider implementations will be called back on their own STA thread, and therefore do not need extra synchronization to safely access resources that belong to that STA. MTA-based provider implementations will be called back on some other thread in the MTA, and will require appropriate synchronization to be added, as is usual for MTA code.
     * @type {Integer (Int32)}
     */
    static ProviderOptions_UseComThreading => 32

    /**
     * The provider handles its own non-client area and does not want UI Automation to provide default accessibility support for controls in the non-client area, such as minimize/maximize buttons and menu bars.
     * @type {Integer (Int32)}
     */
    static ProviderOptions_RefuseNonClientSupport => 64

    /**
     * The provider implements the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface.
     * @type {Integer (Int32)}
     */
    static ProviderOptions_HasNativeIAccessible => 128

    /**
     * The provider works in client coordinates instead of screen coordinates.
     * @type {Integer (Int32)}
     */
    static ProviderOptions_UseClientCoordinates => 256
}
