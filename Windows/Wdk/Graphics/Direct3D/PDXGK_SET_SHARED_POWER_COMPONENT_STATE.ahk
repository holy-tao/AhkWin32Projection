#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct PDXGK_SET_SHARED_POWER_COMPONENT_STATE {
    value : IntPtr

    __value {
        set {
            if (value is PDXGK_SET_SHARED_POWER_COMPONENT_STATE) {
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
     * @param {Integer} ComponentIndex 
     * @param {BOOLEAN} Active 
     * @returns {NTSTATUS} 
     */
    Call(DeviceHandle, PrivateHandle, ComponentIndex, Active) {
        DeviceHandleMarshal := DeviceHandle is VarRef ? "ptr" : "ptr"
        PrivateHandleMarshal := PrivateHandle is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DeviceHandleMarshal, DeviceHandle, PrivateHandleMarshal, PrivateHandle, UInt32, ComponentIndex, BOOLEAN, Active, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PDXGK_SET_SHARED_POWER_COMPONENT_STATE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PDXGK_SET_SHARED_POWER_COMPONENT_STATE {
        /**
         * Creates a PDXGK_SET_SHARED_POWER_COMPONENT_STATE pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", UInt32, BOOLEAN) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", UInt32, BOOLEAN, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
