#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BRUSHOBJ.ahk" { BRUSHOBJ }
#Import ".\CLIPOBJ.ahk" { CLIPOBJ }
#Import ".\LINEATTRS.ahk" { LINEATTRS }
#Import ".\PATHOBJ.ahk" { PATHOBJ }
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import ".\XFORMOBJ.ahk" { XFORMOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvStrokeAndFillPath {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvStrokeAndFillPath) {
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
     * @param {Pointer<LINEATTRS>} param5 
     * @param {Pointer<BRUSHOBJ>} param6 
     * @param {Pointer<POINTL>} param7 
     * @param {Integer} param8 
     * @param {Integer} param9 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7, param8, param9) {
        result := DllCall(this.value, SURFOBJ.Ptr, param0, PATHOBJ.Ptr, param1, CLIPOBJ.Ptr, param2, XFORMOBJ.Ptr, param3, BRUSHOBJ.Ptr, param4, LINEATTRS.Ptr, param5, BRUSHOBJ.Ptr, param6, POINTL.Ptr, param7, UInt32, param8, UInt32, param9, BOOL)
        return result
    }

    /**
     * A PFN_DrvStrokeAndFillPath that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvStrokeAndFillPath {
        /**
         * Creates a PFN_DrvStrokeAndFillPath pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, PATHOBJ, CLIPOBJ, XFORMOBJ, BRUSHOBJ, LINEATTRS, BRUSHOBJ, POINTL, UInt32, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 10)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 10 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, PATHOBJ.Ptr, CLIPOBJ.Ptr, XFORMOBJ.Ptr, BRUSHOBJ.Ptr, LINEATTRS.Ptr, BRUSHOBJ.Ptr, POINTL.Ptr, UInt32, UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
