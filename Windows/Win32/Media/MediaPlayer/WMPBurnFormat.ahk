#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMPBurnFormat enumeration type defines the possible types of CDs for burning.
 * @remarks
 * Windows Media Player 10 Mobile: This enumeration is not supported.
 * @see https://learn.microsoft.com/windows/win32/api/wmp/ne-wmp-wmpburnformat
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPBurnFormat extends Win32Enum{

    /**
     * The CD being burned is an audio CD.
     * @type {Integer (Int32)}
     */
    static wmpbfAudioCD => 0

    /**
     * The CD being burned is a data CD.
     * @type {Integer (Int32)}
     */
    static wmpbfDataCD => 1
}
