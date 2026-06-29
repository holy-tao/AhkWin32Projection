#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DKMT_DMMESCAPETYPE.ahk" { D3DKMT_DMMESCAPETYPE }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_DMM_ESCAPE {
    #StructPack 8

    Type : D3DKMT_DMMESCAPETYPE

    ProvidedBufferSize : IntPtr

    MinRequiredBufferSize : IntPtr

    Data : Int8[1]

}
