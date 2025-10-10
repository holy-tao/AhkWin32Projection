#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines DVD navigation command types.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-dvd_navcmdtype
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DVD_NavCmdType{

    /**
     * Pre-command.
     * @type {Integer (Int32)}
     */
    static DVD_NavCmdType_Pre => 1

    /**
     * Post-command.
     * @type {Integer (Int32)}
     */
    static DVD_NavCmdType_Post => 2

    /**
     * Cell command.
     * @type {Integer (Int32)}
     */
    static DVD_NavCmdType_Cell => 3

    /**
     * Button command.
     * @type {Integer (Int32)}
     */
    static DVD_NavCmdType_Button => 4
}
