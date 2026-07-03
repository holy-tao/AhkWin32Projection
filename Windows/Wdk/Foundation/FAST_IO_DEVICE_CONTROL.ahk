#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\FILE_OBJECT.ahk" { FILE_OBJECT }
#Import "..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Win32\System\IO\IO_STATUS_BLOCK.ahk" { IO_STATUS_BLOCK }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct FAST_IO_DEVICE_CONTROL {
    value : IntPtr

    __value {
        set {
            if (value is FAST_IO_DEVICE_CONTROL) {
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
     * @param {BOOLEAN} Wait 
     * @param {Pointer<Void>} InputBuffer 
     * @param {Integer} InputBufferLength 
     * @param {Pointer<Void>} OutputBuffer 
     * @param {Integer} OutputBufferLength 
     * @param {Integer} IoControlCode 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {BOOLEAN} 
     */
    Call(FileObject, Wait, InputBuffer, InputBufferLength, OutputBuffer, OutputBufferLength, IoControlCode, IoStatus, DeviceObject) {
        InputBufferMarshal := InputBuffer is VarRef ? "ptr" : "ptr"
        OutputBufferMarshal := OutputBuffer is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, FILE_OBJECT.Ptr, FileObject, BOOLEAN, Wait, InputBufferMarshal, InputBuffer, UInt32, InputBufferLength, OutputBufferMarshal, OutputBuffer, UInt32, OutputBufferLength, UInt32, IoControlCode, IO_STATUS_BLOCK.Ptr, IoStatus, DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN)
        return result
    }

    /**
     * A FAST_IO_DEVICE_CONTROL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FAST_IO_DEVICE_CONTROL {
        /**
         * Creates a FAST_IO_DEVICE_CONTROL pointer that invokes the given AHK function when called.
         * @param {Func(FILE_OBJECT, BOOLEAN, "ptr", UInt32, "ptr", UInt32, UInt32, IO_STATUS_BLOCK, DEVICE_OBJECT) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FILE_OBJECT.Ptr, BOOLEAN, "ptr", UInt32, "ptr", UInt32, UInt32, IO_STATUS_BLOCK.Ptr, DEVICE_OBJECT.Ptr, BOOLEAN])
        }

        __Delete() => CallbackFree(this.value)
    }
}
