#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The PlayerState enumeration type provides some basic states of Windows Media Player.
 * @remarks
 * 
 * This enumeration is used by the <b>TimedLevel</b> structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//effects/ne-effects-playerstate
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class PlayerState extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static stop_state => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static pause_state => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static play_state => 2
}
