#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_CRACK_SINGLE_NAME {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_CRACK_SINGLE_NAME) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} FormatOffered 
     * @param {BOOLEAN} PerformAtGC 
     * @param {Pointer<LSA_UNICODE_STRING>} NameInput 
     * @param {Pointer<LSA_UNICODE_STRING>} Prefix 
     * @param {Integer} RequestedFormat 
     * @param {Pointer<LSA_UNICODE_STRING>} CrackedName 
     * @param {Pointer<LSA_UNICODE_STRING>} DnsDomainName 
     * @param {Pointer<Integer>} SubStatus 
     * @returns {NTSTATUS} 
     */
    Call(FormatOffered, PerformAtGC, NameInput, Prefix, RequestedFormat, CrackedName, DnsDomainName, SubStatus) {
        SubStatusMarshal := SubStatus is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, UInt32, FormatOffered, BOOLEAN, PerformAtGC, LSA_UNICODE_STRING.Ptr, NameInput, LSA_UNICODE_STRING.Ptr, Prefix, UInt32, RequestedFormat, LSA_UNICODE_STRING.Ptr, CrackedName, LSA_UNICODE_STRING.Ptr, DnsDomainName, SubStatusMarshal, SubStatus, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_CRACK_SINGLE_NAME that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_CRACK_SINGLE_NAME {
        /**
         * Creates a PLSA_CRACK_SINGLE_NAME pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, BOOLEAN, LSA_UNICODE_STRING, LSA_UNICODE_STRING, UInt32, LSA_UNICODE_STRING, LSA_UNICODE_STRING, "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, BOOLEAN, LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, UInt32, LSA_UNICODE_STRING.Ptr, LSA_UNICODE_STRING.Ptr, "uint*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
