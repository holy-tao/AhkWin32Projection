#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\FILE_OBJECT.ahk" { FILE_OBJECT }
#Import ".\PEPROCESS.ahk" { PEPROCESS }
#Import "..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Win32\System\IO\IO_STATUS_BLOCK.ahk" { IO_STATUS_BLOCK }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct FAST_IO_LOCK {
    value : IntPtr

    __value {
        set {
            if (value is FAST_IO_LOCK) {
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
     * @param {Pointer<Integer>} FileOffset 
     * @param {Pointer<Integer>} Length 
     * @param {PEPROCESS} ProcessId 
     * @param {Integer} Key 
     * @param {BOOLEAN} FailImmediately 
     * @param {BOOLEAN} ExclusiveLock 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {BOOLEAN} 
     */
    Call(FileObject, FileOffset, Length, ProcessId, Key, FailImmediately, ExclusiveLock, IoStatus, DeviceObject) {
        FileOffsetMarshal := FileOffset is VarRef ? "int64*" : "ptr"
        LengthMarshal := Length is VarRef ? "int64*" : "ptr"

        result := DllCall(this.value, FILE_OBJECT.Ptr, FileObject, FileOffsetMarshal, FileOffset, LengthMarshal, Length, PEPROCESS, ProcessId, UInt32, Key, BOOLEAN, FailImmediately, BOOLEAN, ExclusiveLock, IO_STATUS_BLOCK.Ptr, IoStatus, DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN)
        return result
    }

    /**
     * A FAST_IO_LOCK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FAST_IO_LOCK {
        /**
         * Creates a FAST_IO_LOCK pointer that invokes the given AHK function when called.
         * @param {Func(FILE_OBJECT, "int64*", "int64*", PEPROCESS, UInt32, BOOLEAN, BOOLEAN, IO_STATUS_BLOCK, DEVICE_OBJECT) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FILE_OBJECT.Ptr, "int64*", "int64*", PEPROCESS, UInt32, BOOLEAN, BOOLEAN, IO_STATUS_BLOCK.Ptr, DEVICE_OBJECT.Ptr, BOOLEAN])
        }

        __Delete() => CallbackFree(this.value)
    }
}
