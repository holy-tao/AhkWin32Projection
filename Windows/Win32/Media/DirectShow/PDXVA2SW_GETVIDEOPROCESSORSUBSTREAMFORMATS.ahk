#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }
#Import "..\MediaFoundation\DXVA2_VideoDesc.ahk" { DXVA2_VideoDesc }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct PDXVA2SW_GETVIDEOPROCESSORSUBSTREAMFORMATS {
    value : IntPtr

    __value {
        set {
            if (value is PDXVA2SW_GETVIDEOPROCESSORSUBSTREAMFORMATS) {
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
     * @param {Integer} Count 
     * @returns {D3DFORMAT} 
     */
    Call(pVideoDesc, RenderTargetFormat, Count) {
        result := DllCall(this.value, DXVA2_VideoDesc.Ptr, pVideoDesc, D3DFORMAT, RenderTargetFormat, UInt32, Count, "uint*", &pFormats := 0, "HRESULT")
        return pFormats
    }

    /**
     * A PDXVA2SW_GETVIDEOPROCESSORSUBSTREAMFORMATS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVA2SW_GETVIDEOPROCESSORSUBSTREAMFORMATS {
        /**
         * Creates a PDXVA2SW_GETVIDEOPROCESSORSUBSTREAMFORMATS pointer that invokes the given AHK function when called.
         * @param {Func(DXVA2_VideoDesc, D3DFORMAT, UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DXVA2_VideoDesc.Ptr, D3DFORMAT, UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
