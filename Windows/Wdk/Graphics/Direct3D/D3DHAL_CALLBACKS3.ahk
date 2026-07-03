#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPD3DHAL_CLEAR2CB.ahk" { LPD3DHAL_CLEAR2CB }
#Import ".\LPD3DHAL_DRAWPRIMITIVES2CB.ahk" { LPD3DHAL_DRAWPRIMITIVES2CB }
#Import ".\LPD3DHAL_VALIDATETEXTURESTAGESTATECB.ahk" { LPD3DHAL_VALIDATETEXTURESTAGESTATECB }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DHAL_CALLBACKS3 {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    Clear2 : LPD3DHAL_CLEAR2CB

    lpvReserved : IntPtr

    ValidateTextureStageState : LPD3DHAL_VALIDATETEXTURESTAGESTATECB

    DrawPrimitives2 : LPD3DHAL_DRAWPRIMITIVES2CB

}
