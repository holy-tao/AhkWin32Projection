#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the result of loading an [SvgImageSource](svgimagesource.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.svgimagesourceloadstatus
 * @namespace Windows.UI.Xaml.Media.Imaging
 * @version WindowsRuntime 1.4
 */
class SvgImageSourceLoadStatus extends Win32Enum{

    /**
     * The SVG loaded.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The SVG did not load due to a network error.
     * @type {Integer (Int32)}
     */
    static NetworkError => 1

    /**
     * The SVG did not load because the SVG format is invalid.
     * @type {Integer (Int32)}
     */
    static InvalidFormat => 2

    /**
     * The SVG did not load for some other reason.
     * @type {Integer (Int32)}
     */
    static Other => 3
}
