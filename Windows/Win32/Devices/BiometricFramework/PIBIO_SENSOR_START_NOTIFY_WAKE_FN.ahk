#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\IO\OVERLAPPED.ahk" { OVERLAPPED }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_SENSOR_START_NOTIFY_WAKE_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_SENSOR_START_NOTIFY_WAKE_FN) {
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
     * @returns {Pointer<OVERLAPPED>} 
     */
    Call(Pipeline) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, "ptr*", &_Overlapped := 0, "HRESULT")
        return _Overlapped
    }

    /**
     * A PIBIO_SENSOR_START_NOTIFY_WAKE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_SENSOR_START_NOTIFY_WAKE_FN {
        /**
         * Creates a PIBIO_SENSOR_START_NOTIFY_WAKE_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
