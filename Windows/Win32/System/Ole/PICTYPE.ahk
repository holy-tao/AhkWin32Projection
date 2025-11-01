#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/com/pictype-constants
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class PICTYPE{

    /**
     * @type {Integer (Int16)}
     */
    static PICTYPE_UNINITIALIZED => -1

    /**
     * @type {Integer (Int16)}
     */
    static PICTYPE_NONE => 0

    /**
     * @type {Integer (Int16)}
     */
    static PICTYPE_BITMAP => 1

    /**
     * @type {Integer (Int16)}
     */
    static PICTYPE_METAFILE => 2

    /**
     * @type {Integer (Int16)}
     */
    static PICTYPE_ICON => 3

    /**
     * @type {Integer (Int16)}
     */
    static PICTYPE_ENHMETAFILE => 4
}
