#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether the back button is visible in NavigationView.
  * 
  * Equivalent **WinUI 2 API for UWP**: [Microsoft.UI.Xaml.Controls.NavigationViewBackButtonVisible](/windows/winui/api/microsoft.ui.xaml.controls.navigationviewbackbuttonvisible) (for WinUI in the [Windows App SDK](/windows/apps/windows-app-sdk/), see the **[Windows App SDK namespaces](/windows/windows-app-sdk/api/winrt/)**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.navigationviewbackbuttonvisible
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class NavigationViewBackButtonVisible extends Win32Enum{

    /**
     * Do not display the back button in NavigationView, and do not reserve space for it in layout.
     * @type {Integer (Int32)}
     */
    static Collapsed => 0

    /**
     * Display the back button in NavigationView.
     * @type {Integer (Int32)}
     */
    static Visible => 1

    /**
     * The system chooses whether or not to display the back button, depending on the device/form factor. On phones, tablets, desktops, and hubs, the back button is visible. On Xbox/TV, the back button is collapsed.
     * @type {Integer (Int32)}
     */
    static Auto => 2
}
