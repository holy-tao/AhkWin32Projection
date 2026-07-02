#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSCENABLENSPROVIDER {
    value : IntPtr

    __value {
        set {
            if (value is LPWSCENABLENSPROVIDER) {
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
     * @param {BOOL} fEnable 
     * @returns {Integer} 
     */
    Call(lpProviderId, fEnable) {
        result := DllCall(this.value, Guid.Ptr, lpProviderId, BOOL, fEnable, Int32)
        return result
    }

    /**
     * A LPWSCENABLENSPROVIDER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSCENABLENSPROVIDER {
        /**
         * Creates a LPWSCENABLENSPROVIDER pointer that invokes the given AHK function when called.
         * @param {Func(Guid, BOOL) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, BOOL, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
