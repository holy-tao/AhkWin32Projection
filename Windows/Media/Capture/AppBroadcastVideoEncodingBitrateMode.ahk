#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the mode for setting the bitrate for broadcast video encoding.
 * @remarks
 * This enumeration is used by the [AppBroadcastProviderSettings.VideoEncodingBitrateMode](appbroadcastprovidersettings_videoencodingbitratemode.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.media.capture.appbroadcastvideoencodingbitratemode
 * @namespace Windows.Media.Capture
 * @version WindowsRuntime 1.4
 */
class AppBroadcastVideoEncodingBitrateMode extends Win32Enum{

    /**
     * The bitrate specified with the [AppBroadcastProviderSettings.CustomVideoEncodingBitrate](appbroadcastprovidersettings_customvideoencodingbitrate.md) property is used.
     * @type {Integer (Int32)}
     */
    static Custom => 0

    /**
     * The bitrate is set automatically by the system.
     * @type {Integer (Int32)}
     */
    static Auto => 1
}
