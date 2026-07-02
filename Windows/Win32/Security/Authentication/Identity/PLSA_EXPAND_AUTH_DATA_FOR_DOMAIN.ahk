#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_EXPAND_AUTH_DATA_FOR_DOMAIN {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_EXPAND_AUTH_DATA_FOR_DOMAIN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} UserAuthData 
     * @param {Integer} UserAuthDataSize 
     * @param {Pointer<Void>} Reserved 
     * @param {Pointer<Pointer<Integer>>} ExpandedAuthData 
     * @param {Pointer<Integer>} ExpandedAuthDataSize 
     * @returns {NTSTATUS} 
     */
    Call(UserAuthData, UserAuthDataSize, Reserved, ExpandedAuthData, ExpandedAuthDataSize) {
        ReservedMarshal := Reserved is VarRef ? "ptr" : "ptr"
        ExpandedAuthDataMarshal := ExpandedAuthData is VarRef ? "ptr*" : "ptr"
        ExpandedAuthDataSizeMarshal := ExpandedAuthDataSize is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, IntPtr, UserAuthData, UInt32, UserAuthDataSize, ReservedMarshal, Reserved, ExpandedAuthDataMarshal, ExpandedAuthData, ExpandedAuthDataSizeMarshal, ExpandedAuthDataSize, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_EXPAND_AUTH_DATA_FOR_DOMAIN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_EXPAND_AUTH_DATA_FOR_DOMAIN {
        /**
         * Creates a PLSA_EXPAND_AUTH_DATA_FOR_DOMAIN pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, UInt32, "ptr", "ptr*", "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, UInt32, "ptr", "ptr*", "uint*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
