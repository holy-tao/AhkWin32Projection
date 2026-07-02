#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPGetPropertyText {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPGetPropertyText) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Integer} iButton 
     * @param {Integer} nPropSel 
     * @param {PWSTR} lpName 
     * @param {PWSTR} lpButtonName 
     * @param {Integer} nButtonNameLen 
     * @param {Integer} nType 
     * @returns {Integer} 
     */
    Call(iButton, nPropSel, lpName, lpButtonName, nButtonNameLen, nType) {
        lpName := lpName is String ? StrPtr(lpName) : lpName
        lpButtonName := lpButtonName is String ? StrPtr(lpButtonName) : lpButtonName

        result := DllCall(this.value, UInt32, iButton, UInt32, nPropSel, "ptr", lpName, "ptr", lpButtonName, UInt32, nButtonNameLen, UInt32, nType, UInt32)
        return result
    }

    /**
     * A PF_NPGetPropertyText that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPGetPropertyText {
        /**
         * Creates a PF_NPGetPropertyText pointer that invokes the given AHK function when called.
         * @param {Func(UInt32, UInt32, PWSTR, PWSTR, UInt32, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [UInt32, UInt32, PWSTR, PWSTR, UInt32, UInt32, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
