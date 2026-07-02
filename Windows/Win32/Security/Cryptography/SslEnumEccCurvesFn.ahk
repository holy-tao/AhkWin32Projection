#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NCRYPT_SSL_ECC_CURVE.ahk" { NCRYPT_SSL_ECC_CURVE }
#Import ".\NCRYPT_PROV_HANDLE.ahk" { NCRYPT_PROV_HANDLE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
export default struct SslEnumEccCurvesFn {
    value : IntPtr

    __value {
        set {
            if (value is SslEnumEccCurvesFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {NCRYPT_PROV_HANDLE} hSslProvider 
     * @param {Pointer<Integer>} pEccCurveCount 
     * @param {Pointer<Pointer<NCRYPT_SSL_ECC_CURVE>>} ppEccCurve 
     * @param {Integer} dwFlags 
     * @returns {HRESULT} 
     */
    Call(hSslProvider, pEccCurveCount, ppEccCurve, dwFlags) {
        pEccCurveCountMarshal := pEccCurveCount is VarRef ? "uint*" : "ptr"
        ppEccCurveMarshal := ppEccCurve is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, NCRYPT_PROV_HANDLE, hSslProvider, pEccCurveCountMarshal, pEccCurveCount, ppEccCurveMarshal, ppEccCurve, UInt32, dwFlags, "HRESULT")
        return result
    }

    /**
     * A SslEnumEccCurvesFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SslEnumEccCurvesFn {
        /**
         * Creates a SslEnumEccCurvesFn pointer that invokes the given AHK function when called.
         * @param {Func(NCRYPT_PROV_HANDLE, "uint*", "ptr*", UInt32) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [NCRYPT_PROV_HANDLE, "uint*", "ptr*", UInt32, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
