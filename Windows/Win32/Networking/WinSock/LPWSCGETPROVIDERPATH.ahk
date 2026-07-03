#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSCGETPROVIDERPATH {
    value : IntPtr

    __value {
        set {
            if (value is LPWSCGETPROVIDERPATH) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} lpProviderId 
     * @param {PWSTR} lpszProviderDllPath 
     * @param {Pointer<Integer>} lpProviderDllPathLen 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {Integer} 
     */
    Call(lpProviderId, lpszProviderDllPath, lpProviderDllPathLen, lpErrno) {
        lpszProviderDllPath := lpszProviderDllPath is String ? StrPtr(lpszProviderDllPath) : lpszProviderDllPath

        lpProviderDllPathLenMarshal := lpProviderDllPathLen is VarRef ? "int*" : "ptr"
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, Guid.Ptr, lpProviderId, "ptr", lpszProviderDllPath, lpProviderDllPathLenMarshal, lpProviderDllPathLen, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWSCGETPROVIDERPATH that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSCGETPROVIDERPATH {
        /**
         * Creates a LPWSCGETPROVIDERPATH pointer that invokes the given AHK function when called.
         * @param {Func(Guid, PWSTR, "int*", "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, PWSTR, "int*", "int*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
