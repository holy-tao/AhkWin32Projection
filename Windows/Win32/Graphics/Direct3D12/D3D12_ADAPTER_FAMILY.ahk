#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_ADAPTER_FAMILY {
    #StructPack 2

    szAdapterFamily : WCHAR[128]

}
