#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import ".\SecBufferDesc.ahk" { SecBufferDesc }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct SpChangeAccountPasswordFn {
    value : IntPtr

    __value {
        set {
            if (value is SpChangeAccountPasswordFn) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<LSA_UNICODE_STRING>} pDomainName 
     * @param {Pointer<LSA_UNICODE_STRING>} pAccountName 
     * @param {Pointer<LSA_UNICODE_STRING>} pOldPassword 
     * @param {Pointer<LSA_UNICODE_STRING>} pNewPassword 
     * @param {BOOLEAN} Impersonating 
     * @param {Pointer<SecBufferDesc>} pOutput 
     * @returns {NTSTATUS} 
     */
    Call(pDomainName, pAccountName, pOldPassword, pNewPassword, Impersonating, pOutput) {
        result := DllCall(this.value, LSA_UNICODE_STRING.Ptr, pDomainName, LSA_UNICODE_STRING.Ptr, pAccountName, LSA_UNICODE_STRING.Ptr, pOldPassword, LSA_UNICODE_STRING.Ptr, pNewPassword, BOOLEAN, Impersonating, SecBufferDesc.Ptr, pOutput, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A SpChangeAccountPasswordFn that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SpChangeAccountPasswordFn {
        /**
         * Creates a SpChangeAccountPasswordFn pointer that invokes the given AHK function when called.
         * @param {Func(LSA_UNICODE_STRING, LSA_UNICODE_STRING, LSA_UNICODE_STRING, LSA_UNICODE_STRING, BOOLEAN, SecBufferDesc) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, BOOLEAN, SecBufferDesc.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
