#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the coordinate system used by a [Brush](brush.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.brushmappingmode
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class BrushMappingMode extends Win32Enum{

    /**
     * The coordinate system is not relative to a bounding box. Values are interpreted directly in local space.
     * @type {Integer (Int32)}
     */
    static Absolute => 0

    /**
     * The coordinate system is relative to a bounding box: 0 indicates 0 percent of the bounding box, and 1 indicates 100 percent of the bounding box. For example, (0.5, 0.5) describes a point in the middle of the bounding box, and (1, 1) describes a point at the lower right of the bounding box.
     * @type {Integer (Int32)}
     */
    static RelativeToBoundingBox => 1
}
