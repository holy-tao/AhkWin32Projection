#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines DVD navigation command types.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-dvd_navcmdtype
 * @namespace Windows.Win32.Media.DirectShow
 */
class DVD_NavCmdType extends Win32Enum {

    /**
     * Pre-command.
     * Native name: DVD_NavCmdType_Pre
     * @type {Integer (Int32)}
     */
    static Pre => 1

    /**
     * Post-command.
     * Native name: DVD_NavCmdType_Post
     * @type {Integer (Int32)}
     */
    static Post => 2

    /**
     * Cell command.
     * Native name: DVD_NavCmdType_Cell
     * @type {Integer (Int32)}
     */
    static Cell => 3

    /**
     * Button command.
     * Native name: DVD_NavCmdType_Button
     * @type {Integer (Int32)}
     */
    static Button => 4
}
