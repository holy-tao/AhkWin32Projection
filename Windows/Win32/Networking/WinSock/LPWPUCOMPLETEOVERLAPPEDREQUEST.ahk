#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKET.ahk" { SOCKET }
#Import "..\..\System\IO\OVERLAPPED.ahk" { OVERLAPPED }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWPUCOMPLETEOVERLAPPEDREQUEST {
    value : IntPtr

    __value {
        set {
            if (value is LPWPUCOMPLETEOVERLAPPEDREQUEST) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {SOCKET} s 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @param {Integer} dwError 
     * @param {Integer} cbTransferred 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {Integer} 
     */
    Call(s, lpOverlapped, dwError, cbTransferred, lpErrno) {
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, SOCKET, s, OVERLAPPED.Ptr, lpOverlapped, UInt32, dwError, UInt32, cbTransferred, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWPUCOMPLETEOVERLAPPEDREQUEST that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWPUCOMPLETEOVERLAPPEDREQUEST {
        /**
         * Creates a LPWPUCOMPLETEOVERLAPPEDREQUEST pointer that invokes the given AHK function when called.
         * @param {Func(SOCKET, OVERLAPPED, UInt32, UInt32, "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SOCKET, OVERLAPPED.Ptr, UInt32, UInt32, "int*", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
