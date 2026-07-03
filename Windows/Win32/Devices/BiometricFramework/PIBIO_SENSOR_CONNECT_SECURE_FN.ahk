#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import ".\WINBIO_SECURE_CONNECTION_DATA.ahk" { WINBIO_SECURE_CONNECTION_DATA }
#Import ".\WINBIO_SECURE_CONNECTION_PARAMS.ahk" { WINBIO_SECURE_CONNECTION_PARAMS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_SENSOR_CONNECT_SECURE_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_SENSOR_CONNECT_SECURE_FN) {
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
     * @param {Pointer<WINBIO_SECURE_CONNECTION_PARAMS>} ConnectionParams 
     * @returns {Pointer<WINBIO_SECURE_CONNECTION_DATA>} 
     */
    Call(Pipeline, ConnectionParams) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, WINBIO_SECURE_CONNECTION_PARAMS.Ptr, ConnectionParams, "ptr*", &ConnectionData := 0, "HRESULT")
        return ConnectionData
    }

    /**
     * A PIBIO_SENSOR_CONNECT_SECURE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_SENSOR_CONNECT_SECURE_FN {
        /**
         * Creates a PIBIO_SENSOR_CONNECT_SECURE_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, WINBIO_SECURE_CONNECTION_PARAMS) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, WINBIO_SECURE_CONNECTION_PARAMS.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
