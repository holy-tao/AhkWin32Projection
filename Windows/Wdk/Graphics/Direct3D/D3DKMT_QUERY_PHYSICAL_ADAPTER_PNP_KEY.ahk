#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_PNP_KEY_TYPE.ahk" { D3DKMT_PNP_KEY_TYPE }
#Import "..\..\..\Win32\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERY_PHYSICAL_ADAPTER_PNP_KEY {
    #StructPack 8

    PhysicalAdapterIndex : UInt32

    PnPKeyType : D3DKMT_PNP_KEY_TYPE

    pDest : PWSTR

    pCchDest : IntPtr

}
