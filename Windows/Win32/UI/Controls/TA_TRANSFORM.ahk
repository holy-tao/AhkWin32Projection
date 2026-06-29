#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TA_TRANSFORM_TYPE.ahk" { TA_TRANSFORM_TYPE }
#Import ".\TA_TRANSFORM_FLAG.ahk" { TA_TRANSFORM_FLAG }

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TA_TRANSFORM {
    #StructPack 4

    eTransformType : TA_TRANSFORM_TYPE

    dwTimingFunctionId : UInt32

    dwStartTime : UInt32

    dwDurationTime : UInt32

    eFlags : TA_TRANSFORM_FLAG

}
