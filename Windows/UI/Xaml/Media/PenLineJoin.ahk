#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the shape that joins two lines or segments.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.penlinejoin
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class PenLineJoin extends Win32Enum{

    /**
     * Line joins use regular angular vertices.
     * @type {Integer (Int32)}
     */
    static Miter => 0

    /**
     * Line joins use beveled vertices.
     * @type {Integer (Int32)}
     */
    static Bevel => 1

    /**
     * Line joins use rounded vertices.
     * @type {Integer (Int32)}
     */
    static Round => 2
}
