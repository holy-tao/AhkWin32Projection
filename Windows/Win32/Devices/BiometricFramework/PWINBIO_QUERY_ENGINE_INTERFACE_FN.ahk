#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_ENGINE_INTERFACE.ahk" { WINBIO_ENGINE_INTERFACE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PWINBIO_QUERY_ENGINE_INTERFACE_FN {
    value : IntPtr

    __value {
        set {
            if (value is PWINBIO_QUERY_ENGINE_INTERFACE_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {Pointer<WINBIO_ENGINE_INTERFACE>} 
     */
    Call() {
        result := DllCall(this.value, "ptr*", &EngineInterface := 0, "HRESULT")
        return EngineInterface
    }

    /**
     * A PWINBIO_QUERY_ENGINE_INTERFACE_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINBIO_QUERY_ENGINE_INTERFACE_FN {
        /**
         * Creates a PWINBIO_QUERY_ENGINE_INTERFACE_FN pointer that invokes the given AHK function when called.
         * @param {Func() => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
