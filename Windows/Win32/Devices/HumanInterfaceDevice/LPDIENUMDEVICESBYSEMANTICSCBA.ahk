#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DIDEVICEINSTANCEA.ahk" { DIDEVICEINSTANCEA }
#Import ".\IDirectInputDevice8A.ahk" { IDirectInputDevice8A }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @charset ANSI
 */
export default struct LPDIENUMDEVICESBYSEMANTICSCBA {
    value : IntPtr

    __value {
        set {
            if (value is LPDIENUMDEVICESBYSEMANTICSCBA) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<DIDEVICEINSTANCEA>} param0 
     * @param {IDirectInputDevice8A} param1 
     * @param {Integer} param2 
     * @param {Integer} param3 
     * @param {Pointer<Void>} param4 
     * @returns {BOOL} 
     */
    Call(param0, param1, param2, param3, param4) {
        param4Marshal := param4 is VarRef ? "ptr" : "ptr"

        result := DllCall(this.value, DIDEVICEINSTANCEA.Ptr, param0, "ptr", param1, UInt32, param2, UInt32, param3, param4Marshal, param4, BOOL)
        return result
    }

    /**
     * A LPDIENUMDEVICESBYSEMANTICSCBA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPDIENUMDEVICESBYSEMANTICSCBA {
        /**
         * Creates a LPDIENUMDEVICESBYSEMANTICSCBA pointer that invokes the given AHK function when called.
         * @param {Func(DIDEVICEINSTANCEA, "ptr", UInt32, UInt32, "ptr") => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [DIDEVICEINSTANCEA.Ptr, "ptr", UInt32, UInt32, "ptr", BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
