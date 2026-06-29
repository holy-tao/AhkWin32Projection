#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_OUTDUPL_POINTER_SHAPE_TYPE.ahk" { D3DKMT_OUTDUPL_POINTER_SHAPE_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_OUTDUPL_POINTER_SHAPE_INFO {
    #StructPack 8

    Type : D3DKMT_OUTDUPL_POINTER_SHAPE_TYPE

    Width : UInt32

    Height : UInt32

    Pitch : UInt32

    HotSpot : IntPtr

}
