#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CLIPOBJ.ahk" { CLIPOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\LINEATTRS.ahk" { LINEATTRS }
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import ".\BRUSHOBJ.ahk" { BRUSHOBJ }
#Import ".\XFORMOBJ.ahk" { XFORMOBJ }
#Import ".\PATHOBJ.ahk" { PATHOBJ }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvStrokePath {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvStrokePath) {
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
     * @param {Pointer<PATHOBJ>} param1 
     * @param {Pointer<CLIPOBJ>} param2 
     * @param {Pointer<XFORMOBJ>} param3 
     * @param {Pointer<BRUSHOBJ>} param4 
     * @param {Pointer<POINTL>} param5 
     * @param {Pointer<LINEATTRS>} param6 
     * @param {Integer} param7 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7) {
        result := DllCall(this.value, SURFOBJ.Ptr, param0, PATHOBJ.Ptr, param1, CLIPOBJ.Ptr, param2, XFORMOBJ.Ptr, param3, BRUSHOBJ.Ptr, param4, POINTL.Ptr, param5, LINEATTRS.Ptr, param6, UInt32, param7, BOOL)
        return result
    }

    /**
     * A PFN_DrvStrokePath that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvStrokePath {
        /**
         * Creates a PFN_DrvStrokePath pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, PATHOBJ, CLIPOBJ, XFORMOBJ, BRUSHOBJ, POINTL, LINEATTRS, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 8)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 8 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, PATHOBJ.Ptr, CLIPOBJ.Ptr, XFORMOBJ.Ptr, BRUSHOBJ.Ptr, POINTL.Ptr, LINEATTRS.Ptr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
