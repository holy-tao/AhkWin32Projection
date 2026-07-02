#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Graphics\DirectDraw\DD_SURFACECALLBACKS.ahk" { DD_SURFACECALLBACKS }
#Import ".\DHPDEV.ahk" { DHPDEV }
#Import "..\..\Graphics\DirectDraw\DD_PALETTECALLBACKS.ahk" { DD_PALETTECALLBACKS }
#Import "..\..\Graphics\DirectDraw\DD_CALLBACKS.ahk" { DD_CALLBACKS }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvEnableDirectDraw {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvEnableDirectDraw) {
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
     * @param {Pointer<DD_CALLBACKS>} param1 
     * @param {Pointer<DD_SURFACECALLBACKS>} param2 
     * @param {Pointer<DD_PALETTECALLBACKS>} param3 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3) {
        result := DllCall(this.value, DHPDEV, param0, DD_CALLBACKS.Ptr, param1, DD_SURFACECALLBACKS.Ptr, param2, DD_PALETTECALLBACKS.Ptr, param3, BOOL)
        return result
    }

    /**
     * A PFN_DrvEnableDirectDraw that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvEnableDirectDraw {
        /**
         * Creates a PFN_DrvEnableDirectDraw pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, DD_CALLBACKS, DD_SURFACECALLBACKS, DD_PALETTECALLBACKS) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, DD_CALLBACKS.Ptr, DD_SURFACECALLBACKS.Ptr, DD_PALETTECALLBACKS.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
