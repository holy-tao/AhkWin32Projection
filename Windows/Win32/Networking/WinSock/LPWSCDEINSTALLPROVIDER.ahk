#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSCDEINSTALLPROVIDER {
    value : IntPtr

    __value {
        set {
            if (value is LPWSCDEINSTALLPROVIDER) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} lpProviderId 
     * @param {Pointer<Integer>} lpErrno 
     * @returns {Integer} 
     */
    Call(lpProviderId, lpErrno) {
        lpErrnoMarshal := lpErrno is VarRef ? "int*" : "ptr"

        result := DllCall(this.value, Guid.Ptr, lpProviderId, lpErrnoMarshal, lpErrno, Int32)
        return result
    }

    /**
     * A LPWSCDEINSTALLPROVIDER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSCDEINSTALLPROVIDER {
        /**
         * Creates a LPWSCDEINSTALLPROVIDER pointer that invokes the given AHK function when called.
         * @param {Func(Guid, "int*") => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, "int*", Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
