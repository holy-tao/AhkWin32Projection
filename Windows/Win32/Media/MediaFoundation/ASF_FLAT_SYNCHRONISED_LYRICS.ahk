#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains synchronized lyrics stored as metadata for a media source. This structure is used as the data item for the WM/Lyrics_Synchronised metadata attribute.
 * @remarks
 * The <b>WM/Lyrics_Synchronised</b> attribute is defined in the Windows Media Format SDK. The attribute contains lyrics synchronized to times in the source file.
 * 
 * To get this attribute from a media source, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfmetadata-getproperty">IMFMetadata::GetProperty</a>, passing in the constant g_wszWMLyrics_Synchronised for the <i>pwszName</i> parameter. The method retrieves a <b>PROPVARIANT</b> that contains a binary array (VT_BLOB). The layout of the array is as follows:
 * 
 * <ul>
 * <li>
 * <b>ASF_FLAT_SYNCHRONISED_LYRICS</b> structure.
 * 
 * </li>
 * <li>
 * Null-terminated wide-character string that contains a description.
 * 
 * </li>
 * <li>
 * Lyric data. The format of the lyric data is described in the Windows Media Format SDK documentation.
 * 
 * </li>
 * </ul>
 * This format differs from the <b>WM_SYNCHRONISED_LYRICS</b> structure used in the Windows Media Format SDK. The <b>WM_SYNCHRONISED_LYRICS</b> structure contains internal pointers to two strings and the lyric data. If the structure is copied, these pointers become invalid. The <b>ASF_FLAT_SYNCHRONISED_LYRICS</b> structure does not contain internal pointers, so it is safe to copy the structure.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ns-mfidl-asf_flat_synchronised_lyrics
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ASF_FLAT_SYNCHRONISED_LYRICS {
    #StructPack 4

    /**
     * Specifies the format of time stamps in the lyrics. This member is equivalent to the <b>bTimeStampFormat</b> member in the <b>WM_SYNCHRONISED_LYRICS</b> structure. The <b>WM_SYNCHRONISED_LYRICS</b> structure is documented in the Windows Media Format SDK.
     */
    bTimeStampFormat : Int8

    /**
     * Specifies the type of synchronized strings that are in the lyric data. This member is equivalent to the <b>bContentType</b> member in the <b>WM_SYNCHRONISED_LYRICS</b> structure.
     */
    bContentType : Int8

    /**
     * Size, in bytes, of the lyric data.
     */
    dwLyricsLen : UInt32

}
