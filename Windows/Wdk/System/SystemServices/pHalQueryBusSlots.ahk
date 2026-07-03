#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PBUS_HANDLER.ahk" { PBUS_HANDLER }
#Import "..\..\..\Win32\Foundation\NTSTATUS.ahk" { NTSTATUS }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pHalQueryBusSlots {
    value : IntPtr

    __value {
        set {
            if (value is pHalQueryBusSlots) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PBUS_HANDLER} BusHandler 
     * @param {Integer} BufferSize 
     * @param {Pointer<Integer>} SlotNumbers 
     * @param {Pointer<Integer>} ReturnedLength 
     * @returns {NTSTATUS} 
     */
    Call(BusHandler, BufferSize, SlotNumbers, ReturnedLength) {
        SlotNumbersMarshal := SlotNumbers is VarRef ? "uint*" : "ptr"
        ReturnedLengthMarshal := ReturnedLength is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, PBUS_HANDLER, BusHandler, UInt32, BufferSize, SlotNumbersMarshal, SlotNumbers, ReturnedLengthMarshal, ReturnedLength, NTSTATUS)
        NTSTATUS.ThrowIfError(result)
        return result
    }

    /**
     * A pHalQueryBusSlots that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pHalQueryBusSlots {
        /**
         * Creates a pHalQueryBusSlots pointer that invokes the given AHK function when called.
         * @param {Func(PBUS_HANDLER, UInt32, "uint*", "uint*") => NTSTATUS} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PBUS_HANDLER, UInt32, "uint*", "uint*", NTSTATUS])
        }

        __Delete() => CallbackFree(this.value)
    }
}
