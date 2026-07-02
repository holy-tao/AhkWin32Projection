#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLIPOBJ.ahk" { CLIPOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import ".\BRUSHOBJ.ahk" { BRUSHOBJ }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvPaint {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvPaint) {
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
     * @param {Pointer<CLIPOBJ>} param1 
     * @param {Pointer<BRUSHOBJ>} param2 
     * @param {Pointer<POINTL>} param3 
     * @param {Integer} param4 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4) {
        result := DllCall(this.value, SURFOBJ.Ptr, param0, CLIPOBJ.Ptr, param1, BRUSHOBJ.Ptr, param2, POINTL.Ptr, param3, UInt32, param4, BOOL)
        return result
    }

    /**
     * A PFN_DrvPaint that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvPaint {
        /**
         * Creates a PFN_DrvPaint pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, CLIPOBJ, BRUSHOBJ, POINTL, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, CLIPOBJ.Ptr, BRUSHOBJ.Ptr, POINTL.Ptr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
