#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_ProcAmpControlCaps {
    #StructPack 4

    Size : UInt32

    InputPool : UInt32

    d3dOutputFormat : D3DFORMAT

    ProcAmpControlProps : UInt32

    VideoProcessingCaps : UInt32

}
