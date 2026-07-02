#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\CDDDXGK_REDIRBITMAPPRESENTINFO.ahk" { CDDDXGK_REDIRBITMAPPRESENTINFO }
#Import ".\SURFOBJ.ahk" { SURFOBJ }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvAccumulateD3DDirtyRect {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvAccumulateD3DDirtyRect) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SURFOBJ>} param0 
     * @param {Pointer<CDDDXGK_REDIRBITMAPPRESENTINFO>} param1 
     * @returns {BOOL} 
     */
    Call(param0, param1) {
        result := DllCall(this.value, SURFOBJ.Ptr, param0, CDDDXGK_REDIRBITMAPPRESENTINFO.Ptr, param1, BOOL)
        return result
    }

    /**
     * A PFN_DrvAccumulateD3DDirtyRect that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvAccumulateD3DDirtyRect {
        /**
         * Creates a PFN_DrvAccumulateD3DDirtyRect pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, CDDDXGK_REDIRBITMAPPRESENTINFO) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, CDDDXGK_REDIRBITMAPPRESENTINFO.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
