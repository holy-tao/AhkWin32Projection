#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that indicate the kind of a [HolographicViewConfiguration](holographicviewconfiguration.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.holographic.holographicviewconfigurationkind
 * @namespace Windows.Graphics.Holographic
 * @version WindowsRuntime 1.4
 */
class HolographicViewConfigurationKind extends Win32Enum{

    /**
     * Specifies that the view configuration is for a display.
     * @type {Integer (Int32)}
     */
    static Display => 0

    /**
     * Specifies that the view configuration is for a photo/video camera.
     * @type {Integer (Int32)}
     */
    static PhotoVideoCamera => 1
}
