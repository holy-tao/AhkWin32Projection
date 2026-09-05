#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 */
class GET_DCX_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: DCX_WINDOW
     * @type {Integer (UInt32)}
     */
    static WINDOW => 1

    /**
     * Native name: DCX_CACHE
     * @type {Integer (UInt32)}
     */
    static CACHE => 2

    /**
     * Native name: DCX_PARENTCLIP
     * @type {Integer (UInt32)}
     */
    static PARENTCLIP => 32

    /**
     * Native name: DCX_CLIPSIBLINGS
     * @type {Integer (UInt32)}
     */
    static CLIPSIBLINGS => 16

    /**
     * Native name: DCX_CLIPCHILDREN
     * @type {Integer (UInt32)}
     */
    static CLIPCHILDREN => 8

    /**
     * Native name: DCX_NORESETATTRS
     * @type {Integer (UInt32)}
     */
    static NORESETATTRS => 4

    /**
     * Native name: DCX_LOCKWINDOWUPDATE
     * @type {Integer (UInt32)}
     */
    static LOCKWINDOWUPDATE => 1024

    /**
     * Native name: DCX_EXCLUDERGN
     * @type {Integer (UInt32)}
     */
    static EXCLUDERGN => 64

    /**
     * Native name: DCX_INTERSECTRGN
     * @type {Integer (UInt32)}
     */
    static INTERSECTRGN => 128

    /**
     * Native name: DCX_INTERSECTUPDATE
     * @type {Integer (UInt32)}
     */
    static INTERSECTUPDATE => 512

    /**
     * Native name: DCX_VALIDATE
     * @type {Integer (UInt32)}
     */
    static VALIDATE => 2097152
}
