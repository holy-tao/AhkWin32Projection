#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_FRAMEWORK_VSM_DECRYPT_SAMPLE_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_FRAMEWORK_VSM_DECRYPT_SAMPLE_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline 
     * @param {Integer} Authentication 
     * @param {Pointer} AuthenticationSize 
     * @param {Integer} Iv 
     * @param {Pointer} IvSize 
     * @param {Integer} EncryptedData 
     * @param {Pointer} EncryptedDataSize 
     * @returns {HRESULT} 
     */
    Call(Pipeline, Authentication, AuthenticationSize, Iv, IvSize, EncryptedData, EncryptedDataSize) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, IntPtr, Authentication, IntPtr, AuthenticationSize, IntPtr, Iv, IntPtr, IvSize, IntPtr, EncryptedData, IntPtr, EncryptedDataSize, "HRESULT")
        return result
    }

    /**
     * A PIBIO_FRAMEWORK_VSM_DECRYPT_SAMPLE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_FRAMEWORK_VSM_DECRYPT_SAMPLE_FN {
        /**
         * Creates a PIBIO_FRAMEWORK_VSM_DECRYPT_SAMPLE_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, IntPtr, IntPtr, IntPtr, IntPtr, IntPtr, IntPtr) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, IntPtr, IntPtr, IntPtr, IntPtr, IntPtr, IntPtr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
