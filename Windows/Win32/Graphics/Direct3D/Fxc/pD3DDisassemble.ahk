#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\ID3DBlob.ahk" { ID3DBlob }

/**
 * @namespace Windows.Win32.Graphics.Direct3D.Fxc
 */
export default struct pD3DDisassemble {
    value : IntPtr

    __value {
        set {
            if (value is pD3DDisassemble) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} pSrcData 
     * @param {Pointer} SrcDataSize 
     * @param {Integer} Flags 
     * @param {PSTR} szComments 
     * @returns {ID3DBlob} 
     */
    Call(pSrcData, SrcDataSize, Flags, szComments) {
        szComments := szComments is String ? StrPtr(szComments) : szComments

        result := DllCall(this.value, IntPtr, pSrcData, IntPtr, SrcDataSize, UInt32, Flags, "ptr", szComments, "ptr*", &ppDisassembly := 0, "HRESULT")
        return ID3DBlob(ppDisassembly)
    }

    /**
     * A pD3DDisassemble that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pD3DDisassemble {
        /**
         * Creates a pD3DDisassemble pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, IntPtr, UInt32, PSTR) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, IntPtr, UInt32, PSTR, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
