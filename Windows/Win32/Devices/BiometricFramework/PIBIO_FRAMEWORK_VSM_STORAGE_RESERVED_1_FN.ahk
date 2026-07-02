#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_1_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_1_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} Reserved1 
     * @returns {HRESULT} 
     */
    Call(Reserved1) {
        static Pipeline := 0, Reserved2 := 0 ;Reserved parameters must always be NULL

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, IntPtr, Reserved1, "ptr*", Reserved2, "HRESULT")
        return result
    }

    /**
     * A PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_1_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_1_FN {
        /**
         * Creates a PIBIO_FRAMEWORK_VSM_STORAGE_RESERVED_1_FN pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
