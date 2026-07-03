#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\MDL.ahk" { MDL }
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCALCULATE_SCATTER_GATHER_LIST_SIZE {
    value : IntPtr

    __value {
        set {
            if (value is PCALCULATE_SCATTER_GATHER_LIST_SIZE) {
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
     * @param {Pointer<MDL>} _Mdl 
     * @param {Pointer<Void>} CurrentVa 
     * @param {Integer} Length 
     * @param {Pointer<Integer>} ScatterGatherListSize 
     * @param {Pointer<Integer>} pNumberOfMapRegisters 
     * @returns {NTSTATUS} 
     */
    Call(DmaAdapter, _Mdl, CurrentVa, Length, ScatterGatherListSize, pNumberOfMapRegisters) {
        CurrentVaMarshal := CurrentVa is VarRef ? "ptr" : "ptr"
        ScatterGatherListSizeMarshal := ScatterGatherListSize is VarRef ? "uint*" : "ptr"
        pNumberOfMapRegistersMarshal := pNumberOfMapRegisters is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, MDL.Ptr, _Mdl, CurrentVaMarshal, CurrentVa, UInt32, Length, ScatterGatherListSizeMarshal, ScatterGatherListSize, pNumberOfMapRegistersMarshal, pNumberOfMapRegisters, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PCALCULATE_SCATTER_GATHER_LIST_SIZE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCALCULATE_SCATTER_GATHER_LIST_SIZE {
        /**
         * Creates a PCALCULATE_SCATTER_GATHER_LIST_SIZE pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, MDL, "ptr", UInt32, "uint*", "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, MDL.Ptr, "ptr", UInt32, "uint*", "uint*", NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
