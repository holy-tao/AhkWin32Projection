#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\MDL.ahk" { MDL }
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import ".\DMA_TRANSFER_INFO.ahk" { DMA_TRANSFER_INFO }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PGET_DMA_TRANSFER_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PGET_DMA_TRANSFER_INFO) {
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
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @param {BOOLEAN} WriteOnly 
     * @param {Pointer<DMA_TRANSFER_INFO>} TransferInfo 
     * @returns {NTSTATUS} 
     */
    Call(DmaAdapter, _Mdl, Offset, Length, WriteOnly, TransferInfo) {
        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, MDL.Ptr, _Mdl, Int64, Offset, UInt32, Length, BOOLEAN, WriteOnly, DMA_TRANSFER_INFO.Ptr, TransferInfo, NTSTATUS)
        NTSTATUS.ThrowIfError(result.value)
        return result
    }

    /**
     * A PGET_DMA_TRANSFER_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_DMA_TRANSFER_INFO {
        /**
         * Creates a PGET_DMA_TRANSFER_INFO pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, MDL, Int64, UInt32, BOOLEAN, DMA_TRANSFER_INFO) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, MDL.Ptr, Int64, UInt32, BOOLEAN, DMA_TRANSFER_INFO.Ptr, NTSTATUS])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
