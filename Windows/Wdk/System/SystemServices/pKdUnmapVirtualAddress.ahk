#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct pKdUnmapVirtualAddress {
    value : IntPtr

    __value {
        set {
            if (value is pKdUnmapVirtualAddress) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Void>} VirtualAddress 
     * @param {Integer} NumberPages 
     * @param {BOOLEAN} FlushCurrentTLB 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(VirtualAddress, NumberPages, FlushCurrentTLB) {
        VirtualAddressMarshal := VirtualAddress is VarRef ? "ptr" : "ptr"

        DllCall(this.value, VirtualAddressMarshal, VirtualAddress, UInt32, NumberPages, BOOLEAN, FlushCurrentTLB)
    }

    /**
     * A pKdUnmapVirtualAddress that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pKdUnmapVirtualAddress {
        /**
         * Creates a pKdUnmapVirtualAddress pointer that invokes the given AHK function when called.
         * @param {Func("ptr", UInt32, BOOLEAN) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", UInt32, BOOLEAN, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
