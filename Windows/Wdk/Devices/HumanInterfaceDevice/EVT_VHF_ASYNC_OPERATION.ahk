#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HID_XFER_PACKET.ahk" { HID_XFER_PACKET }

/**
 * @namespace Windows.Wdk.Devices.HumanInterfaceDevice
 */
export default struct EVT_VHF_ASYNC_OPERATION {
    value : IntPtr

    __value {
        set {
            if (value is EVT_VHF_ASYNC_OPERATION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} VhfClientContext 
     * @param {Pointer<Void>} VhfOperationHandle 
     * @param {Pointer<Void>} VhfOperationContext 
     * @param {Pointer<HID_XFER_PACKET>} HidTransferPacket 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(VhfClientContext, VhfOperationHandle, VhfOperationContext, HidTransferPacket) {
        VhfClientContextMarshal := VhfClientContext is VarRef ? "ptr" : "ptr"
        VhfOperationHandleMarshal := VhfOperationHandle is VarRef ? "ptr" : "ptr"
        VhfOperationContextMarshal := VhfOperationContext is VarRef ? "ptr" : "ptr"

        DllCall(this.value, VhfClientContextMarshal, VhfClientContext, VhfOperationHandleMarshal, VhfOperationHandle, VhfOperationContextMarshal, VhfOperationContext, HID_XFER_PACKET.Ptr, HidTransferPacket)
    }

    /**
     * A EVT_VHF_ASYNC_OPERATION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends EVT_VHF_ASYNC_OPERATION {
        /**
         * Creates a EVT_VHF_ASYNC_OPERATION pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", "ptr", HID_XFER_PACKET) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", "ptr", HID_XFER_PACKET.Ptr, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
