#Requires AutoHotkey v2.0.0 64-bit

/**
 * Note  This section describes functionality designed for use by online stores. Use of this functionality outside the context of an online store is not supported. The WMPTaskType enumeration represents Windows Media Player task panes.
 * @see https://docs.microsoft.com/windows/win32/api//contentpartner/ne-contentpartner-wmptasktype
 * @namespace Windows.Win32.Media.MediaPlayer
 * @version v4.0.30319
 */
class WMPTaskType{

    /**
     * The <b>Browse</b> task pane.
     * @type {Integer (Int32)}
     */
    static wmpttBrowse => 1

    /**
     * The <b>Sync</b> task pane.
     * @type {Integer (Int32)}
     */
    static wmpttSync => 2

    /**
     * The <b>Burn</b> task pane.
     * @type {Integer (Int32)}
     */
    static wmpttBurn => 3

    /**
     * Other task pane.
     * @type {Integer (Int32)}
     */
    static wmpttCurrent => 4
}
