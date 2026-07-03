#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\FILE_OBJECT.ahk" { FILE_OBJECT }
#Import "..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Win32\System\IO\IO_STATUS_BLOCK.ahk" { IO_STATUS_BLOCK }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct FAST_IO_UNLOCK_ALL_BY_KEY {
    value : IntPtr

    __value {
        set {
            if (value is FAST_IO_UNLOCK_ALL_BY_KEY) {
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
     * @param {Pointer<Void>} ProcessId 
     * @param {Integer} Key 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {BOOLEAN} 
     */
    Call(FileObject, ProcessId, Key, IoStatus, DeviceObject) {
        ProcessIdMarshal := ProcessId is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, FILE_OBJECT.Ptr, FileObject, ProcessIdMarshal, ProcessId, UInt32, Key, IO_STATUS_BLOCK.Ptr, IoStatus, DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN)
        return result
    }

    /**
     * A FAST_IO_UNLOCK_ALL_BY_KEY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FAST_IO_UNLOCK_ALL_BY_KEY {
        /**
         * Creates a FAST_IO_UNLOCK_ALL_BY_KEY pointer that invokes the given AHK function when called.
         * @param {Func(FILE_OBJECT, "ptr", UInt32, IO_STATUS_BLOCK, DEVICE_OBJECT) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FILE_OBJECT.Ptr, "ptr", UInt32, IO_STATUS_BLOCK.Ptr, DEVICE_OBJECT.Ptr, BOOLEAN])
        }

        __Delete() => CallbackFree(this.value)
    }
}
