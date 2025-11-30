#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class REDRAW_WINDOW_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_INVALIDATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_INTERNALPAINT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_ERASE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_VALIDATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_NOINTERNALPAINT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_NOERASE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_NOCHILDREN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_ALLCHILDREN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_UPDATENOW => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_ERASENOW => 512

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_FRAME => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static RDW_NOFRAME => 2048
}
