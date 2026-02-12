#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify whether an image loaded, or why it failed to load.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.loadedimagesourceloadstatus
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class LoadedImageSourceLoadStatus extends Win32Enum{

    /**
     * The image loaded.
     * @type {Integer (Int32)}
     */
    static Success => 0

    /**
     * The image did not load due to a network error.
     * @type {Integer (Int32)}
     */
    static NetworkError => 1

    /**
     * The image did not load because the image format is invalid.
     * @type {Integer (Int32)}
     */
    static InvalidFormat => 2

    /**
     * The image did not load for some other reason.
     * @type {Integer (Int32)}
     */
    static Other => 3
}
