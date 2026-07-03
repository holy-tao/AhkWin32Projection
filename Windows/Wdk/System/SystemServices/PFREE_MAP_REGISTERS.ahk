#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PFREE_MAP_REGISTERS {
    value : IntPtr

    __value {
        set {
            if (value is PFREE_MAP_REGISTERS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DMA_ADAPTER>} DmaAdapter 
     * @param {Pointer<Void>} MapRegisterBase 
     * @param {Integer} NumberOfMapRegisters 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(DmaAdapter, MapRegisterBase, NumberOfMapRegisters) {
        MapRegisterBaseMarshal := MapRegisterBase is VarRef ? "ptr" : "ptr"

        DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, MapRegisterBaseMarshal, MapRegisterBase, UInt32, NumberOfMapRegisters)
    }

    /**
     * A PFREE_MAP_REGISTERS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFREE_MAP_REGISTERS {
        /**
         * Creates a PFREE_MAP_REGISTERS pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, "ptr", UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, "ptr", UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
