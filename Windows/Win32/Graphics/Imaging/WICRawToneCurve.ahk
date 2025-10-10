#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WICRawToneCurvePoint.ahk

/**
 * Represents a raw image tone curve.
 * @see https://docs.microsoft.com/windows/win32/api//wincodec/ns-wincodec-wicrawtonecurve
 * @namespace Windows.Win32.Graphics.Imaging
 * @version v4.0.30319
 */
class WICRawToneCurve extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>UINT</b>
     * 
     * The number of tone curve points.
     * @type {Integer}
     */
    cPoints {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wincodec/ns-wincodec-wicrawtonecurvepoint">WICRawToneCurvePoint</a>[1]</b>
     * 
     * The array of tone curve points.
     * @type {Array<WICRawToneCurvePoint>}
     */
    aPoints{
        get {
            if(!this.HasProp("__aPointsProxyArray"))
                this.__aPointsProxyArray := Win32FixedArray(this.ptr + 8, 1, WICRawToneCurvePoint, "")
            return this.__aPointsProxyArray
        }
    }
}
