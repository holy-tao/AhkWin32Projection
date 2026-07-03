#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_STORAGE_NOTIFY_DATABASE_CHANGE_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_STORAGE_NOTIFY_DATABASE_CHANGE_FN) {
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
     * @param {BOOLEAN} RecordsAdded 
     * @returns {HRESULT} 
     */
    Call(Pipeline, RecordsAdded) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, BOOLEAN, RecordsAdded, "HRESULT")
        return result
    }

    /**
     * A PIBIO_STORAGE_NOTIFY_DATABASE_CHANGE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_STORAGE_NOTIFY_DATABASE_CHANGE_FN {
        /**
         * Creates a PIBIO_STORAGE_NOTIFY_DATABASE_CHANGE_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, BOOLEAN) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, BOOLEAN, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
