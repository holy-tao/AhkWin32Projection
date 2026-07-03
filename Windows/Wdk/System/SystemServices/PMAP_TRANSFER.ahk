#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\MDL.ahk" { MDL }
#Import ".\DMA_ADAPTER.ahk" { DMA_ADAPTER }
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct PMAP_TRANSFER {
    value : IntPtr

    __value {
        set {
            if (value is PMAP_TRANSFER) {
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
     * @param {Pointer<Void>} CurrentVa 
     * @param {Pointer<Integer>} Length 
     * @param {BOOLEAN} WriteToDevice 
     * @returns {Integer} 
     */
    Call(DmaAdapter, _Mdl, MapRegisterBase, CurrentVa, Length, WriteToDevice) {
        MapRegisterBaseMarshal := MapRegisterBase is VarRef ? "ptr" : "ptr"
        CurrentVaMarshal := CurrentVa is VarRef ? "ptr" : "ptr"
        LengthMarshal := Length is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, DMA_ADAPTER.Ptr, DmaAdapter, MDL.Ptr, _Mdl, MapRegisterBaseMarshal, MapRegisterBase, CurrentVaMarshal, CurrentVa, LengthMarshal, Length, BOOLEAN, WriteToDevice, Int64)
        return result
    }

    /**
     * A PMAP_TRANSFER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PMAP_TRANSFER {
        /**
         * Creates a PMAP_TRANSFER pointer that invokes the given AHK function when called.
         * @param {Func(DMA_ADAPTER, MDL, "ptr", "ptr", "uint*", BOOLEAN) => Int64} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DMA_ADAPTER.Ptr, MDL.Ptr, "ptr", "ptr", "uint*", BOOLEAN, Int64])
        }

        __Delete() => CallbackFree(this.value)
    }
}
