#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * A ColorCurveParams structure contains members that specify an adjustment to the colors of a bitmap.
 * @see https://docs.microsoft.com/windows/win32/api//gdipluseffects/ns-gdipluseffects-colorcurveparams
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class ColorCurveParams extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ne-gdipluseffects-curveadjustments">CurveAdjustments</a></b>
     * 
     * Element of the <a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ne-gdipluseffects-curveadjustments">CurveAdjustments</a> enumeration that specifies the adjustment to be applied.
     * @type {Integer}
     */
    adjustment {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ne-gdipluseffects-curvechannel">CurveChannel</a></b>
     * 
     * Element of the <a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ne-gdipluseffects-curvechannel">CurveChannel</a> enumeration that specifies the color channel to which the adjustment applies.
     * @type {Integer}
     */
    channel {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>INT</b>
     * 
     * Integer that specifies the intensity of the adjustment. The range of acceptable values depends on which adjustment is being applied. To see the range of acceptable values for a particular adjustment, see the <a href="https://docs.microsoft.com/windows/desktop/api/gdipluseffects/ne-gdipluseffects-curveadjustments">CurveAdjustments</a> enumeration.
     * @type {Integer}
     */
    adjustValue {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }
}
