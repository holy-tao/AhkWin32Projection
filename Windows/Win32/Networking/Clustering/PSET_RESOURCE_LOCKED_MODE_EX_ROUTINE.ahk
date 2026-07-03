#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PSET_RESOURCE_LOCKED_MODE_EX_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PSET_RESOURCE_LOCKED_MODE_EX_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ResourceHandle 
     * @param {BOOL} LockedModeEnabled 
     * @param {Integer} LockedModeReason 
     * @param {Integer} LockedModeFlags 
     * @returns {Integer} 
     */
    Call(ResourceHandle, LockedModeEnabled, LockedModeReason, LockedModeFlags) {
        result := DllCall(this.value, IntPtr, ResourceHandle, BOOL, LockedModeEnabled, UInt32, LockedModeReason, UInt32, LockedModeFlags, UInt32)
        return result
    }

    /**
     * A PSET_RESOURCE_LOCKED_MODE_EX_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSET_RESOURCE_LOCKED_MODE_EX_ROUTINE {
        /**
         * Creates a PSET_RESOURCE_LOCKED_MODE_EX_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, BOOL, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, BOOL, UInt32, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
