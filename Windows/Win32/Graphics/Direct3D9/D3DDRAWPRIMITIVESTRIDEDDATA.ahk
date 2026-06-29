#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDP_PTRSTRIDE.ahk" { D3DDP_PTRSTRIDE }

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DDRAWPRIMITIVESTRIDEDDATA {
    #StructPack 8

    position : D3DDP_PTRSTRIDE

    normal : D3DDP_PTRSTRIDE

    diffuse : D3DDP_PTRSTRIDE

    specular : D3DDP_PTRSTRIDE

    textureCoords : D3DDP_PTRSTRIDE[8]

}
