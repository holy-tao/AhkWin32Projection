#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify where the handwriting view panel is anchored to the control.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.handwritingpanelplacementalignment
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class HandwritingPanelPlacementAlignment extends Win32Enum{

    /**
     * The system determines the best place to anchor the handwriting view panel.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * The handwriting view panel is anchored to the top left corner of the control.
     * @type {Integer (Int32)}
     */
    static TopLeft => 1

    /**
     * The handwriting view panel is anchored to the top right corner of the control.
     * @type {Integer (Int32)}
     */
    static TopRight => 2

    /**
     * The handwriting view panel is anchored to the bottom left corner of the control.
     * @type {Integer (Int32)}
     */
    static BottomLeft => 3

    /**
     * The handwriting view panel is anchored to the bottom right corner of the control.
     * @type {Integer (Int32)}
     */
    static BottomRight => 4
}
