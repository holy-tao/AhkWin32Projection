#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the likelihood that the media engine can play a media source based on its file type and characteristics.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.mediacanplayresponse
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class MediaCanPlayResponse extends Win32Enum{

    /**
     * Media engine cannot support the media source.
     * @type {Integer (Int32)}
     */
    static NotSupported => 0

    /**
     * Media engine might support the media source.
     * @type {Integer (Int32)}
     */
    static Maybe => 1

    /**
     * Media engine can probably support the media source.
     * @type {Integer (Int32)}
     */
    static Probably => 2
}
