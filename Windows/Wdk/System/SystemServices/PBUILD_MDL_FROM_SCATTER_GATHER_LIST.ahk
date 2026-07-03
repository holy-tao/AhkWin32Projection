#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\MDL.ahk" { MDL }
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import ".\SCATTER_GATHER_LIST.ahk" { SCATTER_GATHER_LIST }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PBUILD_MDL_FROM_SCATTER_GATHER_LIST {
    value : IntPtr

    __value {
        set {
            if (value is PBUILD_MDL_FROM_SCATTER_GATHER_LIST) {
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
     * @param {Pointer<SCATTER_GATHER_LIST>} ScatterGather 
     * @param {Pointer<MDL>} OriginalMdl 
     * @param {Pointer<Pointer<MDL>>} TargetMdl 
     * @returns {NTSTATUS} 
     */
    Call(DmaAdapter, ScatterGather, OriginalMdl, TargetMdl) {
        TargetMdlMarshal := TargetMdl is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, SCATTER_GATHER_LIST.Ptr, ScatterGather, MDL.Ptr, OriginalMdl, TargetMdlMarshal, TargetMdl, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PBUILD_MDL_FROM_SCATTER_GATHER_LIST that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PBUILD_MDL_FROM_SCATTER_GATHER_LIST {
        /**
         * Creates a PBUILD_MDL_FROM_SCATTER_GATHER_LIST pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, SCATTER_GATHER_LIST, MDL, "ptr*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, SCATTER_GATHER_LIST.Ptr, MDL.Ptr, "ptr*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
