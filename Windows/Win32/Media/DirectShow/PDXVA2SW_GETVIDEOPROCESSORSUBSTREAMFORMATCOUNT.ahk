#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }
#Import "..\MediaFoundation\DXVA2_VideoDesc.ahk" { DXVA2_VideoDesc }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct PDXVA2SW_GETVIDEOPROCESSORSUBSTREAMFORMATCOUNT {
    value : IntPtr

    __value {
        set {
            if (value is PDXVA2SW_GETVIDEOPROCESSORSUBSTREAMFORMATCOUNT) {
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
     * @returns {Integer} 
     */
    Call(pVideoDesc, RenderTargetFormat) {
        result := DllCall(this.value, DXVA2_VideoDesc.Ptr, pVideoDesc, D3DFORMAT, RenderTargetFormat, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * A PDXVA2SW_GETVIDEOPROCESSORSUBSTREAMFORMATCOUNT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVA2SW_GETVIDEOPROCESSORSUBSTREAMFORMATCOUNT {
        /**
         * Creates a PDXVA2SW_GETVIDEOPROCESSORSUBSTREAMFORMATCOUNT pointer that invokes the given AHK function when called.
         * @param {Func(DXVA2_VideoDesc, D3DFORMAT) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DXVA2_VideoDesc.Ptr, D3DFORMAT, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
