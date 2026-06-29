#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Defines a regions of interest.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ns-mfapi-roi_area
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct ROI_AREA {
    #StructPack 4

    /**
     * The bounds of the region.
     */
    rect : RECT

    /**
     * Specifies the  quantization parameter delta for the specified region from the rest of the frame.
     */
    QPDelta : Int32

}
