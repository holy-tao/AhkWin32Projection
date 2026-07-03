#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PTP_CALLBACK_INSTANCE.ahk" { PTP_CALLBACK_INSTANCE }
#Import ".\PTP_IO.ahk" { PTP_IO }

/**
 * @namespace Windows.Win32.System.Threading
 */
export default struct PTP_WIN32_IO_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PTP_WIN32_IO_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PTP_CALLBACK_INSTANCE} Instance 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<Void>} _Overlapped 
     * @param {Integer} IoResult 
     * @param {Pointer} NumberOfBytesTransferred 
     * @param {PTP_IO} Io 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(Instance, _Context, _Overlapped, IoResult, NumberOfBytesTransferred, Io) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        _OverlappedMarshal := _Overlapped is VarRef ? "ptr" : "ptr"

        DllCall(this.value, PTP_CALLBACK_INSTANCE, Instance, _ContextMarshal, _Context, _OverlappedMarshal, _Overlapped, UInt32, IoResult, IntPtr, NumberOfBytesTransferred, PTP_IO, Io)
    }

    /**
     * A PTP_WIN32_IO_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PTP_WIN32_IO_CALLBACK {
        /**
         * Creates a PTP_WIN32_IO_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(PTP_CALLBACK_INSTANCE, "ptr", "ptr", UInt32, IntPtr, PTP_IO) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PTP_CALLBACK_INSTANCE, "ptr", "ptr", UInt32, IntPtr, PTP_IO, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
