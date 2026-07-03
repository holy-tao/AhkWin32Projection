#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TEXT_SOURCE.ahk" { TEXT_SOURCE }

/**
 * @namespace Windows.Win32.System.Search
 */
export default struct PFNFILLTEXTBUFFER {
    value : IntPtr

    __value {
        set {
            if (value is PFNFILLTEXTBUFFER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<TEXT_SOURCE>} pTextSource 
     * @returns {HRESULT} 
     */
    Call(pTextSource) {
        result := DllCall(this.value, TEXT_SOURCE.Ptr, pTextSource, "HRESULT")
        return result
    }

    /**
     * A PFNFILLTEXTBUFFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNFILLTEXTBUFFER {
        /**
         * Creates a PFNFILLTEXTBUFFER pointer that invokes the given AHK function when called.
         * @param {Func(TEXT_SOURCE) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [TEXT_SOURCE.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
