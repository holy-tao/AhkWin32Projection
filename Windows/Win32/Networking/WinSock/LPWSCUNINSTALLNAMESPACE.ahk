#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSCUNINSTALLNAMESPACE {
    value : IntPtr

    __value {
        set {
            if (value is LPWSCUNINSTALLNAMESPACE) {
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
     * @returns {Integer} 
     */
    Call(lpProviderId) {
        result := DllCall(this.value, Guid.Ptr, lpProviderId, Int32)
        return result
    }

    /**
     * A LPWSCUNINSTALLNAMESPACE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSCUNINSTALLNAMESPACE {
        /**
         * Creates a LPWSCUNINSTALLNAMESPACE pointer that invokes the given AHK function when called.
         * @param {Func(Guid) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
