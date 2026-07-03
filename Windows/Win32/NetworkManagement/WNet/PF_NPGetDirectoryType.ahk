#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPGetDirectoryType {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPGetDirectoryType) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} lpName 
     * @param {Pointer<Integer>} lpType 
     * @param {BOOL} bFlushCache 
     * @returns {Integer} 
     */
    Call(lpName, lpType, bFlushCache) {
        lpName := lpName is String ? StrPtr(lpName) : lpName

        lpTypeMarshal := lpType is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, "ptr", lpName, lpTypeMarshal, lpType, BOOL, bFlushCache, UInt32)
        return result
    }

    /**
     * A PF_NPGetDirectoryType that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPGetDirectoryType {
        /**
         * Creates a PF_NPGetDirectoryType pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, "int*", BOOL) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, "int*", BOOL, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
