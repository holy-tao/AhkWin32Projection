#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WSAPROTOCOL_INFOW.ahk" { WSAPROTOCOL_INFOW }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSCUPDATEPROVIDER {
    value : IntPtr

    __value {
        set {
            if (value is LPWSCUPDATEPROVIDER) {
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
     * @param {Pointer<WSAPROTOCOL_INFOW>} lpProtocolInfoList 
     * @param {Integer} dwNumberOfEntries 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {Integer} 
     */
    Call(lpProviderId, lpszProviderDllPath, lpProtocolInfoList, dwNumberOfEntries, lpErrno) {
        lpszProviderDllPath := lpszProviderDllPath is String ? StrPtr(lpszProviderDllPath) : lpszProviderDllPath

        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, Guid.Ptr, lpProviderId, "ptr", lpszProviderDllPath, WSAPROTOCOL_INFOW.Ptr, lpProtocolInfoList, UInt32, dwNumberOfEntries, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWSCUPDATEPROVIDER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSCUPDATEPROVIDER {
        /**
         * Creates a LPWSCUPDATEPROVIDER pointer that invokes the given AHK function when called.
         * @param {Func(Guid, PWSTR, WSAPROTOCOL_INFOW, UInt32, "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, PWSTR, WSAPROTOCOL_INFOW.Ptr, UInt32, "int*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
