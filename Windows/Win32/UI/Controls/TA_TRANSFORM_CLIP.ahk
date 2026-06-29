#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TA_TRANSFORM_TYPE.ahk" { TA_TRANSFORM_TYPE }
#Import ".\TA_TRANSFORM_FLAG.ahk" { TA_TRANSFORM_FLAG }
#Import ".\TA_TRANSFORM.ahk" { TA_TRANSFORM }

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TA_TRANSFORM_CLIP {
    #StructPack 4

    header : TA_TRANSFORM

    rLeft : Float32

    rTop : Float32

    rRight : Float32

    rBottom : Float32

    rInitialLeft : Float32

    rInitialTop : Float32

    rInitialRight : Float32

    rInitialBottom : Float32

}
