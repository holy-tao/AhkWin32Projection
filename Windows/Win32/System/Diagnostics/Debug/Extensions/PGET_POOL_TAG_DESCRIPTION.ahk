#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DEBUG_POOLTAG_DESCRIPTION.ahk" { DEBUG_POOLTAG_DESCRIPTION }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct PGET_POOL_TAG_DESCRIPTION {
    value : IntPtr

    __value {
        set {
            if (value is PGET_POOL_TAG_DESCRIPTION) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} PoolTag 
     * @param {Pointer<DEBUG_POOLTAG_DESCRIPTION>} pDescription 
     * @returns {HRESULT} 
     */
    Call(PoolTag, pDescription) {
        result := DllCall(this.value, UInt32, PoolTag, DEBUG_POOLTAG_DESCRIPTION.Ptr, pDescription, "HRESULT")
        return result
    }

    /**
     * A PGET_POOL_TAG_DESCRIPTION that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PGET_POOL_TAG_DESCRIPTION {
        /**
         * Creates a PGET_POOL_TAG_DESCRIPTION pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, DEBUG_POOLTAG_DESCRIPTION) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, DEBUG_POOLTAG_DESCRIPTION.Ptr, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
