#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RTL_AVL_TABLE.ahk" { RTL_AVL_TABLE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RTL_AVL_ALLOCATE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is RTL_AVL_ALLOCATE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<RTL_AVL_TABLE>} Table 
     * @param {Integer} ByteSize 
     * @returns {Pointer<Void>} 
     */
    Call(Table, ByteSize) {
        result := DllCall(this.value, RTL_AVL_TABLE.Ptr, Table, UInt32, ByteSize, IntPtr)
        return result
    }

    /**
     * A RTL_AVL_ALLOCATE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends RTL_AVL_ALLOCATE_ROUTINE {
        /**
         * Creates a RTL_AVL_ALLOCATE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(RTL_AVL_TABLE, UInt32) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [RTL_AVL_TABLE.Ptr, UInt32, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
