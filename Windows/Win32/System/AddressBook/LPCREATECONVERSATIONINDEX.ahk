#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct LPCREATECONVERSATIONINDEX {
    value : IntPtr

    __value {
        set {
            if (value is LPCREATECONVERSATIONINDEX) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} cbParent 
     * @param {Pointer<Integer>} lpbParent 
     * @param {Pointer<Integer>} lpcbConvIndex 
     * @param {Pointer<Pointer<Integer>>} lppbConvIndex 
     * @returns {Integer} 
     */
    Call(cbParent, lpbParent, lpcbConvIndex, lppbConvIndex) {
        lpbParentMarshal := lpbParent is VarRef ? "char*" : "ptr"
        lpcbConvIndexMarshal := lpcbConvIndex is VarRef ? "uint*" : "ptr"
        lppbConvIndexMarshal := lppbConvIndex is VarRef ? "ptr*" : "ptr"

        result := DllCall(this.value, UInt32, cbParent, lpbParentMarshal, lpbParent, lpcbConvIndexMarshal, lpcbConvIndex, lppbConvIndexMarshal, lppbConvIndex, Int32)
        return result
    }

    /**
     * A LPCREATECONVERSATIONINDEX that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPCREATECONVERSATIONINDEX {
        /**
         * Creates a LPCREATECONVERSATIONINDEX pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "char*", "uint*", "ptr*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "char*", "uint*", "ptr*", Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
