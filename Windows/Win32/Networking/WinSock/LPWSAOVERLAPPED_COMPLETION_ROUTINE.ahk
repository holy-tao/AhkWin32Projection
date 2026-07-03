#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\IO\OVERLAPPED.ahk" { OVERLAPPED }

/**
 * TBD (LPWSAOVERLAPPED_COMPLETION_ROUTINE)
 * @remarks
 * See [**LPOVERLAPPED_COMPLETION_ROUTINE**](../minwinbase/nc-minwinbase-lpoverlapped_completion_routine.md).
 * @see https://learn.microsoft.com/windows/win32/api/winsock2/nc-winsock2-lpwsaoverlapped_completion_routine
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSAOVERLAPPED_COMPLETION_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is LPWSAOVERLAPPED_COMPLETION_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} dwError Type: IN **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The I/O completion status. This parameter can be one of the <a href="https://docs.microsoft.com/windows/win32/Debug/system-error-codes">system error codes</a>.
     * @param {Integer} cbTransferred Type: IN **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of bytes transferred. If an error occurs, this parameter is zero.
     * @param {Pointer<OVERLAPPED>} lpOverlapped Type: IN **[LPWSAOVERLAPPED](./ns-winsock2-wsaoverlapped.md)**
     * 
     * A pointer to the [**WSAOVERLAPPED**](./ns-winsock2-wsaoverlapped.md) structure specified by the asynchronous I/O function.
     * 
     * The system doesn't use the [**WSAOVERLAPPED**](./ns-winsock2-wsaoverlapped.md) structure after the completion routine is called, so the completion routine can deallocate the memory used by the overlapped structure.
     * @param {Integer} dwFlags Type: IN **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * Flags associated with the call.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(dwError, cbTransferred, lpOverlapped, dwFlags) {
        DllCall(this.value, UInt32, dwError, UInt32, cbTransferred, OVERLAPPED.Ptr, lpOverlapped, UInt32, dwFlags)
    }

    /**
     * A LPWSAOVERLAPPED_COMPLETION_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSAOVERLAPPED_COMPLETION_ROUTINE {
        /**
         * Creates a LPWSAOVERLAPPED_COMPLETION_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, OVERLAPPED, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, OVERLAPPED.Ptr, UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
