#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Graphics\Direct3D9\D3DSTATEBLOCKTYPE.ahk" { D3DSTATEBLOCKTYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_DP2STATESET {
    #StructPack 4

    dwOperation : UInt32

    dwParam : UInt32

    sbType : D3DSTATEBLOCKTYPE

}
