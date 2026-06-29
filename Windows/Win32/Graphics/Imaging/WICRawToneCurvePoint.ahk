#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents a raw image tone curve point.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicrawtonecurvepoint
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICRawToneCurvePoint {
    #StructPack 8

    /**
     * Type: <b>double</b>
     * 
     * The tone curve input.
     */
    Input : Float64

    /**
     * Type: <b>double</b>
     * 
     * The tone curve output.
     */
    Output : Float64

}
