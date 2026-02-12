#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Declares how a control should included in different views of a Microsoft UI Automation tree.
 * @remarks
 * The view concept helps a Microsoft UI Automation client concentrate on the role or scope of different elements in the overall Microsoft UI Automation tree. For more info on views, see [UI Automation Tree Overview](/windows/desktop/WinAuto/uiauto-treeoverview).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.peers.accessibilityview
 * @namespace Windows.UI.Xaml.Automation.Peers
 * @version WindowsRuntime 1.4
 */
class AccessibilityView extends Win32Enum{

    /**
     * The control is included in the **Raw** view of a Microsoft UI Automation tree.
     * @type {Integer (Int32)}
     */
    static Raw => 0

    /**
     * The control is included in the **Control** view of a Microsoft UI Automation tree.
     * @type {Integer (Int32)}
     */
    static Control => 1

    /**
     * The control is included in the **Content** view of a Microsoft UI Automation tree. This is the default.
     * @type {Integer (Int32)}
     */
    static Content => 2
}
