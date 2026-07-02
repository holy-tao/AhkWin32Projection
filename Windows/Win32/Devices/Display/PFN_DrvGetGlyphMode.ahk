#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FONTOBJ.ahk" { FONTOBJ }
#Import ".\DHPDEV.ahk" { DHPDEV }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvGetGlyphMode {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvGetGlyphMode) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {DHPDEV} _dhpdev 
     * @param {Pointer<FONTOBJ>} pfo 
     * @returns {Integer} 
     */
    Call(_dhpdev, pfo) {
        result := DllCall(this.value, DHPDEV, _dhpdev, FONTOBJ.Ptr, pfo, UInt32)
        return result
    }

    /**
     * A PFN_DrvGetGlyphMode that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvGetGlyphMode {
        /**
         * Creates a PFN_DrvGetGlyphMode pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, FONTOBJ) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, FONTOBJ.Ptr, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
