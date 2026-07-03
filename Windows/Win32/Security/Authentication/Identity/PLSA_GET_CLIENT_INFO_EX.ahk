#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\SECPKG_CLIENT_INFO_EX.ahk" { SECPKG_CLIENT_INFO_EX }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_GET_CLIENT_INFO_EX {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_GET_CLIENT_INFO_EX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SECPKG_CLIENT_INFO_EX>} ClientInfo 
     * @param {Integer} StructSize 
     * @returns {NTSTATUS} 
     */
    Call(ClientInfo, StructSize) {
        result := DllCall(this.value, SECPKG_CLIENT_INFO_EX.Ptr, ClientInfo, UInt32, StructSize, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PLSA_GET_CLIENT_INFO_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_GET_CLIENT_INFO_EX {
        /**
         * Creates a PLSA_GET_CLIENT_INFO_EX pointer that invokes the given AHK function when called.
         * @param {Func(SECPKG_CLIENT_INFO_EX, UInt32) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SECPKG_CLIENT_INFO_EX.Ptr, UInt32, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
