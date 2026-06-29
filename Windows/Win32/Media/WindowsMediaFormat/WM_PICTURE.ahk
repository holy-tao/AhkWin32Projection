#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The WM_PICTURE structure is used as the data item for the WM/Picture complex metadata attribute.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/ns-wmsdkidl-wm_picture
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct WM_PICTURE {
    #StructPack 8

    /**
     * Pointer to a wide-character null-terminated string containing the multipurpose Internet mail extension (MIME) type of the picture.
     */
    pwszMIMEType : PWSTR

    bPictureType : Int8

    /**
     * Pointer to a wide-character null-terminated string containing a description of the picture.
     */
    pwszDescription : PWSTR

    /**
     * <b>DWORD</b> value containing the size, in bytes, of the picture data pointed to by <b>pbData</b>.
     */
    dwDataLen : UInt32

    /**
     * Pointer to a <b>BYTE</b> array containing the picture data.
     */
    pbData : IntPtr

}
