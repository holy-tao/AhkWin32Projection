#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FSRTL_ADVANCED_FCB_HEADER.ahk" { FSRTL_ADVANCED_FCB_HEADER }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct PFN_FSRTLTEARDOWNPERSTREAMCONTEXTS {
    value : IntPtr

    __value {
        set {
            if (value is PFN_FSRTLTEARDOWNPERSTREAMCONTEXTS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<FSRTL_ADVANCED_FCB_HEADER>} AdvancedHeader 
     * @returns {String} Nothing - always returns an empty string
     */
    Call(AdvancedHeader) {
        DllCall(this.value, FSRTL_ADVANCED_FCB_HEADER.Ptr, AdvancedHeader)
    }

    /**
     * A PFN_FSRTLTEARDOWNPERSTREAMCONTEXTS that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_FSRTLTEARDOWNPERSTREAMCONTEXTS {
        /**
         * Creates a PFN_FSRTLTEARDOWNPERSTREAMCONTEXTS pointer that invokes the given AHK function when called.
         * @param {Func(FSRTL_ADVANCED_FCB_HEADER) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [FSRTL_ADVANCED_FCB_HEADER.Ptr, IntPtr])
        }

        __Delete() => CallbackFree(this.value)
    }
}
