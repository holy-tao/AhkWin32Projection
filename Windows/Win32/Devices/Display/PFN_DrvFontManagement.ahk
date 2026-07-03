#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FONTOBJ.ahk" { FONTOBJ }
#Import ".\SURFOBJ.ahk" { SURFOBJ }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvFontManagement {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvFontManagement) {
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
     * @param {Pointer<FONTOBJ>} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<Void>} param4 
     * @param {Integer} param5 
     * @param {Pointer<Void>} param6 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6) {
        param4Marshal := param4 is VarRef ? "ptr" : "ptr"
        param6Marshal := param6 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, SURFOBJ.Ptr, param0, FONTOBJ.Ptr, param1, UInt32, param2, UInt32, param3, param4Marshal, param4, UInt32, param5, param6Marshal, param6, UInt32)
        return result
    }

    /**
     * A PFN_DrvFontManagement that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvFontManagement {
        /**
         * Creates a PFN_DrvFontManagement pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, FONTOBJ, UInt32, UInt32, "ptr", UInt32, "ptr") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, FONTOBJ.Ptr, UInt32, UInt32, "ptr", UInt32, "ptr", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
