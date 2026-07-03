#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DEBUG_DEVICE_OBJECT_INFO.ahk" { DEBUG_DEVICE_OBJECT_INFO }
#Import ".\IDebugClient.ahk" { IDebugClient }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PGET_DEVICE_OBJECT_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PGET_DEVICE_OBJECT_INFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IDebugClient} Client 
     * @param {Integer} DeviceObject 
     * @param {Pointer<DEBUG_DEVICE_OBJECT_INFO>} pDevObjInfo 
     * @returns {HRESULT} 
     */
    Call(Client, DeviceObject, pDevObjInfo) {
        result := DllCall(this.value, "ptr", Client, Int64, DeviceObject, DEBUG_DEVICE_OBJECT_INFO.Ptr, pDevObjInfo, "HRESULT")
        return result
    }

    /**
     * A PGET_DEVICE_OBJECT_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_DEVICE_OBJECT_INFO {
        /**
         * Creates a PGET_DEVICE_OBJECT_INFO pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int64, DEBUG_DEVICE_OBJECT_INFO) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int64, DEBUG_DEVICE_OBJECT_INFO.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
