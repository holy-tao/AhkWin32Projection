#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct PDXGK_GRAPHICSPOWER_UNREGISTER {
    value : IntPtr

    __value {
        set {
            if (value is PDXGK_GRAPHICSPOWER_UNREGISTER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} DeviceHandle 
     * @param {Pointer<Void>} PrivateHandle 
     * @returns {NTSTATUS} 
     */
    Call(DeviceHandle, PrivateHandle) {
        DeviceHandleMarshal := DeviceHandle is VarRef ? "ptr" : "ptr"
        PrivateHandleMarshal := PrivateHandle is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DeviceHandleMarshal, DeviceHandle, PrivateHandleMarshal, PrivateHandle, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PDXGK_GRAPHICSPOWER_UNREGISTER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXGK_GRAPHICSPOWER_UNREGISTER {
        /**
         * Creates a PDXGK_GRAPHICSPOWER_UNREGISTER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
