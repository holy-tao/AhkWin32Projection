#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_DESCRIPTION.ahk" { DEVICE_DESCRIPTION }
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct GET_DMA_ADAPTER {
    value : IntPtr

    __value {
        set {
            if (value is GET_DMA_ADAPTER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} _Context 
     * @param {Pointer<DEVICE_DESCRIPTION>} DeviceDescriptor 
     * @param {Pointer<Integer>} NumberOfMapRegisters 
     * @returns {Pointer<DMA_ADAPTER>} 
     */
    Call(_Context, DeviceDescriptor, NumberOfMapRegisters) {
        _ContextMarshal := _Context is VarRef ? "ptr" : "ptr"
        NumberOfMapRegistersMarshal := NumberOfMapRegisters is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, _ContextMarshal, _Context, DEVICE_DESCRIPTION.Ptr, DeviceDescriptor, NumberOfMapRegistersMarshal, NumberOfMapRegisters, DMA_ADAPTER.Ptr)
        return result
    }

    /**
     * A GET_DMA_ADAPTER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends GET_DMA_ADAPTER {
        /**
         * Creates a GET_DMA_ADAPTER pointer that invokes the given AHK function when called.
         * @param {Func("ptr", DEVICE_DESCRIPTION, "uint*") => DMA_ADAPTER.Ptr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", DEVICE_DESCRIPTION.Ptr, "uint*", DMA_ADAPTER.Ptr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
