#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
export default struct PNS_HELPER_START_FN {
    value : IntPtr

    __value {
        set {
            if (value is PNS_HELPER_START_FN) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidParent 
     * @param {Integer} dwVersion 
     * @returns {Integer} 
     */
    Call(pguidParent, dwVersion) {
        result := DllCall(this.value, Guid.Ptr, pguidParent, UInt32, dwVersion, UInt32)
        return result
    }

    /**
     * A PNS_HELPER_START_FN that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PNS_HELPER_START_FN {
        /**
         * Creates a PNS_HELPER_START_FN pointer that invokes the given AHK function when called.
         * @param {Func(Guid, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [Guid.Ptr, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
