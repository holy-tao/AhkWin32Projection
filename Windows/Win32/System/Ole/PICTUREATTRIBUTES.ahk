#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies attributes of a picture object as returned through the IPicture::get_Attributes method.
 * @see https://docs.microsoft.com/windows/win32/api//ocidl/ne-ocidl-pictureattributes
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class PICTUREATTRIBUTES{

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
