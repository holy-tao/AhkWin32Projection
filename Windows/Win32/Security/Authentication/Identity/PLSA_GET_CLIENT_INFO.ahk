#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SECPKG_CLIENT_INFO.ahk" { SECPKG_CLIENT_INFO }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_GET_CLIENT_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_GET_CLIENT_INFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SECPKG_CLIENT_INFO>} ClientInfo 
     * @returns {NTSTATUS} 
     */
    Call(ClientInfo) {
        result := DllCall(this.value, SECPKG_CLIENT_INFO.Ptr, ClientInfo, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PLSA_GET_CLIENT_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_GET_CLIENT_INFO {
        /**
         * Creates a PLSA_GET_CLIENT_INFO pointer that invokes the given AHK function when called.
         * @param {Func(SECPKG_CLIENT_INFO) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SECPKG_CLIENT_INFO.Ptr, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
