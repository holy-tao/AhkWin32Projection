#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\..\Foundation\LUID.ahk" { LUID }
#Import "..\..\..\Foundation\NTSTATUS.ahk" { NTSTATUS }
#Import ".\LSA_UNICODE_STRING.ahk" { LSA_UNICODE_STRING }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PLSA_REDIRECTED_LOGON_INIT {
    value : IntPtr

    __value {
        set {
            if (value is PLSA_REDIRECTED_LOGON_INIT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} RedirectedLogonHandle 
     * @param {Pointer<LSA_UNICODE_STRING>} PackageName 
     * @param {Integer} SessionId 
     * @param {Pointer<LUID>} LogonId 
     * @returns {NTSTATUS} 
     */
    Call(RedirectedLogonHandle, PackageName, SessionId, LogonId) {
        result := DllCall(this.value, HANDLE, RedirectedLogonHandle, LSA_UNICODE_STRING.Ptr, PackageName, UInt32, SessionId, LUID.Ptr, LogonId, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PLSA_REDIRECTED_LOGON_INIT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PLSA_REDIRECTED_LOGON_INIT {
        /**
         * Creates a PLSA_REDIRECTED_LOGON_INIT pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, LSA_UNICODE_STRING, UInt32, LUID) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, LSA_UNICODE_STRING.Ptr, UInt32, LUID.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
