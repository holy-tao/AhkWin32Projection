#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\DRIVEROBJ.ahk" { DRIVEROBJ }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct FREEOBJPROC {
    value : IntPtr

    __value {
        set {
            if (value is FREEOBJPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DRIVEROBJ>} pDriverObj 
     * @returns {BOOL} 
     */
    Call(pDriverObj) {
        result := DllCall(this.value, DRIVEROBJ.Ptr, pDriverObj, BOOL)
        return result
    }

    /**
     * A FREEOBJPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends FREEOBJPROC {
        /**
         * Creates a FREEOBJPROC pointer that invokes the given AHK function when called.
         * @param {Func(DRIVEROBJ) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 1)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 1 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DRIVEROBJ.Ptr, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
