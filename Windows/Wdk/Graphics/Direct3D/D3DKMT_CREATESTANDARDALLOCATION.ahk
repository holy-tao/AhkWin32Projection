#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_STANDARDALLOCATIONTYPE.ahk" { D3DKMT_STANDARDALLOCATIONTYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_CREATESTANDARDALLOCATION {
    #StructPack 8

    Type : D3DKMT_STANDARDALLOCATIONTYPE

    ExistingHeapData : IntPtr

    Flags : IntPtr

}
