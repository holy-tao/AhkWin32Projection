#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\SOCKET.ahk" { SOCKET }
#Import ".\TRANSMIT_FILE_BUFFERS.ahk" { TRANSMIT_FILE_BUFFERS }
#Import "..\..\System\IO\OVERLAPPED.ahk" { OVERLAPPED }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPFN_TRANSMITFILE {
    value : IntPtr

    __value {
        set {
            if (value is LPFN_TRANSMITFILE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {SOCKET} hSocket 
     * @param {HANDLE} hFile 
     * @param {Integer} nNumberOfBytesToWrite 
     * @param {Integer} nNumberOfBytesPerSend 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @param {Pointer<TRANSMIT_FILE_BUFFERS>} lpTransmitBuffers 
     * @param {Integer} dwReserved 
     * @returns {BOOL} 
     */
    Call(hSocket, hFile, nNumberOfBytesToWrite, nNumberOfBytesPerSend, lpOverlapped, lpTransmitBuffers, dwReserved) {
        result := DllCall(this.value, SOCKET, hSocket, HANDLE, hFile, UInt32, nNumberOfBytesToWrite, UInt32, nNumberOfBytesPerSend, OVERLAPPED.Ptr, lpOverlapped, TRANSMIT_FILE_BUFFERS.Ptr, lpTransmitBuffers, UInt32, dwReserved, BOOL)
        return result
    }

    /**
     * A LPFN_TRANSMITFILE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFN_TRANSMITFILE {
        /**
         * Creates a LPFN_TRANSMITFILE pointer that invokes the given AHK function when called.
         * @param {Func(SOCKET, HANDLE, UInt32, UInt32, OVERLAPPED, TRANSMIT_FILE_BUFFERS, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SOCKET, HANDLE, UInt32, UInt32, OVERLAPPED.Ptr, TRANSMIT_FILE_BUFFERS.Ptr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
