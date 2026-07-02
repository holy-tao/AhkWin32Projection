#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IO_STATUS_BLOCK.ahk" { IO_STATUS_BLOCK }

/**
 * @namespace Windows.Win32.System.IO
 */
export default struct PIO_APC_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PIO_APC_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} ApcContext 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatusBlock 
     * @param {Integer} Reserved 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(ApcContext, IoStatusBlock, Reserved) {
        ApcContextMarshal := ApcContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, ApcContextMarshal, ApcContext, IO_STATUS_BLOCK.Ptr, IoStatusBlock, UInt32, Reserved)
    }

    /**
     * A PIO_APC_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIO_APC_ROUTINE {
        /**
         * Creates a PIO_APC_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", IO_STATUS_BLOCK, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", IO_STATUS_BLOCK.Ptr, UInt32, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
