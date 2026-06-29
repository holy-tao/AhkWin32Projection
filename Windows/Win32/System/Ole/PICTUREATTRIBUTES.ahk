#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies attributes of a picture object as returned through the IPicture::get_Attributes method.
 * @see https://learn.microsoft.com/windows/win32/api/ocidl/ne-ocidl-pictureattributes
 * @namespace Windows.Win32.System.Ole
 */
export default struct PICTUREATTRIBUTES {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The picture object is scalable, such that it can be redrawn with a different size than was used to create the picture originally. Metafile-based pictures are considered scalable; icon and bitmap pictures, while they can be scaled, do not express this attribute because both involve bitmap stretching instead of true scaling.
     * @type {Integer (Int32)}
     */
    static PICTURE_SCALABLE => 1

    /**
     * The picture object contains an image that has transparent areas, such that drawing the picture will not necessarily fill in all the spaces in the rectangle it occupies. Metafile and icon pictures have this attribute; bitmap pictures do not.
     * @type {Integer (Int32)}
     */
    static PICTURE_TRANSPARENT => 2
}
