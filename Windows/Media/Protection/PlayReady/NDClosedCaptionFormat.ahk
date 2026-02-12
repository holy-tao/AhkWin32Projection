#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the type of format used for closed captions.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.protection.playready.ndclosedcaptionformat
 * @namespace Windows.Media.Protection.PlayReady
 * @version WindowsRuntime 1.4
 */
class NDClosedCaptionFormat extends Win32Enum{

    /**
     * ATSC digital television closed captions.
     * @type {Integer (Int32)}
     */
    static ATSC => 0

    /**
     * SCTE 20 MPEG2 closed captions.
     * @type {Integer (Int32)}
     */
    static SCTE20 => 1

    /**
     * Invalid format.
     * @type {Integer (Int32)}
     */
    static Unknown => 2
}
