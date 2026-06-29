#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVA_VideoDesc.ahk" { DXVA_VideoDesc }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\DXVA_Frequency.ahk" { DXVA_Frequency }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_DeinterlaceQueryModeCaps {
    #StructPack 4

    Size : UInt32

    Guid : Guid

    VideoDesc : DXVA_VideoDesc

}
