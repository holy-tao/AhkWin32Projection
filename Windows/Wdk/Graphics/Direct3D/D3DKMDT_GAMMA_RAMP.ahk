#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3DDDI_GAMMA_RAMP_RGB256x3x16.ahk" { D3DDDI_GAMMA_RAMP_RGB256x3x16 }
#Import ".\D3DKMDT_COLORSPACE_TRANSFORM_MATRIX_V2.ahk" { D3DKMDT_COLORSPACE_TRANSFORM_MATRIX_V2 }
#Import ".\D3DDDI_GAMMA_RAMP_DXGI_1.ahk" { D3DDDI_GAMMA_RAMP_DXGI_1 }
#Import ".\D3DDDI_GAMMARAMP_TYPE.ahk" { D3DDDI_GAMMARAMP_TYPE }
#Import ".\D3DKMDT_3x4_COLORSPACE_TRANSFORM.ahk" { D3DKMDT_3x4_COLORSPACE_TRANSFORM }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMDT_GAMMA_RAMP {
    #StructPack 8


    struct _Data {
        pRgb256x3x16 : D3DDDI_GAMMA_RAMP_RGB256x3x16.Ptr

        static __New() {
            DefineProp(this.Prototype, 'pDxgi1', { type: D3DDDI_GAMMA_RAMP_DXGI_1.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'p3x4', { type: D3DKMDT_3x4_COLORSPACE_TRANSFORM.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'pMatrixV2', { type: D3DKMDT_COLORSPACE_TRANSFORM_MATRIX_V2.Ptr, offset: 0 })
            DefineProp(this.Prototype, 'pRaw', { type: IntPtr, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Type : D3DDDI_GAMMARAMP_TYPE

    DataSize : IntPtr

    Data : D3DKMDT_GAMMA_RAMP._Data

}
