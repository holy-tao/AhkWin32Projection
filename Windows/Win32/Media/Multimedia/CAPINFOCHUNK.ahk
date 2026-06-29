#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The CAPINFOCHUNK structure contains parameters that can be used to define an information chunk within an AVI capture file. The WM_CAP_FILE_SET_INFOCHUNK message or capSetInfoChunk macro is used to send a CAPINFOCHUNK structure to a capture window.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-capinfochunk
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct CAPINFOCHUNK {
    #StructPack 8

    /**
     * Four-character code that identifies the representation of the chunk data. If this value is <b>NULL</b> and <b>lpData</b> is <b>NULL</b>, all accumulated information chunks are deleted.
     */
    fccInfoID : UInt32

    /**
     * Pointer to the data. If this value is <b>NULL</b>, all <b>fccInfoID</b> information chunks are deleted.
     */
    lpData : IntPtr

    /**
     * Size, in bytes, of the data pointed to by <b>lpData</b>. If <b>lpData</b> specifies a null-terminated string, use the string length incremented by one to save the <b>NULL</b> with the string.
     */
    cbData : Int32

}
