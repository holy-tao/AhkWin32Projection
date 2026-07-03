#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.WNet
 */
export default struct PF_NPPropertyDialog {
    value : IntPtr

    __value {
        set {
            if (value is PF_NPPropertyDialog) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {Integer} iButtonDlg 
     * @param {Integer} nPropSel 
     * @param {PWSTR} lpFileName 
     * @param {Integer} nType 
     * @returns {Integer} 
     */
    Call(hwndParent, iButtonDlg, nPropSel, lpFileName, nType) {
        lpFileName := lpFileName is String ? StrPtr(lpFileName) : lpFileName

        result := DllCall(this.value, HWND, hwndParent, UInt32, iButtonDlg, UInt32, nPropSel, "ptr", lpFileName, UInt32, nType, UInt32)
        return result
    }

    /**
     * A PF_NPPropertyDialog that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PF_NPPropertyDialog {
        /**
         * Creates a PF_NPPropertyDialog pointer that invokes the given AHK function when called.
         * @param {Func(HWND, UInt32, UInt32, PWSTR, UInt32) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, UInt32, UInt32, PWSTR, UInt32, UInt32])
        }

        __Delete() => CallbackFree(this.value)
    }
}
