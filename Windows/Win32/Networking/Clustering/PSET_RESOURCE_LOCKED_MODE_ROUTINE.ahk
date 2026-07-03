#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Reports that locked mode was configured for a resource.
 * @see https://learn.microsoft.com/windows/win32/api/resapi/nc-resapi-pset_resource_locked_mode_routine
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PSET_RESOURCE_LOCKED_MODE_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PSET_RESOURCE_LOCKED_MODE_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer} ResourceHandle A handle to the resource to configure.
     * @param {BOOL} LockedModeEnabled <b>TRUE</b> to enable locked mode; otherwise <b>FALSE</b>.
     * @param {Integer} LockedModeReason A flag that specifies the reason that locked mode was configured.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> (0), if the operation succeeds; otherwise returns a system error code.
     */
    Call(ResourceHandle, LockedModeEnabled, LockedModeReason) {
        result := DllCall(this.value, IntPtr, ResourceHandle, BOOL, LockedModeEnabled, UInt32, LockedModeReason, UInt32)
        return result
    }

    /**
     * A PSET_RESOURCE_LOCKED_MODE_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSET_RESOURCE_LOCKED_MODE_ROUTINE {
        /**
         * Creates a PSET_RESOURCE_LOCKED_MODE_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(IntPtr, BOOL, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [IntPtr, BOOL, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
