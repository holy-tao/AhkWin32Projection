#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SOCKET.ahk" { SOCKET }
#Import "..\..\System\IO\OVERLAPPED.ahk" { OVERLAPPED }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPFN_ACCEPTEX {
    value : IntPtr

    __value {
        set {
            if (value is LPFN_ACCEPTEX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {SOCKET} sListenSocket 
     * @param {SOCKET} sAcceptSocket 
     * @param {Pointer<Void>} lpOutputBuffer 
     * @param {Integer} dwReceiveDataLength 
     * @param {Integer} dwLocalAddressLength 
     * @param {Integer} dwRemoteAddressLength 
     * @param {Pointer<Integer>} lpdwBytesReceived 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @returns {BOOL} 
     */
    Call(sListenSocket, sAcceptSocket, lpOutputBuffer, dwReceiveDataLength, dwLocalAddressLength, dwRemoteAddressLength, lpdwBytesReceived, lpOverlapped) {
        lpOutputBufferMarshal := lpOutputBuffer is VarRef ? "ptr" : "ptr"
        lpdwBytesReceivedMarshal := lpdwBytesReceived is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, SOCKET, sListenSocket, SOCKET, sAcceptSocket, lpOutputBufferMarshal, lpOutputBuffer, UInt32, dwReceiveDataLength, UInt32, dwLocalAddressLength, UInt32, dwRemoteAddressLength, lpdwBytesReceivedMarshal, lpdwBytesReceived, OVERLAPPED.Ptr, lpOverlapped, BOOL)
        return result
    }

    /**
     * A LPFN_ACCEPTEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFN_ACCEPTEX {
        /**
         * Creates a LPFN_ACCEPTEX pointer that invokes the given AHK function when called.
         * @param {Func(SOCKET, SOCKET, "ptr", UInt32, UInt32, UInt32, "uint*", OVERLAPPED) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SOCKET, SOCKET, "ptr", UInt32, UInt32, UInt32, "uint*", OVERLAPPED.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
