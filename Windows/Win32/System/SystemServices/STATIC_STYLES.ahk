#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class STATIC_STYLES extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SS_LEFT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SS_CENTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SS_RIGHT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SS_ICON => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SS_BLACKRECT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SS_GRAYRECT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SS_WHITERECT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SS_BLACKFRAME => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SS_GRAYFRAME => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SS_WHITEFRAME => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SS_USERITEM => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SS_SIMPLE => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SS_LEFTNOWORDWRAP => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SS_OWNERDRAW => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SS_BITMAP => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SS_ENHMETAFILE => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SS_ETCHEDHORZ => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SS_ETCHEDVERT => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SS_ETCHEDFRAME => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SS_TYPEMASK => 31

    /**
     * @type {Integer (UInt32)}
     */
    static SS_REALSIZECONTROL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SS_NOPREFIX => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SS_NOTIFY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SS_CENTERIMAGE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SS_RIGHTJUST => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SS_REALSIZEIMAGE => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SS_SUNKEN => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SS_EDITCONTROL => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SS_ENDELLIPSIS => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SS_PATHELLIPSIS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static SS_WORDELLIPSIS => 49152

    /**
     * @type {Integer (UInt32)}
     */
    static SS_ELLIPSISMASK => 49152
}
