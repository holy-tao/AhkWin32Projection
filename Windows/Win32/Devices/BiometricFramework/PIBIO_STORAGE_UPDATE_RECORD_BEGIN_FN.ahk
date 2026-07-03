#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_IDENTITY.ahk" { WINBIO_IDENTITY }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import ".\WINBIO_STORAGE_RECORD.ahk" { WINBIO_STORAGE_RECORD }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN) {
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
     * @param {Pointer<WINBIO_IDENTITY>} Identity 
     * @param {Integer} SubFactor 
     * @param {Pointer<WINBIO_STORAGE_RECORD>} RecordContents 
     * @returns {HRESULT} 
     */
    Call(Pipeline, Identity, SubFactor, RecordContents) {
        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, WINBIO_IDENTITY.Ptr, Identity, Int8, SubFactor, WINBIO_STORAGE_RECORD.Ptr, RecordContents, "HRESULT")
        return result
    }

    /**
     * A PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN {
        /**
         * Creates a PIBIO_STORAGE_UPDATE_RECORD_BEGIN_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, WINBIO_IDENTITY, Int8, WINBIO_STORAGE_RECORD) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, WINBIO_IDENTITY.Ptr, Int8, WINBIO_STORAGE_RECORD.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
