#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_ProcAmpControlBlt {
    #StructPack 4

    Size : UInt32

    DstRect : RECT

    SrcRect : RECT

    Alpha : Float32

    Brightness : Float32

    Contrast : Float32

    Hue : Float32

    Saturation : Float32

}
