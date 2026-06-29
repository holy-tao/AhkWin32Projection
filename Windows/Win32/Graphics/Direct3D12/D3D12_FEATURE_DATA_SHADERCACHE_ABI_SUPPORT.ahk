#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_VERSION_NUMBER.ahk" { D3D12_VERSION_NUMBER }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_FEATURE_DATA_SHADERCACHE_ABI_SUPPORT {
    #StructPack 8

    szAdapterFamily : WCHAR[128]

    MinimumABISupportVersion : Int64

    MaximumABISupportVersion : Int64

    CompilerVersion : D3D12_VERSION_NUMBER

    ApplicationProfileVersion : D3D12_VERSION_NUMBER

}
