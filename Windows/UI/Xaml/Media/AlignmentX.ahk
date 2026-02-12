#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes how content is positioned horizontally in a container.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.alignmentx
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class AlignmentX extends Win32Enum{

    /**
     * The contents align toward the left of the container.
     * @type {Integer (Int32)}
     */
    static Left => 0

    /**
     * The contents align toward the center of the container.
     * @type {Integer (Int32)}
     */
    static Center => 1

    /**
     * The contents align toward the right of the container.
     * @type {Integer (Int32)}
     */
    static Right => 2
}
