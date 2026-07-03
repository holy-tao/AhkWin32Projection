#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_SENSOR_QUERY_PRIVATE_SENSOR_TYPE_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_SENSOR_QUERY_PRIVATE_SENSOR_TYPE_FN) {
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
     * @param {Integer} TypeInfoBufferAddress 
     * @param {Pointer} TypeInfoBufferSize 
     * @returns {Pointer} 
     */
    Call(Pipeline, TypeInfoBufferAddress, TypeInfoBufferSize) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, IntPtr, TypeInfoBufferAddress, IntPtr, TypeInfoBufferSize, "ptr*", &TypeInfoDataSize := 0, "HRESULT")
        return TypeInfoDataSize
    }

    /**
     * A PIBIO_SENSOR_QUERY_PRIVATE_SENSOR_TYPE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_SENSOR_QUERY_PRIVATE_SENSOR_TYPE_FN {
        /**
         * Creates a PIBIO_SENSOR_QUERY_PRIVATE_SENSOR_TYPE_FN pointer that invokes the given AHK function when called.
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
