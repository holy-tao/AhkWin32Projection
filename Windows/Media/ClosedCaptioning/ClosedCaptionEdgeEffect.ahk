#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the edge effect of closed caption text.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.closedcaptioning.closedcaptionedgeeffect
 * @namespace Windows.Media.ClosedCaptioning
 * @version WindowsRuntime 1.4
 */
class ClosedCaptionEdgeEffect extends Win32Enum{

    /**
     * The default edge effect.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * No edge effect.
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * Raised edge.
     * @type {Integer (Int32)}
     */
    static Raised => 2

    /**
     * Depressed edge.
     * @type {Integer (Int32)}
     */
    static Depressed => 3

    /**
     * Uniform edge
     * @type {Integer (Int32)}
     */
    static Uniform => 4

    /**
     * Drop shadow.
     * @type {Integer (Int32)}
     */
    static DropShadow => 5
}
