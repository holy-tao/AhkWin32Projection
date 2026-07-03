#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WINBIO_IDENTITY.ahk" { WINBIO_IDENTITY }
#Import ".\WINBIO_PIPELINE.ahk" { WINBIO_PIPELINE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Devices.BiometricFramework
 */
export default struct PIBIO_ENGINE_IDENTIFY_FEATURE_SET_AUTHENTICATED_FN {
    value : IntPtr

    __value {
        set {
            if (value is PIBIO_ENGINE_IDENTIFY_FEATURE_SET_AUTHENTICATED_FN) {
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
     * @param {Integer} Nonce 
     * @param {Pointer} NonceSize 
     * @param {Pointer<WINBIO_IDENTITY>} Identity 
     * @param {Pointer<Integer>} SubFactor 
     * @param {Pointer<Integer>} RejectDetail 
     * @param {Pointer<Pointer<Integer>>} Authentication 
     * @param {Pointer<Pointer>} AuthenticationSize 
     * @returns {HRESULT} 
     */
    Call(Pipeline, Nonce, NonceSize, Identity, SubFactor, RejectDetail, Authentication, AuthenticationSize) {
        SubFactorMarshal := SubFactor is VarRef ? "char*" : "ptr"
        RejectDetailMarshal := RejectDetail is VarRef ? "uint*" : "ptr"
        AuthenticationMarshal := Authentication is VarRef ? "ptr*" : "ptr"
        AuthenticationSizeMarshal := AuthenticationSize is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, WINBIO_PIPELINE.Ptr, Pipeline, IntPtr, Nonce, IntPtr, NonceSize, WINBIO_IDENTITY.Ptr, Identity, SubFactorMarshal, SubFactor, RejectDetailMarshal, RejectDetail, AuthenticationMarshal, Authentication, AuthenticationSizeMarshal, AuthenticationSize, "HRESULT")
        return result
    }

    /**
     * A PIBIO_ENGINE_IDENTIFY_FEATURE_SET_AUTHENTICATED_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIBIO_ENGINE_IDENTIFY_FEATURE_SET_AUTHENTICATED_FN {
        /**
         * Creates a PIBIO_ENGINE_IDENTIFY_FEATURE_SET_AUTHENTICATED_FN pointer that invokes the given AHK function when called.
         * @param {Func(WINBIO_PIPELINE, IntPtr, IntPtr, WINBIO_IDENTITY, "char*", "uint*", "ptr*", "ptr*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [WINBIO_PIPELINE.Ptr, IntPtr, IntPtr, WINBIO_IDENTITY.Ptr, "char*", "uint*", "ptr*", "ptr*", "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
