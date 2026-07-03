#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DEBUG_DRIVER_OBJECT_INFO.ahk" { DEBUG_DRIVER_OBJECT_INFO }
#Import ".\IDebugClient.ahk" { IDebugClient }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PGET_DRIVER_OBJECT_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PGET_DRIVER_OBJECT_INFO) {
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
     * @param {Integer} DriverObject 
     * @param {Pointer<DEBUG_DRIVER_OBJECT_INFO>} pDrvObjInfo 
     * @returns {HRESULT} 
     */
    Call(Client, DriverObject, pDrvObjInfo) {
        result := DllCall(this.value, "ptr", Client, Int64, DriverObject, DEBUG_DRIVER_OBJECT_INFO.Ptr, pDrvObjInfo, "HRESULT")
        return result
    }

    /**
     * A PGET_DRIVER_OBJECT_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_DRIVER_OBJECT_INFO {
        /**
         * Creates a PGET_DRIVER_OBJECT_INFO pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int64, DEBUG_DRIVER_OBJECT_INFO) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int64, DEBUG_DRIVER_OBJECT_INFO.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
