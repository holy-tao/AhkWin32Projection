#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVA_VideoDesc.ahk" { DXVA_VideoDesc }
#Import ".\DXVA_ProcAmpControlProp.ahk" { DXVA_ProcAmpControlProp }
#Import ".\DXVA_Frequency.ahk" { DXVA_Frequency }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_ProcAmpControlQueryRange {
    #StructPack 4

    Size : UInt32

    ProcAmpControlProp : DXVA_ProcAmpControlProp

    VideoDesc : DXVA_VideoDesc

}
