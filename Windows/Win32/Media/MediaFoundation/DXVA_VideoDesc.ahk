#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVA_Frequency.ahk" { DXVA_Frequency }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_VideoDesc {
    #StructPack 4

    Size : UInt32

    SampleWidth : UInt32

    SampleHeight : UInt32

    SampleFormat : UInt32

    d3dFormat : D3DFORMAT

    InputSampleFreq : DXVA_Frequency

    OutputFrameFreq : DXVA_Frequency

}
