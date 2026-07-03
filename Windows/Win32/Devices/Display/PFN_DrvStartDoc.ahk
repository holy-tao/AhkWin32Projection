#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SURFOBJ.ahk" { SURFOBJ }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct PFN_DrvStartDoc {
    value : IntPtr

    __value {
        set {
            if (value is PFN_DrvStartDoc) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<SURFOBJ>} pso 
     * @param {PWSTR} pwszDocName 
     * @param {Integer} dwJobId 
     * @returns {BOOL} 
     */
    Call(pso, pwszDocName, dwJobId) {
        pwszDocName := pwszDocName is String ? StrPtr(pwszDocName) : pwszDocName

        result := DllCall(this.value, SURFOBJ.Ptr, pso, "ptr", pwszDocName, UInt32, dwJobId, BOOL)
        return result
    }

    /**
     * A PFN_DrvStartDoc that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFN_DrvStartDoc {
        /**
         * Creates a PFN_DrvStartDoc pointer that invokes the given AHK function when called.
         * @param {Func(SURFOBJ, PWSTR, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [SURFOBJ.Ptr, PWSTR, UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
