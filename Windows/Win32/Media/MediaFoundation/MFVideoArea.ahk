#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MFOffset.ahk" { MFOffset }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * Specifies a rectangular area within a video frame.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ns-mfobjects-mfvideoarea
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFVideoArea {
    #StructPack 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfoffset">MFOffset</a> structure that contains the x-coordinate of the upper-left corner of the rectangle. This coordinate might have a fractional value.
     */
    OffsetX : MFOffset

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/ns-mfobjects-mfoffset">MFOffset</a> structure that contains the y-coordinate of the upper-left corner of the rectangle. This coordinate might have a fractional value.
     */
    OffsetY : MFOffset

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a> structure that contains the width and height of the rectangle.
     */
    Area : SIZE

}
