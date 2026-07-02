#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import "..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\Storage\FileSystem\FILE_NETWORK_OPEN_INFORMATION.ahk" { FILE_NETWORK_OPEN_INFORMATION }
#Import ".\IRP.ahk" { IRP }

/**
 * @namespace Windows.Wdk.Foundation
 */
export default struct FAST_IO_QUERY_OPEN {
    value : IntPtr

    __value {
        set {
            if (value is FAST_IO_QUERY_OPEN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<IRP>} _Irp 
     * @param {Pointer<FILE_NETWORK_OPEN_INFORMATION>} NetworkInformation 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @returns {BOOLEAN} 
     */
    Call(_Irp, NetworkInformation, DeviceObject) {
        result := DllCall(this.value, IRP.Ptr, _Irp, FILE_NETWORK_OPEN_INFORMATION.Ptr, NetworkInformation, DEVICE_OBJECT.Ptr, DeviceObject, BOOLEAN)
        return result
    }

    /**
     * A FAST_IO_QUERY_OPEN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FAST_IO_QUERY_OPEN {
        /**
         * Creates a FAST_IO_QUERY_OPEN pointer that invokes the given AHK function when called.
         * @param {Func(IRP, FILE_NETWORK_OPEN_INFORMATION, DEVICE_OBJECT) => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IRP.Ptr, FILE_NETWORK_OPEN_INFORMATION.Ptr, DEVICE_OBJECT.Ptr, BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
