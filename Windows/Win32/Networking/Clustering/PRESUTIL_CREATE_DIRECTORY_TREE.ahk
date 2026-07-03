#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Networking.Clustering
 */
export default struct PRESUTIL_CREATE_DIRECTORY_TREE {
    value : IntPtr

    __value {
        set {
            if (value is PRESUTIL_CREATE_DIRECTORY_TREE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pszPath 
     * @returns {Integer} 
     */
    Call(pszPath) {
        pszPath := pszPath is String ? StrPtr(pszPath) : pszPath

        result := DllCall(this.value, "ptr", pszPath, UInt32)
        return result
    }

    /**
     * A PRESUTIL_CREATE_DIRECTORY_TREE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PRESUTIL_CREATE_DIRECTORY_TREE {
        /**
         * Creates a PRESUTIL_CREATE_DIRECTORY_TREE pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
