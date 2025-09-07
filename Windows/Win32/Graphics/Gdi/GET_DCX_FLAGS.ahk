#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class GET_DCX_FLAGS{

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_WINDOW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_CACHE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_PARENTCLIP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_CLIPSIBLINGS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_CLIPCHILDREN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_NORESETATTRS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_LOCKWINDOWUPDATE => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_EXCLUDERGN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_INTERSECTRGN => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_INTERSECTUPDATE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DCX_VALIDATE => 2097152
}
