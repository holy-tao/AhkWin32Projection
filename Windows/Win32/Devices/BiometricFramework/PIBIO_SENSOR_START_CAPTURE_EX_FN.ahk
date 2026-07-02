#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\IO\OVERLAPPED.ahk" { OVERLAPPED }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_SENSOR_START_CAPTURE_EX_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_SENSOR_START_CAPTURE_EX_FN) {
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
     * @param {Integer} Purpose 
     * @param {Integer} Nonce 
     * @param {Pointer} NonceSize 
     * @param {Integer} Flags 
     * @returns {Pointer<OVERLAPPED>} 
     */
    Call(Pipeline, Purpose, Nonce, NonceSize, Flags) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, Int8, Purpose, IntPtr, Nonce, IntPtr, NonceSize, Int8, Flags, "ptr*", &_Overlapped := 0, "HRESULT")
        return _Overlapped
    }

    /**
     * A PIBIO_SENSOR_START_CAPTURE_EX_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_SENSOR_START_CAPTURE_EX_FN {
        /**
         * Creates a PIBIO_SENSOR_START_CAPTURE_EX_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, Int8, IntPtr, IntPtr, Int8) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, Int8, IntPtr, IntPtr, Int8, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
