#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_D3D12_OPTIONS22 {
    #StructPack 4

    ShaderExecutionReorderingActuallyReorders : BOOL

    CreateByteOffsetViewsSupported : BOOL

    Max1DDispatchSize : UInt32

    Max1DDispatchMeshSize : UInt32

}
