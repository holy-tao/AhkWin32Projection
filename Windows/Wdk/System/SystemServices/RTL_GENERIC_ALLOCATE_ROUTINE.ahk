#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RTL_GENERIC_TABLE.ahk" { RTL_GENERIC_TABLE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RTL_GENERIC_ALLOCATE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is RTL_GENERIC_ALLOCATE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<RTL_GENERIC_TABLE>} Table 
     * @param {Integer} ByteSize 
     * @returns {Pointer<Void>} 
     */
    Call(Table, ByteSize) {
        result := DllCall(this.value, RTL_GENERIC_TABLE.Ptr, Table, UInt32, ByteSize, IntPtr)
        return result
    }

    /**
     * A RTL_GENERIC_ALLOCATE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RTL_GENERIC_ALLOCATE_ROUTINE {
        /**
         * Creates a RTL_GENERIC_ALLOCATE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(RTL_GENERIC_TABLE, UInt32) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RTL_GENERIC_TABLE.Ptr, UInt32, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
