#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\FILE_OBJECT.ahk" { FILE_OBJECT }
#Import "..\Storage\FileSystem\FILE_BASIC_INFORMATION.ahk" { FILE_BASIC_INFORMATION }
#Import "..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Win32\System\IO\IO_STATUS_BLOCK.ahk" { IO_STATUS_BLOCK }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct FAST_IO_QUERY_BASIC_INFO {
    value : IntPtr

    __value {
        set {
            if (value is FAST_IO_QUERY_BASIC_INFO) {
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
     * @param {Pointer<FILE_BASIC_INFORMATION>} _Buffer 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {BOOLEAN} 
     */
    Call(FileObject, Wait, _Buffer, IoStatus, DeviceObject) {
        result := DllCall(this.value, FILE_OBJECT.Ptr, FileObject, BOOLEAN, Wait, FILE_BASIC_INFORMATION.Ptr, _Buffer, IO_STATUS_BLOCK.Ptr, IoStatus, DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN)
        return result
    }

    /**
     * A FAST_IO_QUERY_BASIC_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FAST_IO_QUERY_BASIC_INFO {
        /**
         * Creates a FAST_IO_QUERY_BASIC_INFO pointer that invokes the given AHK function when called.
         * @param {Func(FILE_OBJECT, BOOLEAN, FILE_BASIC_INFORMATION, IO_STATUS_BLOCK, DEVICE_OBJECT) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FILE_OBJECT.Ptr, BOOLEAN, FILE_BASIC_INFORMATION.Ptr, IO_STATUS_BLOCK.Ptr, DEVICE_OBJECT.Ptr, BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
