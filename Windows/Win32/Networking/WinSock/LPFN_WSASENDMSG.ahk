#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKET.ahk" { SOCKET }
#Import ".\WSAMSG.ahk" { WSAMSG }
#Import "..\..\System\IO\OVERLAPPED.ahk" { OVERLAPPED }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPFN_WSASENDMSG {
    value : IntPtr

    __value {
        set {
            if (value is LPFN_WSASENDMSG) {
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
     * @param {Pointer<WSAMSG>} lpMsg 
     * @param {Integer} dwFlags 
     * @param {Pointer<Integer>} lpNumberOfBytesSent 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @param {Pointer<LPWSAOVERLAPPED_COMPLETION_ROUTINE>} lpCompletionRoutine 
     * @returns {Integer} 
     */
    Call(s, lpMsg, dwFlags, lpNumberOfBytesSent, lpOverlapped, lpCompletionRoutine) {
        lpNumberOfBytesSentMarshal := lpNumberOfBytesSent is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, SOCKET, s, WSAMSG.Ptr, lpMsg, UInt32, dwFlags, lpNumberOfBytesSentMarshal, lpNumberOfBytesSent, OVERLAPPED.Ptr, lpOverlapped, "ptr", lpCompletionRoutine, Int32)
        return result
    }

    /**
     * A LPFN_WSASENDMSG that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFN_WSASENDMSG {
        /**
         * Creates a LPFN_WSASENDMSG pointer that invokes the given AHK function when called.
         * @param {Func(SOCKET, WSAMSG, UInt32, "uint*", OVERLAPPED, "ptr") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SOCKET, WSAMSG.Ptr, UInt32, "uint*", OVERLAPPED.Ptr, "ptr", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
