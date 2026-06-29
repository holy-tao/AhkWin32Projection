#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERY_ADAPTER_UNIQUE_GUID {
    #StructPack 2

    AdapterUniqueGUID : WCHAR[40]

}
