#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that specify the type of UI Automation provider. The IRawElementProviderSimple::ProviderOptions property uses this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/uiautomationcore/ne-uiautomationcore-provideroptions
 * @namespace Windows.Win32.UI.Accessibility
 */
class ProviderOptions extends Win32BitflagEnum {

    /**
     * The provider is a client-side (proxy) provider.
     * Native name: ProviderOptions_ClientSideProvider
     * @type {Integer (Int32)}
     */
    static ClientSideProvider => 1

    /**
     * The provider is a server-side provider.
     * Native name: ProviderOptions_ServerSideProvider
     * @type {Integer (Int32)}
     */
    static ServerSideProvider => 2

    /**
     * The provider is a non-client-area provider.
     * Native name: ProviderOptions_NonClientAreaProvider
     * @type {Integer (Int32)}
     */
    static NonClientAreaProvider => 4

    /**
     * The provider overrides another provider.
     * Native name: ProviderOptions_OverrideProvider
     * @type {Integer (Int32)}
     */
    static OverrideProvider => 8

    /**
     * The provider handles its own focus, and does not want UI Automation to set focus to the nearest window on its behalf. This option is typically used by providers for windows that appear to take focus without actually receiving Win32 focus, such as menus and drop-downs.
     * Native name: ProviderOptions_ProviderOwnsSetFocus
     * @type {Integer (Int32)}
     */
    static ProviderOwnsSetFocus => 16

    /**
     * The provider has explicit support for COM threading models, so that calls by UI Automation on COM-based providers are received on the appropriate thread. This means that STA-based provider implementations will be called back on their own STA thread, and therefore do not need extra synchronization to safely access resources that belong to that STA. MTA-based provider implementations will be called back on some other thread in the MTA, and will require appropriate synchronization to be added, as is usual for MTA code.
     * Native name: ProviderOptions_UseComThreading
     * @type {Integer (Int32)}
     */
    static UseComThreading => 32

    /**
     * The provider handles its own non-client area and does not want UI Automation to provide default accessibility support for controls in the non-client area, such as minimize/maximize buttons and menu bars.
     * Native name: ProviderOptions_RefuseNonClientSupport
     * @type {Integer (Int32)}
     */
    static RefuseNonClientSupport => 64

    /**
     * The provider implements the <a href="https://docs.microsoft.com/windows/desktop/api/oleacc/nn-oleacc-iaccessible">IAccessible</a> interface.
     * Native name: ProviderOptions_HasNativeIAccessible
     * @type {Integer (Int32)}
     */
    static HasNativeIAccessible => 128

    /**
     * The provider works in client coordinates instead of screen coordinates.
     * Native name: ProviderOptions_UseClientCoordinates
     * @type {Integer (Int32)}
     */
    static UseClientCoordinates => 256
}
