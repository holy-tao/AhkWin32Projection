#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DEBUG_IRP_INFO.ahk" { DEBUG_IRP_INFO }
#Import ".\IDebugClient.ahk" { IDebugClient }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PGET_IRP_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PGET_IRP_INFO) {
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
     * @param {Integer} _Irp 
     * @param {Pointer<DEBUG_IRP_INFO>} IrpInfo 
     * @returns {HRESULT} 
     */
    Call(Client, _Irp, IrpInfo) {
        result := DllCall(this.value, "ptr", Client, Int64, _Irp, DEBUG_IRP_INFO.Ptr, IrpInfo, "HRESULT")
        return result
    }

    /**
     * A PGET_IRP_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_IRP_INFO {
        /**
         * Creates a PGET_IRP_INFO pointer that invokes the given AHK function when called.
         * @param {Func("ptr", Int64, DEBUG_IRP_INFO) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", Int64, DEBUG_IRP_INFO.Ptr, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
