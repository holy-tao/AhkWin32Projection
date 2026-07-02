#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Registry\HKEY.ahk" { HKEY }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct POPEN_V2_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is POPEN_V2_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} ResourceName 
     * @param {HKEY} ResourceKey 
     * @param {Pointer} ResourceHandle 
     * @param {Integer} OpenFlags 
     * @returns {Pointer<Void>} 
     */
    Call(ResourceName, ResourceKey, ResourceHandle, OpenFlags) {
        ResourceName := ResourceName is String ? StrPtr(ResourceName) : ResourceName

        result := DllCall(this.value, "ptr", ResourceName, HKEY, ResourceKey, IntPtr, ResourceHandle, UInt32, OpenFlags, IntPtr)
        return result
    }

    /**
     * A POPEN_V2_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends POPEN_V2_ROUTINE {
        /**
         * Creates a POPEN_V2_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, HKEY, IntPtr, UInt32) => "ptr"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, HKEY, IntPtr, UInt32, "ptr"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
