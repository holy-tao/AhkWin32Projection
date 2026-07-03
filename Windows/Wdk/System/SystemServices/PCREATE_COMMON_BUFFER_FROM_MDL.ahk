#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\MDL.ahk" { MDL }
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import ".\DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION.ahk" { DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PCREATE_COMMON_BUFFER_FROM_MDL {
    value : IntPtr

    __value {
        set {
            if (value is PCREATE_COMMON_BUFFER_FROM_MDL) {
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
     * @param {Pointer<DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION>} ExtendedConfigs 
     * @param {Integer} ExtendedConfigsCount 
     * @param {Pointer<Integer>} LogicalAddress 
     * @returns {NTSTATUS} 
     */
    Call(DmaAdapter, _Mdl, ExtendedConfigs, ExtendedConfigsCount, LogicalAddress) {
        LogicalAddressMarshal := LogicalAddress is VarRef ? "int64*" : "ptr"

        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, MDL.Ptr, _Mdl, DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION.Ptr, ExtendedConfigs, UInt32, ExtendedConfigsCount, LogicalAddressMarshal, LogicalAddress, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PCREATE_COMMON_BUFFER_FROM_MDL that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PCREATE_COMMON_BUFFER_FROM_MDL {
        /**
         * Creates a PCREATE_COMMON_BUFFER_FROM_MDL pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, MDL, DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION, UInt32, "int64*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, MDL.Ptr, DMA_COMMON_BUFFER_EXTENDED_CONFIGURATION.Ptr, UInt32, "int64*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
