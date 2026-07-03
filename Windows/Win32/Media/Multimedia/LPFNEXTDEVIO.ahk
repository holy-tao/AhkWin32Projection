#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\System\IO\OVERLAPPED.ahk" { OVERLAPPED }

/**
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct LPFNEXTDEVIO {
    value : IntPtr

    __value {
        set {
            if (value is LPFNEXTDEVIO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {LPARAM} _lParam 
     * @param {Integer} dwFlags 
     * @param {Integer} dwIoControlCode 
     * @param {Pointer<Void>} lpInBuffer 
     * @param {Integer} nInBufferSize 
     * @param {Pointer<Void>} lpOutBuffer 
     * @param {Integer} nOutBufferSize 
     * @param {Pointer<Integer>} lpBytesReturned 
     * @param {Pointer<OVERLAPPED>} lpOverlapped 
     * @returns {BOOL} 
     */
    Call(_lParam, dwFlags, dwIoControlCode, lpInBuffer, nInBufferSize, lpOutBuffer, nOutBufferSize, lpBytesReturned, lpOverlapped) {
        lpInBufferMarshal := lpInBuffer is VarRef ? "ptr" : "ptr"
        lpOutBufferMarshal := lpOutBuffer is VarRef ? "ptr" : "ptr"
        lpBytesReturnedMarshal := lpBytesReturned is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, LPARAM, _lParam, UInt32, dwFlags, UInt32, dwIoControlCode, lpInBufferMarshal, lpInBuffer, UInt32, nInBufferSize, lpOutBufferMarshal, lpOutBuffer, UInt32, nOutBufferSize, lpBytesReturnedMarshal, lpBytesReturned, OVERLAPPED.Ptr, lpOverlapped, BOOL)
        return result
    }

    /**
     * A LPFNEXTDEVIO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNEXTDEVIO {
        /**
         * Creates a LPFNEXTDEVIO pointer that invokes the given AHK function when called.
         * @param {Func(LPARAM, UInt32, UInt32, "ptr", UInt32, "ptr", UInt32, "uint*", OVERLAPPED) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [LPARAM, UInt32, UInt32, "ptr", UInt32, "ptr", UInt32, "uint*", OVERLAPPED.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
