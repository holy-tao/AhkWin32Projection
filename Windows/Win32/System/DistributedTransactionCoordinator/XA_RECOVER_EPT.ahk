#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\XID.ahk" { XID }

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 */
export default struct XA_RECOVER_EPT {
    value : IntPtr

    __value {
        set {
            if (value is XA_RECOVER_EPT) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<XID>} param0 
     * @param {Integer} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3) {
        result := DllCall(this.value, XID.Ptr, param0, Int32, param1, Int32, param2, Int32, param3, Int32)
        return result
    }

    /**
     * A XA_RECOVER_EPT that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends XA_RECOVER_EPT {
        /**
         * Creates a XA_RECOVER_EPT pointer that invokes the given AHK function when called.
         * @param {Func(XID, Int32, Int32, Int32) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [XID.Ptr, Int32, Int32, Int32, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
