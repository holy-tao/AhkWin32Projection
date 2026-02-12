#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Determines the video encoding format.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.mediaproperties.videoencodingquality
 * @namespace Windows.Media.MediaProperties
 * @version WindowsRuntime 1.4
 */
class VideoEncodingQuality extends Win32Enum{

    /**
     * **Auto** fills in the proper settings based on the current camera settings. So when **Auto** is used, settings that are manually modified are ignored. For example, if you create a preset profile using one the static create methods, such as [CreateWmv](mediaencodingprofile_createwmv_1317453732.md), and specify **Auto** as the encoding quality, any changes you make to the properties will be overwritten with values based on the current camera settings.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * HD1080p format.
     * @type {Integer (Int32)}
     */
    static HD1080p => 1

    /**
     * HD720p format.
     * @type {Integer (Int32)}
     */
    static HD720p => 2

    /**
     * Wvga format.
     * @type {Integer (Int32)}
     */
    static Wvga => 3

    /**
     * Ntsc format.
     * @type {Integer (Int32)}
     */
    static Ntsc => 4

    /**
     * Pal format.
     * @type {Integer (Int32)}
     */
    static Pal => 5

    /**
     * Vga format.
     * @type {Integer (Int32)}
     */
    static Vga => 6

    /**
     * Qvga format.
     * @type {Integer (Int32)}
     */
    static Qvga => 7

    /**
     * 2160p UHD format.  
     * Use this API to test for avaiability of this enum:
     * 
     *      if (ApiInformation.IsEnumNamedValuePresent("Windows.Media.MediaProperties.VideoEncodingQuality", "Uhd2160p"))
     *      {
     *      }
     * @type {Integer (Int32)}
     */
    static Uhd2160p => 8

    /**
     * 4320p UHD format.  
     * Use this API to test for avaiability of this enum:
     *      
     *      if (ApiInformation.IsEnumNamedValuePresent("Windows.Media.MediaProperties.VideoEncodingQuality", "Uhd4320p"))
     *      {
     *      }
     * @type {Integer (Int32)}
     */
    static Uhd4320p => 9
}
