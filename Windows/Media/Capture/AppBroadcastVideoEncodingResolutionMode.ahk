#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the mode for setting the resolution for broadcast video encoding.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastvideoencodingresolutionmode
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastVideoEncodingResolutionMode extends Win32Enum{

    /**
     * The resolution specified with the [AppBroadcastProviderSettings.CustomVideoEncodingHeight](appbroadcastprovidersettings_customvideoencodingheight.md) and [CustomVideoEncodingBitrate](appbroadcastprovidersettings_customvideoencodingbitrate.md) properties is used.
     * @type {Integer (Int32)}
     */
    static Custom => 0

    /**
     * The resolution is set automatically by the system.
     * @type {Integer (Int32)}
     */
    static Auto => 1
}
