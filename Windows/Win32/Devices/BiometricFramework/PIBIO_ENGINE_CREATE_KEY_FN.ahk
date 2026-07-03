#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Called by the Windows Biometric Framework to push an HMAC key to the sensor. The returned key identifier will be passed back to the biometric unit when the framework calls EngineAdapterIdentifyFeatureSetSecure.
 * @remarks
 * Only a single key will be in use at any time. If <b>EngineAdapterCreateKey</b> is called when the engine has knowledge of a preexisting key, the preexisting key must be overwritten with the new one.
 * @see https://learn.microsoft.com/windows/win32/api/winbio_adapter/nc-winbio_adapter-pibio_engine_create_key_fn
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_CREATE_KEY_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_CREATE_KEY_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<WINBIO_PIPELINE>} Pipeline Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winbio_adapter/ns-winbio_adapter-winbio_pipeline">WINBIO_PIPELINE</a> structure associated with the biometric unit performing the operation.
     * @param {Pointer<Integer>} Key Pointer to a buffer that contains the HMAC key.
     * @param {Pointer} KeySize Size, in bytes, of the buffer specified by the <b>Key</b>  parameter.
     * @param {Integer} KeyIdentifier Pointer to a buffer that receives a key identifier. The format of the buffer is vendor-defined.
     * @param {Pointer} KeyIdentifierSize Size, in bytes, of the buffer specified by the <b>KeyIdentifier</b>  parameter.
     * @returns {Pointer} Pointer to a variable that receives the size, in bytes, of the data written to the buffer specified by the <b>KeyIdentifier</b>  parameter.
     */
    Call(Pipeline, Key, KeySize, KeyIdentifier, KeyIdentifierSize) {
        KeyMarshal := Key is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, KeyMarshal, Key, IntPtr, KeySize, IntPtr, KeyIdentifier, IntPtr, KeyIdentifierSize, "ptr*", &ResultSize := 0, "HRESULT")
        return ResultSize
    }

    /**
     * A PIBIO_ENGINE_CREATE_KEY_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_CREATE_KEY_FN {
        /**
         * Creates a PIBIO_ENGINE_CREATE_KEY_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, "char*", IntPtr, IntPtr, IntPtr) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, "char*", IntPtr, IntPtr, IntPtr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
