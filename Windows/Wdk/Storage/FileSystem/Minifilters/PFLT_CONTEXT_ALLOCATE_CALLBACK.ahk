#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\POOL_TYPE.ahk" { POOL_TYPE }

/**
 * @namespace Windows.Wdk.Storage.FileSystem.Minifilters
 */
export default struct PFLT_CONTEXT_ALLOCATE_CALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is PFLT_CONTEXT_ALLOCATE_CALLBACK) {
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
     * @param {Pointer} _Size 
     * @param {Integer} ContextType 
     * @returns {Pointer<Void>} 
     */
    Call(PoolType, _Size, ContextType) {
        result := DllCall(this.value, POOL_TYPE, PoolType, IntPtr, _Size, UInt16, ContextType, IntPtr)
        return result
    }

    /**
     * A PFLT_CONTEXT_ALLOCATE_CALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFLT_CONTEXT_ALLOCATE_CALLBACK {
        /**
         * Creates a PFLT_CONTEXT_ALLOCATE_CALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(POOL_TYPE, IntPtr, UInt16) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [POOL_TYPE, IntPtr, UInt16, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
