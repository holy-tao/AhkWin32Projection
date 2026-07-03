#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKET.ahk" { SOCKET }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWPUMODIFYIFSHANDLE {
    value : IntPtr

    __value {
        set {
            if (value is LPWPUMODIFYIFSHANDLE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwCatalogEntryId 
     * @param {SOCKET} ProposedHandle 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {SOCKET} 
     */
    Call(dwCatalogEntryId, ProposedHandle, lpErrno) {
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, UInt32, dwCatalogEntryId, SOCKET, ProposedHandle, lpErrnoMarshal, lpErrno, SOCKET.Owned)
        return result
    }

    /**
     * A LPWPUMODIFYIFSHANDLE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWPUMODIFYIFSHANDLE {
        /**
         * Creates a LPWPUMODIFYIFSHANDLE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, SOCKET, "int*") => SOCKET} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, SOCKET, "int*", SOCKET])
        }

        __Delete() => CallbackFree(this.value)
    }
}
