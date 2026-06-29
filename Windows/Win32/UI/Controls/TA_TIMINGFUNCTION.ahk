#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TA_TIMINGFUNCTION_TYPE.ahk" { TA_TIMINGFUNCTION_TYPE }

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TA_TIMINGFUNCTION {
    #StructPack 4

    eTimingFunctionType : TA_TIMINGFUNCTION_TYPE

}
