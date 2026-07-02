#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPD3DNTHAL_DRAWPRIMITIVES2CB.ahk" { LPD3DNTHAL_DRAWPRIMITIVES2CB }
#Import ".\LPD3DNTHAL_VALIDATETEXTURESTAGESTATECB.ahk" { LPD3DNTHAL_VALIDATETEXTURESTAGESTATECB }
#Import ".\LPD3DNTHAL_CLEAR2CB.ahk" { LPD3DNTHAL_CLEAR2CB }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DNTHAL_CALLBACKS3 {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    Clear2 : LPD3DNTHAL_CLEAR2CB

    lpvReserved : IntPtr

    ValidateTextureStageState : LPD3DNTHAL_VALIDATETEXTURESTAGESTATECB

    DrawPrimitives2 : LPD3DNTHAL_DRAWPRIMITIVES2CB

}
