#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The WMPRipState enumeration type defines the possible operational states of Windows Media Player as it rips a CD.
 * @remarks
 * 
 * Windows Media Player 10 Mobile: This enumeration is not supported.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wmp/ne-wmp-wmpripstate
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPRipState extends Win32Enum{

    /**
     * Not a valid state.
     * @type {Integer (Int32)}
     */
    static wmprsUnknown => 0

    /**
     * Windows Media Player is ripping.
     * @type {Integer (Int32)}
     */
    static wmprsRipping => 1

    /**
     * The ripping operation is stopped.
     * @type {Integer (Int32)}
     */
    static wmprsStopped => 2
}
