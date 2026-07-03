#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SOCKADDR.ahk" { SOCKADDR }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPFN_GETACCEPTEXSOCKADDRS {
    value : IntPtr

    __value {
        set {
            if (value is LPFN_GETACCEPTEXSOCKADDRS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} lpOutputBuffer 
     * @param {Integer} dwReceiveDataLength 
     * @param {Integer} dwLocalAddressLength 
     * @param {Integer} dwRemoteAddressLength 
     * @param {Pointer<Pointer<SOCKADDR>>} LocalSockaddr 
     * @param {Pointer<Integer>} LocalSockaddrLength 
     * @param {Pointer<Pointer<SOCKADDR>>} RemoteSockaddr 
     * @param {Pointer<Integer>} RemoteSockaddrLength 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(lpOutputBuffer, dwReceiveDataLength, dwLocalAddressLength, dwRemoteAddressLength, LocalSockaddr, LocalSockaddrLength, RemoteSockaddr, RemoteSockaddrLength) {
        lpOutputBufferMarshal := lpOutputBuffer is VarRef ? "ptr" : "ptr"
        LocalSockaddrMarshal := LocalSockaddr is VarRef ? "ptr*" : "ptr"
        LocalSockaddrLengthMarshal := LocalSockaddrLength is VarRef ? "int*" : "ptr"
        RemoteSockaddrMarshal := RemoteSockaddr is VarRef ? "ptr*" : "ptr"
        RemoteSockaddrLengthMarshal := RemoteSockaddrLength is VarRef ? "int*" : "ptr"

        DllCall(this.value, lpOutputBufferMarshal, lpOutputBuffer, UInt32, dwReceiveDataLength, UInt32, dwLocalAddressLength, UInt32, dwRemoteAddressLength, LocalSockaddrMarshal, LocalSockaddr, LocalSockaddrLengthMarshal, LocalSockaddrLength, RemoteSockaddrMarshal, RemoteSockaddr, RemoteSockaddrLengthMarshal, RemoteSockaddrLength)
    }

    /**
     * A LPFN_GETACCEPTEXSOCKADDRS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFN_GETACCEPTEXSOCKADDRS {
        /**
         * Creates a LPFN_GETACCEPTEXSOCKADDRS pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, UInt32, UInt32, "ptr*", "int*", "ptr*", "int*") => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, UInt32, UInt32, "ptr*", "int*", "ptr*", "int*", IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
