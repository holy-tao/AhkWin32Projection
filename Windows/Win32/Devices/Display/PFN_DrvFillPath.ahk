#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BRUSHOBJ.ahk" { BRUSHOBJ }
#Import ".\CLIPOBJ.ahk" { CLIPOBJ }
#Import ".\PATHOBJ.ahk" { PATHOBJ }
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvFillPath {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvFillPath) {
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
     * @param {Pointer<BRUSHOBJ>} param3 
     * @param {Pointer<POINTL>} param4 
     * @param {Integer} param5 
     * @param {Integer} param6 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6) {
        result := DllCall(this.value, SURFOBJ.Ptr, param0, PATHOBJ.Ptr, param1, CLIPOBJ.Ptr, param2, BRUSHOBJ.Ptr, param3, POINTL.Ptr, param4, UInt32, param5, UInt32, param6, BOOL)
        return result
    }

    /**
     * A PFN_DrvFillPath that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvFillPath {
        /**
         * Creates a PFN_DrvFillPath pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, PATHOBJ, CLIPOBJ, BRUSHOBJ, POINTL, UInt32, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, PATHOBJ.Ptr, CLIPOBJ.Ptr, BRUSHOBJ.Ptr, POINTL.Ptr, UInt32, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
