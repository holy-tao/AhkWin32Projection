#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\TA_TRANSFORM_TYPE.ahk" { TA_TRANSFORM_TYPE }
#Import ".\TA_TRANSFORM_FLAG.ahk" { TA_TRANSFORM_FLAG }
#Import ".\TA_TRANSFORM.ahk" { TA_TRANSFORM }

/**
 * @namespace Windows.Win32.UI.Controls
 */
export default struct TA_TRANSFORM_2D {
    #StructPack 4

    header : TA_TRANSFORM

    rX : Float32

    rY : Float32

    rInitialX : Float32

    rInitialY : Float32

    rOriginX : Float32

    rOriginY : Float32

}
