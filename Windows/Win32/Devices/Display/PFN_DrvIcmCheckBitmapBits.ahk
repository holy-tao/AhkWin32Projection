#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DHPDEV.ahk" { DHPDEV }
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvIcmCheckBitmapBits {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvIcmCheckBitmapBits) {
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
     * @param {HANDLE} param1 
     * @param {Pointer<SURFOBJ>} param2 
     * @param {Pointer<Integer>} param3 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3) {
        param3Marshal := param3 is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, DHPDEV, param0, HANDLE, param1, SURFOBJ.Ptr, param2, param3Marshal, param3, BOOL)
        return result
    }

    /**
     * A PFN_DrvIcmCheckBitmapBits that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvIcmCheckBitmapBits {
        /**
         * Creates a PFN_DrvIcmCheckBitmapBits pointer that invokes the given AHK function when called.
         * @param {Func(DHPDEV, HANDLE, SURFOBJ, "char*") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DHPDEV, HANDLE, SURFOBJ.Ptr, "char*", BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
