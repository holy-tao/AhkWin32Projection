#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXGKVGPU_ESCAPE_TYPE.ahk" { DXGKVGPU_ESCAPE_TYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DXGKVGPU_ESCAPE_HEAD {
    #StructPack 8

    Luid : IntPtr

    Type : DXGKVGPU_ESCAPE_TYPE

}
