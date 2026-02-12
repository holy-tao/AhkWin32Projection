#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify options for snap point alignment relative to an edge. Which edge depends on the orientation of the object where the alignment is applied.
 * @remarks
 * This enumeration is used as a value by [ScrollViewer.HorizontalSnapPointsAlignment](../windows.ui.xaml.controls/scrollviewer_horizontalsnappointsalignment.md) and [ScrollViewer.VerticalSnapPointsAlignment](../windows.ui.xaml.controls/scrollviewer_verticalsnappointsalignment.md). It's also used as a parameter type for [IScrollSnapPointsInfo.GetIrregularSnapPoints](iscrollsnappointsinfo_getirregularsnappoints_889794128.md) and [IScrollSnapPointsInfo.GetRegularSnapPoints](iscrollsnappointsinfo_getregularsnappoints_980074349.md), and implementations of those methods on types, such as [StackPanel.GetIrregularSnapPoints](../windows.ui.xaml.controls/stackpanel_getirregularsnappoints_889794128.md).
 * 
 * For a vertically oriented element, **Near** is the top and **Far** is the bottom. For a horizontally oriented element, **Near** is left and **Far** is right.
 * 
 * To learn more about the swipe gesture and panning, see the "Panning behaviors" section of [Guidelines for panning](/windows/uwp/input-and-devices/guidelines-for-panning).
 * 
 * 
 * <!--Does RTL change these assumptions?-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.snappointsalignment
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class SnapPointsAlignment extends Win32Enum{

    /**
     * Use snap points grouped closer to the orientation edge.
     * @type {Integer (Int32)}
     */
    static Near => 0

    /**
     * Use snap points that are centered in the orientation.
     * @type {Integer (Int32)}
     */
    static Center => 1

    /**
     * Use snap points grouped farther from the orientation edge.
     * @type {Integer (Int32)}
     */
    static Far => 2
}
