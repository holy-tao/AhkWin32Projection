#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_IDENTITY.ahk" { WINBIO_IDENTITY }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_STORAGE_RESERVED_2_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_STORAGE_RESERVED_2_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Call() {
        static Pipeline := 0, Identity := 0 ;Reserved parameters must always be NULL

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, WINBIO_IDENTITY.Ptr, Identity, "HRESULT")
        return result
    }

    /**
     * A PIBIO_STORAGE_RESERVED_2_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_STORAGE_RESERVED_2_FN {
        /**
         * Creates a PIBIO_STORAGE_RESERVED_2_FN pointer that invokes the given AHK function when called.
         * @param {Func() => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
