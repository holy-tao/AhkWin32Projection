#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\DEVICE_OBJECT.ahk" { DEVICE_OBJECT }
#Import ".\POWER_STATE.ahk" { POWER_STATE }
#Import "..\..\..\Win32\System\IO\IO_STATUS_BLOCK.ahk" { IO_STATUS_BLOCK }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct REQUEST_POWER_COMPLETE {
    value : IntPtr

    __value {
        set {
            if (value is REQUEST_POWER_COMPLETE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DEVICE_OBJECT>} DeviceObject 
     * @param {Integer} MinorFunction 
     * @param {POWER_STATE} PowerState 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<IO_STATUS_BLOCK>} IoStatus 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(DeviceObject, MinorFunction, PowerState, _Context, IoStatus) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"

        DllCall(this.value, DEVICE_OBJECT.Ptr, DeviceObject, Int8, MinorFunction, POWER_STATE, PowerState, _ContextMarshal, _Context, IO_STATUS_BLOCK.Ptr, IoStatus)
    }

    /**
     * A REQUEST_POWER_COMPLETE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends REQUEST_POWER_COMPLETE {
        /**
         * Creates a REQUEST_POWER_COMPLETE pointer that invokes the given AHK function when called.
         * @param {Func(DEVICE_OBJECT, Int8, POWER_STATE, "ptr", IO_STATUS_BLOCK) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DEVICE_OBJECT.Ptr, Int8, POWER_STATE, "ptr", IO_STATUS_BLOCK.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
