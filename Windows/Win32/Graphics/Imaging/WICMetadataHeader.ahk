#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents metadata header.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/ns-wincodecsdk-wicmetadataheader
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICMetadataHeader {
    #StructPack 8

    /**
     * Type: <b>ULARGE_INTEGER</b>
     * 
     * The position of the header.
     */
    Position : Int64

    /**
     * Type: <b>ULONG</b>
     * 
     * The length of the header.
     */
    Length : UInt32

    /**
     * Type: <b>BYTE*</b>
     * 
     * Pointer to the header.
     */
    Header : IntPtr

    /**
     * Type: <b>ULARGE_INTEGER</b>
     * 
     * The offset of the header.
     */
    DataOffset : Int64

}
