#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\D3D_SHADER_MACRO.ahk" { D3D_SHADER_MACRO }
#Import "..\ID3DBlob.ahk" { ID3DBlob }
#Import "..\ID3DInclude.ahk" { ID3DInclude }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Fxc
 */
export default struct pD3DPreprocess {
    value : IntPtr

    __value {
        set {
            if (value is pD3DPreprocess) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} pSrcData 
     * @param {Pointer} SrcDataSize 
     * @param {PSTR} pFileName 
     * @param {Pointer<D3D_SHADER_MACRO>} pDefines 
     * @param {ID3DInclude} pInclude 
     * @param {Pointer<ID3DBlob>} ppCodeText 
     * @param {Pointer<ID3DBlob>} ppErrorMsgs 
     * @returns {HRESULT} 
     */
    Call(pSrcData, SrcDataSize, pFileName, pDefines, pInclude, ppCodeText, ppErrorMsgs) {
        pFileName := pFileName is String ? StrPtr(pFileName) : pFileName

        pSrcDataMarshal := pSrcData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pSrcDataMarshal, pSrcData, IntPtr, SrcDataSize, "ptr", pFileName, D3D_SHADER_MACRO.Ptr, pDefines, "ptr", pInclude, ID3DBlob.Ptr, ppCodeText, ID3DBlob.Ptr, ppErrorMsgs, "HRESULT")
        return result
    }

    /**
     * A pD3DPreprocess that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pD3DPreprocess {
        /**
         * Creates a pD3DPreprocess pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, PSTR, D3D_SHADER_MACRO, "ptr", ID3DBlob, ID3DBlob) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, PSTR, D3D_SHADER_MACRO.Ptr, "ptr", ID3DBlob.Ptr, ID3DBlob.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
