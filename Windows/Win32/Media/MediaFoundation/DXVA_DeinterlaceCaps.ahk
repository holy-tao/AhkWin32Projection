#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVA_VideoProcessCaps.ahk" { DXVA_VideoProcessCaps }
#Import ".\DXVA_DeinterlaceTech.ahk" { DXVA_DeinterlaceTech }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_DeinterlaceCaps {
    #StructPack 4

    Size : UInt32

    NumPreviousOutputFrames : UInt32

    InputPool : UInt32

    NumForwardRefSamples : UInt32

    NumBackwardRefSamples : UInt32

    d3dOutputFormat : D3DFORMAT

    VideoProcessingCaps : DXVA_VideoProcessCaps

    DeinterlaceTechnology : DXVA_DeinterlaceTech

}
