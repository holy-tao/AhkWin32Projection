#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BRUSHOBJ.ahk" { BRUSHOBJ }
#Import ".\CLIPOBJ.ahk" { CLIPOBJ }
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import ".\XLATEOBJ.ahk" { XLATEOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvBitBlt {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvBitBlt) {
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
     * @param {Pointer<SURFOBJ>} param1 
     * @param {Pointer<SURFOBJ>} param2 
     * @param {Pointer<CLIPOBJ>} param3 
     * @param {Pointer<XLATEOBJ>} param4 
     * @param {Pointer<RECTL>} param5 
     * @param {Pointer<POINTL>} param6 
     * @param {Pointer<POINTL>} param7 
     * @param {Pointer<BRUSHOBJ>} param8 
     * @param {Pointer<POINTL>} param9 
     * @param {Integer} param10 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10) {
        result := DllCall(this.value, SURFOBJ.Ptr, param0, SURFOBJ.Ptr, param1, SURFOBJ.Ptr, param2, CLIPOBJ.Ptr, param3, XLATEOBJ.Ptr, param4, RECTL.Ptr, param5, POINTL.Ptr, param6, POINTL.Ptr, param7, BRUSHOBJ.Ptr, param8, POINTL.Ptr, param9, UInt32, param10, BOOL)
        return result
    }

    /**
     * A PFN_DrvBitBlt that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvBitBlt {
        /**
         * Creates a PFN_DrvBitBlt pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, SURFOBJ, SURFOBJ, CLIPOBJ, XLATEOBJ, RECTL, POINTL, POINTL, BRUSHOBJ, POINTL, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 11)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 11 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, SURFOBJ.Ptr, SURFOBJ.Ptr, CLIPOBJ.Ptr, XLATEOBJ.Ptr, RECTL.Ptr, POINTL.Ptr, POINTL.Ptr, BRUSHOBJ.Ptr, POINTL.Ptr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
