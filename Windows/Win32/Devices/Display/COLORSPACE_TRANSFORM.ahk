#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GAMMA_RAMP_RGB.ahk" { GAMMA_RAMP_RGB }
#Import ".\COLORSPACE_TRANSFORM_STAGE_CONTROL.ahk" { COLORSPACE_TRANSFORM_STAGE_CONTROL }
#Import ".\COLORSPACE_TRANSFORM_MATRIX_V2.ahk" { COLORSPACE_TRANSFORM_MATRIX_V2 }
#Import ".\GAMMA_RAMP_RGB256x3x16.ahk" { GAMMA_RAMP_RGB256x3x16 }
#Import ".\GAMMA_RAMP_DXGI_1.ahk" { GAMMA_RAMP_DXGI_1 }
#Import ".\COLORSPACE_TRANSFORM_TYPE.ahk" { COLORSPACE_TRANSFORM_TYPE }
#Import ".\COLORSPACE_TRANSFORM_3x4.ahk" { COLORSPACE_TRANSFORM_3x4 }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct COLORSPACE_TRANSFORM {
    #StructPack 4


    struct _Data {
        Rgb256x3x16 : GAMMA_RAMP_RGB256x3x16

        static __New() {
            DefineProp(this.Prototype, 'Dxgi1', { type: GAMMA_RAMP_DXGI_1, offset: 0 })
            DefineProp(this.Prototype, 'T3x4', { type: COLORSPACE_TRANSFORM_3x4, offset: 0 })
            DefineProp(this.Prototype, 'MatrixV2', { type: COLORSPACE_TRANSFORM_MATRIX_V2, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    Type : COLORSPACE_TRANSFORM_TYPE

    Data : COLORSPACE_TRANSFORM._Data

}
