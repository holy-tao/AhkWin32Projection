#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct LPWSCWRITENAMESPACEORDER {
    value : IntPtr

    __value {
        set {
            if (value is LPWSCWRITENAMESPACEORDER) {
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
     * @param {Integer} dwNumberOfEntries 
     * @returns {Integer} 
     */
    Call(lpProviderId, dwNumberOfEntries) {
        result := DllCall(this.value, Guid.Ptr, lpProviderId, UInt32, dwNumberOfEntries, Int32)
        return result
    }

    /**
     * A LPWSCWRITENAMESPACEORDER that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPWSCWRITENAMESPACEORDER {
        /**
         * Creates a LPWSCWRITENAMESPACEORDER pointer that invokes the given AHK function when called.
         * @param {Func(Guid, UInt32) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, UInt32, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
