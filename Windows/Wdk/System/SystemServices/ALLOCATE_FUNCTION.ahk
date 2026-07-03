#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\POOL_TYPE.ahk" { POOL_TYPE }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct ALLOCATE_FUNCTION {
    value : IntPtr

    __value {
        set {
            if (value is ALLOCATE_FUNCTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {POOL_TYPE} PoolType 
     * @param {Pointer} NumberOfBytes 
     * @param {Integer} Tag 
     * @returns {Pointer<Void>} 
     */
    Call(PoolType, NumberOfBytes, Tag) {
        result := DllCall(this.value, POOL_TYPE, PoolType, IntPtr, NumberOfBytes, UInt32, Tag, IntPtr)
        return result
    }

    /**
     * A ALLOCATE_FUNCTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ALLOCATE_FUNCTION {
        /**
         * Creates a ALLOCATE_FUNCTION pointer that invokes the given AHK function when called.
         * @param {Func(POOL_TYPE, IntPtr, UInt32) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [POOL_TYPE, IntPtr, UInt32, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
