#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WICRawToneCurvePoint.ahk" { WICRawToneCurvePoint }

/**
 * Represents a raw image tone curve.
 * @see https://learn.microsoft.com/windows/win32/api/wincodec/ns-wincodec-wicrawtonecurve
 * @namespace Windows.Win32.Graphics.Imaging
 */
export default struct WICRawToneCurve {
    #StructPack 8

    /**
     * Type: <b>UINT</b>
     * 
     * The number of tone curve points.
     */
    cPoints : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicrawtonecurvepoint">WICRawToneCurvePoint</a>[1]</b>
     * 
     * The array of tone curve points.
     */
    aPoints : WICRawToneCurvePoint[1]

}
