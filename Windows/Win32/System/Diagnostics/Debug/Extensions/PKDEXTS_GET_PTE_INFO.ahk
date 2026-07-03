#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IDebugClient.ahk" { IDebugClient }
#Import ".\KDEXTS_PTE_INFO.ahk" { KDEXTS_PTE_INFO }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PKDEXTS_GET_PTE_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PKDEXTS_GET_PTE_INFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDebugClient} Client 
     * @param {Integer} Virtual 
     * @param {Pointer<KDEXTS_PTE_INFO>} PteInfo 
     * @returns {HRESULT} 
     */
    Call(Client, Virtual, PteInfo) {
        result := DllCall(this.value, "ptr", Client, Int64, Virtual, KDEXTS_PTE_INFO.Ptr, PteInfo, "HRESULT")
        return result
    }

    /**
     * A PKDEXTS_GET_PTE_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PKDEXTS_GET_PTE_INFO {
        /**
         * Creates a PKDEXTS_GET_PTE_INFO pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int64, KDEXTS_PTE_INFO) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int64, KDEXTS_PTE_INFO.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
