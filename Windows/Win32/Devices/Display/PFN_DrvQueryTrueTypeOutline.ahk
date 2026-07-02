#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GLYPHDATA.ahk" { GLYPHDATA }
#Import ".\FONTOBJ.ahk" { FONTOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Graphics\Gdi\TTPOLYGONHEADER.ahk" { TTPOLYGONHEADER }
#Import ".\DHPDEV.ahk" { DHPDEV }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvQueryTrueTypeOutline {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvQueryTrueTypeOutline) {
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
     * @param {BOOL} param3 
     * @param {Pointer<GLYPHDATA>} param4 
     * @param {Integer} param5 
     * @param {Pointer<TTPOLYGONHEADER>} param6 
     * @returns {Integer} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6) {
        result := DllCall(this.value, DHPDEV, param0, FONTOBJ.Ptr, param1, UInt32, param2, BOOL, param3, GLYPHDATA.Ptr, param4, UInt32, param5, TTPOLYGONHEADER.Ptr, param6, Int32)
        return result
    }

    /**
     * A PFN_DrvQueryTrueTypeOutline that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvQueryTrueTypeOutline {
        /**
         * Creates a PFN_DrvQueryTrueTypeOutline pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, FONTOBJ, UInt32, BOOL, GLYPHDATA, UInt32, TTPOLYGONHEADER) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, FONTOBJ.Ptr, UInt32, BOOL, GLYPHDATA.Ptr, UInt32, TTPOLYGONHEADER.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
