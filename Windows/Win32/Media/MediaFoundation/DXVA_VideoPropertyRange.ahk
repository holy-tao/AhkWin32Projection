#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_VideoPropertyRange {
    #StructPack 4

    MinValue : Float32

    MaxValue : Float32

    DefaultValue : Float32

    StepSize : Float32

}
