#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describe the type of a picture object as returned by IPicture get\_Type, as well as to describe the type of picture in the picType member of the PICTDESC structure that is passed to OleCreatePictureIndirect.
 * @see https://learn.microsoft.com/windows/win32/com/pictype-constants
 * @namespace Windows.Win32.System.Ole
 */
class PICTYPE extends Win32Enum {

    /**
     * Native name: PICTYPE_UNINITIALIZED
     * @type {Integer (Int16)}
     */
    static UNINITIALIZED => -1

    /**
     * Native name: PICTYPE_NONE
     * @type {Integer (Int16)}
     */
    static NONE => 0

    /**
     * Native name: PICTYPE_BITMAP
     * @type {Integer (Int16)}
     */
    static BITMAP => 1

    /**
     * Native name: PICTYPE_METAFILE
     * @type {Integer (Int16)}
     */
    static METAFILE => 2

    /**
     * Native name: PICTYPE_ICON
     * @type {Integer (Int16)}
     */
    static ICON => 3

    /**
     * Native name: PICTYPE_ENHMETAFILE
     * @type {Integer (Int16)}
     */
    static ENHMETAFILE => 4
}
