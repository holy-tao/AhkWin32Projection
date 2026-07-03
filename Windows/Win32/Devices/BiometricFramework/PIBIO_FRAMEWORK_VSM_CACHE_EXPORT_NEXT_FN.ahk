#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_NEXT_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_NEXT_FN) {
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
     * @param {Integer} BufferAddress 
     * @param {Pointer} BufferSize 
     * @returns {Pointer} 
     */
    Call(Pipeline, BufferAddress, BufferSize) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, IntPtr, BufferAddress, IntPtr, BufferSize, "ptr*", &ReturnedDataSize := 0, "HRESULT")
        return ReturnedDataSize
    }

    /**
     * A PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_NEXT_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_NEXT_FN {
        /**
         * Creates a PIBIO_FRAMEWORK_VSM_CACHE_EXPORT_NEXT_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, IntPtr, IntPtr) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, IntPtr, IntPtr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
