#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains an image that is stored as metadata for a media source. This structure is used as the data item for the WM/Picture metadata attribute.
 * @remarks
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/wmformat/wmpicture">WM/Picture</a> attribute is defined in the Windows Media Format SDK. The attribute contains a picture related to the content, such as album art.
 * 
 * To get this attribute from a media source, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmetadata-getproperty">IMFMetadata::GetProperty</a>, passing in the constant g_wszWMPicture for the <i>pwszName</i> parameter. The method retrieves a <b>PROPVARIANT</b> that contains a binary array (VT_BLOB). The layout of the array is as follows:
 * 
 * <ul>
 * <li><b>ASF_FLAT_PICTURE</b> structure.
 *           </li>
 * <li>Null-terminated wide-character string that contains the MIME type.
 *           </li>
 * <li>Null-terminated wide-character string that contains a description.
 *           </li>
 * <li>
 * Image data.
 * 
 * </li>
 * </ul>
 * This format differs from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_picture">WM_PICTURE</a> structure used in the Windows Media Format SDK. The <b>WM_PICTURE</b> structure contains internal pointers to two strings and the image data. If the structure is copied, these pointers become invalid. The <b>ASF_FLAT_PICTURE</b> structure does not contain internal pointers, so it is safe to copy the structure.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ns-mfidl-asf_flat_picture
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ASF_FLAT_PICTURE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the type of image. This member is equivalent to the <b>bPictureType</b> member in the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_picture">WM_PICTURE</a> structure.
     * @type {Integer}
     */
    bPictureType {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * Size, in bytes, of the image data.
     * @type {Integer}
     */
    dwDataLen {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
