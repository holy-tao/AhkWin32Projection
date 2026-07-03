#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }
#Import ".\FONTOBJ.ahk" { FONTOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvQueryAdvanceWidths {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvQueryAdvanceWidths) {
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
     * @param {Pointer<Integer>} param3 
     * @param {Pointer<Void>} param4 
     * @param {Integer} param5 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5) {
        param3Marshal := param3 is VarRef ? "uint*" : "ptr"
        param4Marshal := param4 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DHPDEV, param0, FONTOBJ.Ptr, param1, UInt32, param2, param3Marshal, param3, param4Marshal, param4, UInt32, param5, BOOL)
        return result
    }

    /**
     * A PFN_DrvQueryAdvanceWidths that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvQueryAdvanceWidths {
        /**
         * Creates a PFN_DrvQueryAdvanceWidths pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, FONTOBJ, UInt32, "uint*", "ptr", UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, FONTOBJ.Ptr, UInt32, "uint*", "ptr", UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
