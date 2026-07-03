#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvAssociateSharedSurface {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvAssociateSharedSurface) {
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
     * @param {HANDLE} param1 
     * @param {HANDLE} param2 
     * @param {SIZE} param3 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3) {
        result := DllCall(this.value, SURFOBJ.Ptr, param0, HANDLE, param1, HANDLE, param2, SIZE, param3, BOOL)
        return result
    }

    /**
     * A PFN_DrvAssociateSharedSurface that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvAssociateSharedSurface {
        /**
         * Creates a PFN_DrvAssociateSharedSurface pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, HANDLE, HANDLE, SIZE) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, HANDLE, HANDLE, SIZE, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
