#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pKdSetPciDataByOffset {
    value : IntPtr

    __value {
        set {
            if (value is pKdSetPciDataByOffset) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} BusNumber 
     * @param {Integer} SlotNumber 
     * @param {Integer} _Buffer 
     * @param {Integer} Offset 
     * @param {Integer} Length 
     * @returns {Integer} 
     */
    Call(BusNumber, SlotNumber, _Buffer, Offset, Length) {
        result := DllCall(this.value, UInt32, BusNumber, UInt32, SlotNumber, IntPtr, _Buffer, UInt32, Offset, UInt32, Length, UInt32)
        return result
    }

    /**
     * A pKdSetPciDataByOffset that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pKdSetPciDataByOffset {
        /**
         * Creates a pKdSetPciDataByOffset pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, IntPtr, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, IntPtr, UInt32, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
