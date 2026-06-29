#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TA_TIMINGFUNCTION_TYPE.ahk" { TA_TIMINGFUNCTION_TYPE }
#Import ".\TA_TIMINGFUNCTION.ahk" { TA_TIMINGFUNCTION }

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TA_CUBIC_BEZIER {
    #StructPack 4

    header : TA_TIMINGFUNCTION

    rX0 : Float32

    rY0 : Float32

    rX1 : Float32

    rY1 : Float32

}
