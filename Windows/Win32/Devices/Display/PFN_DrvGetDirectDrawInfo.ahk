#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Graphics\DirectDraw\DD_HALINFO.ahk" { DD_HALINFO }
#Import "..\..\Graphics\DirectDraw\VIDEOMEMORY.ahk" { VIDEOMEMORY }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvGetDirectDrawInfo {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvGetDirectDrawInfo) {
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
     * @param {Pointer<DD_HALINFO>} param1 
     * @param {Pointer<Integer>} param2 
     * @param {Pointer<VIDEOMEMORY>} param3 
     * @param {Pointer<Integer>} param4 
     * @param {Pointer<Integer>} param5 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4, param5) {
        param2Marshal := param2 is VarRef ? "uint*" : "ptr"
        param4Marshal := param4 is VarRef ? "uint*" : "ptr"
        param5Marshal := param5 is VarRef ? "uint*" : "ptr"

        result := DllCall(this.value, DHPDEV, param0, DD_HALINFO.Ptr, param1, param2Marshal, param2, VIDEOMEMORY.Ptr, param3, param4Marshal, param4, param5Marshal, param5, BOOL)
        return result
    }

    /**
     * A PFN_DrvGetDirectDrawInfo that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvGetDirectDrawInfo {
        /**
         * Creates a PFN_DrvGetDirectDrawInfo pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, DD_HALINFO, "uint*", VIDEOMEMORY, "uint*", "uint*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, DD_HALINFO.Ptr, "uint*", VIDEOMEMORY.Ptr, "uint*", "uint*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
