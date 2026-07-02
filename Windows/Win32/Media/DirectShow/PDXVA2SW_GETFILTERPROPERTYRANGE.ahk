#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }
#Import "..\MediaFoundation\DXVA2_ValueRange.ahk" { DXVA2_ValueRange }
#Import "..\MediaFoundation\DXVA2_VideoDesc.ahk" { DXVA2_VideoDesc }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct PDXVA2SW_GETFILTERPROPERTYRANGE {
    value : IntPtr

    __value {
        set {
            if (value is PDXVA2SW_GETFILTERPROPERTYRANGE) {
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
     * @param {Integer} FilterSetting 
     * @param {Pointer<DXVA2_ValueRange>} pRange 
     * @returns {HRESULT} 
     */
    Call(pVideoDesc, RenderTargetFormat, FilterSetting, pRange) {
        result := DllCall(this.value, DXVA2_VideoDesc.Ptr, pVideoDesc, D3DFORMAT, RenderTargetFormat, UInt32, FilterSetting, DXVA2_ValueRange.Ptr, pRange, "HRESULT")
        return result
    }

    /**
     * A PDXVA2SW_GETFILTERPROPERTYRANGE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXVA2SW_GETFILTERPROPERTYRANGE {
        /**
         * Creates a PDXVA2SW_GETFILTERPROPERTYRANGE pointer that invokes the given AHK function when called.
         * @param {Func(DXVA2_VideoDesc, D3DFORMAT, UInt32, DXVA2_ValueRange) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DXVA2_VideoDesc.Ptr, D3DFORMAT, UInt32, DXVA2_ValueRange.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
