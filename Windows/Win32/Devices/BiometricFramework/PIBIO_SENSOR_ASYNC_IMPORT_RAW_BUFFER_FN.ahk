#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline 
     * @param {Integer} RawBufferAddress 
     * @param {Pointer} RawBufferSize 
     * @param {Pointer<Pointer<Integer>>} ResultBufferAddress 
     * @param {Pointer<Pointer>} ResultBufferSize 
     * @returns {HRESULT} 
     */
    Call(Pipeline, RawBufferAddress, RawBufferSize, ResultBufferAddress, ResultBufferSize) {
        RawBufferAddressMarshal := RawBufferAddress == 0 ? IntPtr : IntPtr
        ResultBufferAddressMarshal := ResultBufferAddress is VarRef ? "ptr*" : IntPtr
        ResultBufferSizeMarshal := ResultBufferSize is VarRef ? "ptr*" : IntPtr
        ResultBufferSizeMarshal := ResultBufferSize == 0 ? IntPtr : "ptr*"

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, RawBufferAddressMarshal, RawBufferAddress, IntPtr, RawBufferSize, ResultBufferAddressMarshal, ResultBufferAddress, ResultBufferSizeMarshal, ResultBufferSize, "HRESULT")
        return result
    }

    /**
     * A PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN {
        /**
         * Creates a PIBIO_SENSOR_ASYNC_IMPORT_RAW_BUFFER_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, IntPtr, IntPtr, "ptr*", "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, IntPtr, IntPtr, "ptr*", "ptr*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
