#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }
#Import "..\MediaFoundation\DXVA2_VideoProcessorCaps.ahk" { DXVA2_VideoProcessorCaps }
#Import "..\MediaFoundation\DXVA2_VideoDesc.ahk" { DXVA2_VideoDesc }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct PDXVA2SW_GETVIDEOPROCESSORCAPS {
    value : IntPtr

    __value {
        set {
            if (value is PDXVA2SW_GETVIDEOPROCESSORCAPS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DXVA2_VideoDesc>} pVideoDesc 
     * @param {D3DFORMAT} RenderTargetFormat 
     * @param {Pointer<DXVA2_VideoProcessorCaps>} pCaps 
     * @returns {HRESULT} 
     */
    Call(pVideoDesc, RenderTargetFormat, pCaps) {
        result := DllCall(this.value, DXVA2_VideoDesc.Ptr, pVideoDesc, D3DFORMAT, RenderTargetFormat, DXVA2_VideoProcessorCaps.Ptr, pCaps, "HRESULT")
        return result
    }

    /**
     * A PDXVA2SW_GETVIDEOPROCESSORCAPS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVA2SW_GETVIDEOPROCESSORCAPS {
        /**
         * Creates a PDXVA2SW_GETVIDEOPROCESSORCAPS pointer that invokes the given AHK function when called.
         * @param {Func(DXVA2_VideoDesc, D3DFORMAT, DXVA2_VideoProcessorCaps) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DXVA2_VideoDesc.Ptr, D3DFORMAT, DXVA2_VideoProcessorCaps.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
