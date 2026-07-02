#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PWINDBG_OLDKD_READ_PHYSICAL_MEMORY {
    value : IntPtr

    __value {
        set {
            if (value is PWINDBG_OLDKD_READ_PHYSICAL_MEMORY) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} _address 
     * @param {Pointer<Void>} _buffer 
     * @param {Integer} count 
     * @param {Pointer<Integer>} bytesread 
     * @returns {Integer} 
     */
    Call(_address, _buffer, count, bytesread) {
        _bufferMarshal := _buffer is VarRef ? "ptr" : "ptr"
        bytesreadMarshal := bytesread is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, Int64, _address, _bufferMarshal, _buffer, UInt32, count, bytesreadMarshal, bytesread, UInt32)
        return result
    }

    /**
     * A PWINDBG_OLDKD_READ_PHYSICAL_MEMORY that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PWINDBG_OLDKD_READ_PHYSICAL_MEMORY {
        /**
         * Creates a PWINDBG_OLDKD_READ_PHYSICAL_MEMORY pointer that invokes the given AHK function when called.
         * @param {Func(Int64, "ptr", UInt32, "uint*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Int64, "ptr", UInt32, "uint*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
