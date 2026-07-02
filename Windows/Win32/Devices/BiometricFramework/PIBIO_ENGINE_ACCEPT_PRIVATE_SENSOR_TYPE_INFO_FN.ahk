#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_ACCEPT_PRIVATE_SENSOR_TYPE_INFO_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_ACCEPT_PRIVATE_SENSOR_TYPE_INFO_FN) {
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
     * @param {Pointer<Integer>} TypeInfoBufferAddress 
     * @param {Pointer} TypeInfoBufferSize 
     * @returns {HRESULT} 
     */
    Call(Pipeline, TypeInfoBufferAddress, TypeInfoBufferSize) {
        TypeInfoBufferAddressMarshal := TypeInfoBufferAddress is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, TypeInfoBufferAddressMarshal, TypeInfoBufferAddress, IntPtr, TypeInfoBufferSize, "HRESULT")
        return result
    }

    /**
     * A PIBIO_ENGINE_ACCEPT_PRIVATE_SENSOR_TYPE_INFO_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_ACCEPT_PRIVATE_SENSOR_TYPE_INFO_FN {
        /**
         * Creates a PIBIO_ENGINE_ACCEPT_PRIVATE_SENSOR_TYPE_INFO_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, "char*", IntPtr) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, "char*", IntPtr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
