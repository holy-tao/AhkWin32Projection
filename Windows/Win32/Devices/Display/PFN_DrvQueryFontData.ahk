#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }
#Import ".\FONTOBJ.ahk" { FONTOBJ }
#Import ".\GLYPHDATA.ahk" { GLYPHDATA }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvQueryFontData {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvQueryFontData) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {DHPDEV} param0 
     * @param {Pointer<FONTOBJ>} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<GLYPHDATA>} param4 
     * @param {Pointer<Void>} param5 
     * @param {Integer} param6 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6) {
        param5Marshal := param5 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DHPDEV, param0, FONTOBJ.Ptr, param1, UInt32, param2, UInt32, param3, GLYPHDATA.Ptr, param4, param5Marshal, param5, UInt32, param6, Int32)
        return result
    }

    /**
     * A PFN_DrvQueryFontData that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvQueryFontData {
        /**
         * Creates a PFN_DrvQueryFontData pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, FONTOBJ, UInt32, UInt32, GLYPHDATA, "ptr", UInt32) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, FONTOBJ.Ptr, UInt32, UInt32, GLYPHDATA.Ptr, "ptr", UInt32, Int32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
