#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\D3D_SHADER_MACRO.ahk" { D3D_SHADER_MACRO }
#Import "..\ID3DBlob.ahk" { ID3DBlob }
#Import "..\ID3DInclude.ahk" { ID3DInclude }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Fxc
 */
export default struct pD3DCompile {
    value : IntPtr

    __value {
        set {
            if (value is pD3DCompile) {
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
     * @param {PSTR} pEntrypoint 
     * @param {PSTR} pTarget 
     * @param {Integer} Flags1 
     * @param {Integer} Flags2 
     * @param {Pointer<ID3DBlob>} ppCode 
     * @param {Pointer<ID3DBlob>} ppErrorMsgs 
     * @returns {HRESULT} 
     */
    Call(pSrcData, SrcDataSize, pFileName, pDefines, pInclude, pEntrypoint, pTarget, Flags1, Flags2, ppCode, ppErrorMsgs) {
        pFileName := pFileName is String ? StrPtr(pFileName) : pFileName
        pEntrypoint := pEntrypoint is String ? StrPtr(pEntrypoint) : pEntrypoint
        pTarget := pTarget is String ? StrPtr(pTarget) : pTarget

        pSrcDataMarshal := pSrcData is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, pSrcDataMarshal, pSrcData, IntPtr, SrcDataSize, "ptr", pFileName, D3D_SHADER_MACRO.Ptr, pDefines, "ptr", pInclude, "ptr", pEntrypoint, "ptr", pTarget, UInt32, Flags1, UInt32, Flags2, ID3DBlob.Ptr, ppCode, ID3DBlob.Ptr, ppErrorMsgs, "HRESULT")
        return result
    }

    /**
     * A pD3DCompile that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pD3DCompile {
        /**
         * Creates a pD3DCompile pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IntPtr, PSTR, D3D_SHADER_MACRO, "ptr", PSTR, PSTR, UInt32, UInt32, ID3DBlob, ID3DBlob) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 11)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 11 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IntPtr, PSTR, D3D_SHADER_MACRO.Ptr, "ptr", PSTR, PSTR, UInt32, UInt32, ID3DBlob.Ptr, ID3DBlob.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
