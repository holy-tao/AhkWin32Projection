#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A MapiFileTagExt structure specifies a message attachment's type at its creation and its current form of encoding so that it can be restored to its original type at its destination.
 * @remarks
 * A <b>MapiFileTagExt</b> structure defines the type of an attached file for purposes such as encoding and decoding the file, choosing the correct application to launch when opening it, or any use that requires full information regarding the file type. Client applications can use information in the <b>lpTag</b> and <b>lpEncoding</b> members of this structure to determine what to do with an attachment.
 * @see https://learn.microsoft.com/windows/win32/api/mapi/ns-mapi-mapifiletagext
 * @namespace Windows.Win32.System.Mapi
 */
export default struct MapiFileTagExt {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * Reserved; must be zero.
     */
    ulReserved : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * The size, in bytes, of the value defined by the <b>lpTag</b> member.
     */
    cbTag : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPBYTE</a></b>
     * 
     * Pointer to an X.400 object identifier indicating the type of the attachment in its original form, for example "Microsoft Excel worksheet".
     */
    lpTag : IntPtr

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG</a></b>
     * 
     * The size, in bytes, of the value defined by the <b>lpEncoding</b> member.
     */
    cbEncoding : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPBYTE</a></b>
     * 
     * Pointer to an X.400 object identifier indicating the form in which the attachment is currently encoded, for example MacBinary, UUENCODE, or binary.
     */
    lpEncoding : IntPtr

}
