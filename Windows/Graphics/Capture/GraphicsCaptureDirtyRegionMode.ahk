#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Graphics.Capture
 * @version WindowsRuntime 1.4
 */
class GraphicsCaptureDirtyRegionMode extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static ReportOnly => 0

    /**
     * @type {Integer (Int32)}
     */
    static ReportAndRender => 1
}
