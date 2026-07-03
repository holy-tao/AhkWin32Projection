#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\FILE_OBJECT.ahk" { FILE_OBJECT }
#Import ".\PEPROCESS.ahk" { PEPROCESS }
#Import "..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Win32\System\IO\IO_STATUS_BLOCK.ahk" { IO_STATUS_BLOCK }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct FAST_IO_UNLOCK_ALL {
    value : IntPtr

    __value {
        set {
            if (value is FAST_IO_UNLOCK_ALL) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FILE_OBJECT>} FileObject 
     * @param {PEPROCESS} ProcessId 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {BOOLEAN} 
     */
    Call(FileObject, ProcessId, IoStatus, DeviceObject) {
        result := DllCall(this.value, FILE_OBJECT.Ptr, FileObject, PEPROCESS, ProcessId, IO_STATUS_BLOCK.Ptr, IoStatus, DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN)
        return result
    }

    /**
     * A FAST_IO_UNLOCK_ALL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FAST_IO_UNLOCK_ALL {
        /**
         * Creates a FAST_IO_UNLOCK_ALL pointer that invokes the given AHK function when called.
         * @param {Func(FILE_OBJECT, PEPROCESS, IO_STATUS_BLOCK, DEVICE_OBJECT) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FILE_OBJECT.Ptr, PEPROCESS, IO_STATUS_BLOCK.Ptr, DEVICE_OBJECT.Ptr, BOOLEAN])
        }

        __Delete() => CallbackFree(this.value)
    }
}
