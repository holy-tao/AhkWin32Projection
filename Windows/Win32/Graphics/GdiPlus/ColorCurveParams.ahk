#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CurveAdjustments.ahk" { CurveAdjustments }
#Import ".\CurveChannel.ahk" { CurveChannel }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct ColorCurveParams {
    #StructPack 4

    adjustment : CurveAdjustments

    channel : CurveChannel

    adjustValue : Int32

}
