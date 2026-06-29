#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_PROGRAM_IDENTIFIER.ahk" { D3D12_PROGRAM_IDENTIFIER }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SET_RAYTRACING_PIPELINE_DESC {
    #StructPack 8

    ProgramIdentifier : D3D12_PROGRAM_IDENTIFIER

}
