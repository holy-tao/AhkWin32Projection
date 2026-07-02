#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\IO_IRP_EXT_TRACK_OFFSET_HEADER.ahk" { IO_IRP_EXT_TRACK_OFFSET_HEADER }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct PIO_IRP_EXT_PROCESS_TRACKED_OFFSET_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PIO_IRP_EXT_PROCESS_TRACKED_OFFSET_CALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<IO_IRP_EXT_TRACK_OFFSET_HEADER>} SourceContext 
     * @param {Pointer<IO_IRP_EXT_TRACK_OFFSET_HEADER>} TargetContext 
     * @param {Integer} RelativeOffset 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(SourceContext, TargetContext, RelativeOffset) {
        DllCall(this.value, IO_IRP_EXT_TRACK_OFFSET_HEADER.Ptr, SourceContext, IO_IRP_EXT_TRACK_OFFSET_HEADER.Ptr, TargetContext, Int64, RelativeOffset)
    }

    /**
     * A PIO_IRP_EXT_PROCESS_TRACKED_OFFSET_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PIO_IRP_EXT_PROCESS_TRACKED_OFFSET_CALLBACK {
        /**
         * Creates a PIO_IRP_EXT_PROCESS_TRACKED_OFFSET_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(IO_IRP_EXT_TRACK_OFFSET_HEADER, IO_IRP_EXT_TRACK_OFFSET_HEADER, Int64) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IO_IRP_EXT_TRACK_OFFSET_HEADER.Ptr, IO_IRP_EXT_TRACK_OFFSET_HEADER.Ptr, Int64, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
