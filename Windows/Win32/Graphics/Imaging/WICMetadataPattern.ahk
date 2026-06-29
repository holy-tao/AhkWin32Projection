#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a metadata pattern.
 * @see https://learn.microsoft.com/windows/win32/api/wincodecsdk/ns-wincodecsdk-wicmetadatapattern
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICMetadataPattern {
    #StructPack 8

    /**
     * Type: <b>ULARGE_INTEGER</b>
     * 
     * The position of the pattern.
     */
    Position : Int64

    /**
     * Type: <b>ULONG</b>
     * 
     * The length of the pattern.
     */
    Length : UInt32

    /**
     * Type: <b>BYTE*</b>
     * 
     * Pointer to the pattern.
     */
    Pattern : IntPtr

    /**
     * Type: <b>BYTE*</b>
     * 
     * Pointer to the pattern mask.
     */
    Mask : IntPtr

    /**
     * Type: <b>ULARGE_INTEGER</b>
     * 
     * The offset location of the pattern.
     */
    DataOffset : Int64

}
