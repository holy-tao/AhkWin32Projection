#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains members that identify a pattern within an image file which can be used to identify a particular format.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicbitmappattern
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICBitmapPattern {
    #StructPack 8

    /**
     * Type: <b>ULARGE_INTEGER</b>
     * 
     * The offset the pattern is located in the file.
     */
    Position : Int64

    /**
     * Type: <b>ULONG</b>
     * 
     * The pattern length.
     */
    Length : UInt32

    /**
     * Type: <b>BYTE*</b>
     * 
     * The actual pattern.
     */
    Pattern : IntPtr

    /**
     * Type: <b>BYTE*</b>
     * 
     * The pattern mask.
     */
    Mask : IntPtr

    /**
     * Type: <b>BOOL</b>
     * 
     * The end of the stream.
     */
    EndOfStream : BOOL

}
