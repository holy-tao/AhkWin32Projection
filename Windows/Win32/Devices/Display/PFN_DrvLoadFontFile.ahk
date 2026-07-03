#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Gdi\DESIGNVECTOR.ahk" { DESIGNVECTOR }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvLoadFontFile {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvLoadFontFile) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} param0 
     * @param {Pointer<Pointer>} param1 
     * @param {Pointer<Pointer<Void>>} param2 
     * @param {Pointer<Integer>} param3 
     * @param {Pointer<DESIGNVECTOR>} param4 
     * @param {Integer} param5 
     * @param {Integer} param6 
     * @returns {Pointer} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6) {
        param1Marshal := param1 is VarRef ? "ptr*" : "ptr"
        param2Marshal := param2 is VarRef ? "ptr*" : "ptr"
        param3Marshal := param3 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, UInt32, param0, param1Marshal, param1, param2Marshal, param2, param3Marshal, param3, DESIGNVECTOR.Ptr, param4, UInt32, param5, UInt32, param6, IntPtr)
        return result
    }

    /**
     * A PFN_DrvLoadFontFile that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvLoadFontFile {
        /**
         * Creates a PFN_DrvLoadFontFile pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, "ptr*", "ptr*", "uint*", DESIGNVECTOR, UInt32, UInt32) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 7)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 7 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, "ptr*", "ptr*", "uint*", DESIGNVECTOR.Ptr, UInt32, UInt32, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
