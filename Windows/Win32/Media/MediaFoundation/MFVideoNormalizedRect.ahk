#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The MFVideoNormalizedRect (mfcaptureengine.h) structure defines a normalized rectangle, which is used to specify sub-rectangles in a video rectangle.
 * @see https://learn.microsoft.com/windows/win32/api/mfcaptureengine/ns-mfcaptureengine-mfvideonormalizedrect
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFVideoNormalizedRect {
    #StructPack 4

    /**
     * X-coordinate of the upper-left corner of the rectangle.
     */
    left : Float32

    /**
     * Y-coordinate of the upper-left corner of the rectangle.
     */
    top : Float32

    /**
     * X-coordinate of the lower-right corner of the rectangle.
     */
    right : Float32

    /**
     * Y-coordinate of the lower-right corner of the rectangle.
     */
    bottom : Float32

}
