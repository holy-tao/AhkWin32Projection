#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines values that represent the reasons that the [Windows.UI.Xaml.UIElement](../windows.ui.xaml/uielement.md) got focus in a desktop application that uses a [DesktopWindowXamlSource](desktopwindowxamlsource.md) object to host XAML-based UI. The [XamlSourceFocusNavigationRequest.Reason](xamlsourcefocusnavigationrequest_reason.md) property returns one of these values.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.hosting.xamlsourcefocusnavigationreason
 * @namespace Windows.UI.Xaml.Hosting
 * @version WindowsRuntime 1.4
 */
class XamlSourceFocusNavigationReason extends Win32Enum{

    /**
     * The focus was set programmatically.
     * @type {Integer (Int32)}
     */
    static Programmatic => 0

    /**
     * The focus was restored after a task switch, such as pressing **Alt** + **Tab**.
     * @type {Integer (Int32)}
     */
    static Restore => 1

    /**
     * The focus was set in response to the user navigating to the next element by using a bidirectional navigation experience (for example, by pressing **Tab**).
     * @type {Integer (Int32)}
     */
    static First => 3

    /**
     * The focus was set in response to the user navigating to the previous element by using a bidirectional navigation experience (for example, by pressing **Shift-Tab**).
     * @type {Integer (Int32)}
     */
    static Last => 4

    /**
     * The focus was set in response to the user navigating left by using a 4-direction navigation experience (for example, by using keyboard arrow keys).
     * @type {Integer (Int32)}
     */
    static Left => 7

    /**
     * The focus was set in response to the user navigating up by using a 4-direction navigation experience (for example, by using keyboard arrow keys).
     * @type {Integer (Int32)}
     */
    static Up => 8

    /**
     * The focus was set in response to the user navigating right by using a 4-direction navigation experience (for example, by using keyboard arrow keys).
     * @type {Integer (Int32)}
     */
    static Right => 9

    /**
     * The focus was set in response to the user navigating down by using a 4-direction navigation experience (for example, by using keyboard arrow keys).
     * @type {Integer (Int32)}
     */
    static Down => 10
}
