#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes how content is positioned vertically in a container.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.alignmenty
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class AlignmentY extends Win32Enum{

    /**
     * The contents align toward the upper edge of the container.
     * @type {Integer (Int32)}
     */
    static Top => 0

    /**
     * The contents align toward the center of the container.
     * @type {Integer (Int32)}
     */
    static Center => 1

    /**
     * The contents align toward the lower edge of the container.
     * @type {Integer (Int32)}
     */
    static Bottom => 2
}
