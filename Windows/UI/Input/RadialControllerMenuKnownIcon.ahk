#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the set of system icons available for a custom [RadialController](radialcontroller.md) tool on the [RadialControllerMenu](radialcontrollermenu.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollermenuknownicon
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class RadialControllerMenuKnownIcon extends Win32Enum{

    /**
     * Icon for the Scroll command.
     * @type {Integer (Int32)}
     */
    static Scroll => 0

    /**
     * Icon for the Zoom command.
     * @type {Integer (Int32)}
     */
    static Zoom => 1

    /**
     * Icon for the Undo/Redo commands.
     * @type {Integer (Int32)}
     */
    static UndoRedo => 2

    /**
     * Icon for the Volume command.
     * @type {Integer (Int32)}
     */
    static Volume => 3

    /**
     * Icon for the Next/Previous track media commands.
     * @type {Integer (Int32)}
     */
    static NextPreviousTrack => 4

    /**
     * Icon for the [InkToolbar](../windows.ui.xaml.controls/inktoolbar.md) [RulerButton](../windows.ui.xaml.controls/inktoolbarrulerbutton.md).
     * @type {Integer (Int32)}
     */
    static Ruler => 5

    /**
     * Icon for the [InkToolbar](../windows.ui.xaml.controls/inktoolbar.md) color palette.
     * @type {Integer (Int32)}
     */
    static InkColor => 6

    /**
     * Icon for the [InkToolbar](../windows.ui.xaml.controls/inktoolbar.md) stroke size setting.
     * @type {Integer (Int32)}
     */
    static InkThickness => 7

    /**
     * Icon for the [InkToolbar](../windows.ui.xaml.controls/inktoolbar.md) [PenButton](../windows.ui.xaml.controls/inktoolbarpenbutton.md).
     * @type {Integer (Int32)}
     */
    static PenType => 8
}
