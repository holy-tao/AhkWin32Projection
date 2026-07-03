#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\UI\ColorSystem\LOGCOLORSPACEW.ahk" { LOGCOLORSPACEW }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvIcmCreateColorTransform {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvIcmCreateColorTransform) {
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
     * @param {Pointer<LOGCOLORSPACEW>} param1 
     * @param {Pointer<Void>} param2 
     * @param {Integer} param3 
     * @param {Pointer<Void>} param4 
     * @param {Integer} param5 
     * @param {Pointer<Void>} param6 
     * @param {Integer} param7 
     * @param {Integer} param8 
     * @returns {HANDLE} 
     */
    Call(param0, param1, param2, param3, param4, param5, param6, param7, param8) {
        param2Marshal := param2 is VarRef ? "ptr" : "ptr"
        param4Marshal := param4 is VarRef ? "ptr" : "ptr"
        param6Marshal := param6 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DHPDEV, param0, LOGCOLORSPACEW.Ptr, param1, param2Marshal, param2, UInt32, param3, param4Marshal, param4, UInt32, param5, param6Marshal, param6, UInt32, param7, UInt32, param8, HANDLE.Owned)
        return result
    }

    /**
     * A PFN_DrvIcmCreateColorTransform that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvIcmCreateColorTransform {
        /**
         * Creates a PFN_DrvIcmCreateColorTransform pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, LOGCOLORSPACEW, "ptr", UInt32, "ptr", UInt32, "ptr", UInt32, UInt32) => HANDLE} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 9)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 9 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, LOGCOLORSPACEW.Ptr, "ptr", UInt32, "ptr", UInt32, "ptr", UInt32, UInt32, HANDLE])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
