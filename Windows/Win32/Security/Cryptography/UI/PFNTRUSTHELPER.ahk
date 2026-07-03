#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\CERT_CONTEXT.ahk" { CERT_CONTEXT }

/**
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct PFNTRUSTHELPER {
    value : IntPtr

    __value {
        set {
            if (value is PFNTRUSTHELPER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} pCertContext 
     * @param {LPARAM} lCustData 
     * @param {BOOL} fLeafCertificate 
     * @param {Pointer<Integer>} pbTrustBlob 
     * @returns {HRESULT} 
     */
    Call(pCertContext, lCustData, fLeafCertificate, pbTrustBlob) {
        pbTrustBlobMarshal := pbTrustBlob is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, CERT_CONTEXT.Ptr, pCertContext, LPARAM, lCustData, BOOL, fLeafCertificate, pbTrustBlobMarshal, pbTrustBlob, "HRESULT")
        return result
    }

    /**
     * A PFNTRUSTHELPER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNTRUSTHELPER {
        /**
         * Creates a PFNTRUSTHELPER pointer that invokes the given AHK function when called.
         * @param {Func(CERT_CONTEXT, LPARAM, BOOL, "char*") => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CERT_CONTEXT.Ptr, LPARAM, BOOL, "char*", "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
