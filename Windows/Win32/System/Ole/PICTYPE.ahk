#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Describe the type of a picture object as returned by IPicture get\_Type, as well as to describe the type of picture in the picType member of the PICTDESC structure that is passed to OleCreatePictureIndirect.
 * @see https://learn.microsoft.com/windows/win32/com/pictype-constants
 * @namespace Windows.Win32.System.Ole
 */
export default struct PICTYPE {
    value : Int16

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
