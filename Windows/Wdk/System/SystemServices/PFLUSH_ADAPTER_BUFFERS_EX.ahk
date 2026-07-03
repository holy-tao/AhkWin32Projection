#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\MDL.ahk" { MDL }
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PFLUSH_ADAPTER_BUFFERS_EX {
    value : IntPtr

    __value {
        set {
            if (value is PFLUSH_ADAPTER_BUFFERS_EX) {
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
     * @param {Pointer<Void>} MapRegisterBase 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @param {BOOLEAN} WriteToDevice 
     * @returns {NTSTATUS} 
     */
    Call(DmaAdapter, _Mdl, MapRegisterBase, Offset, Length, WriteToDevice) {
        MapRegisterBaseMarshal := MapRegisterBase is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, MDL.Ptr, _Mdl, MapRegisterBaseMarshal, MapRegisterBase, Int64, Offset, UInt32, Length, BOOLEAN, WriteToDevice, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A PFLUSH_ADAPTER_BUFFERS_EX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLUSH_ADAPTER_BUFFERS_EX {
        /**
         * Creates a PFLUSH_ADAPTER_BUFFERS_EX pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, MDL, "ptr", Int64, UInt32, BOOLEAN) => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, MDL.Ptr, "ptr", Int64, UInt32, BOOLEAN, NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
