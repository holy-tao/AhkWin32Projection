#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDHAL_UPDATENONLOCALHEAPDATA.ahk" { DDHAL_UPDATENONLOCALHEAPDATA }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct LPDDHAL_UPDATENONLOCALHEAP {
    value : IntPtr

    __value {
        set {
            if (value is LPDDHAL_UPDATENONLOCALHEAP) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DDHAL_UPDATENONLOCALHEAPDATA>} param0 
     * @returns {Integer} 
     */
    Call(param0) {
        result := DllCall(this.value, DDHAL_UPDATENONLOCALHEAPDATA.Ptr, param0, UInt32)
        return result
    }

    /**
     * A LPDDHAL_UPDATENONLOCALHEAP that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDDHAL_UPDATENONLOCALHEAP {
        /**
         * Creates a LPDDHAL_UPDATENONLOCALHEAP pointer that invokes the given AHK function when called.
         * @param {Func(DDHAL_UPDATENONLOCALHEAPDATA) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DDHAL_UPDATENONLOCALHEAPDATA.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
