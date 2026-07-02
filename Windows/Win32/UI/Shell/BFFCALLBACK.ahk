#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Receives event notifications from the Active Directory Domain Services container browser dialog box.
 * @remarks
 * The <b>DSBM_*</b> message values are defined in Dsclient.h.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nc-shlobj_core-bffcallback
 * @namespace Windows.Win32.UI.Shell
 */
export default struct BFFCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is BFFCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} _hwnd Contains the window handle of the browse dialog box. This handle is used to send messages to the browse dialog box using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/oe/oe-ihttpmailtransport-sendmessage">SendMessage</a> function.
     * 
     * 
     * The container browser dialog box handles the following messages.
     * @param {Integer} uMsg Specifies one of the following browse messages.
     * @param {LPARAM} _lParam The value and meaning of this parameter is determined by the notification received. For more information, see the notification message descriptions under the <i>uMsg</i> parameter.
     * @param {LPARAM} lpData Contains a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-dsbrowseinfoa">DSBROWSEINFO</a> structure passed to the <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/nf-dsclient-dsbrowseforcontainera">DsBrowseForContainer</a> function. This is true for all notification messages.
     * @returns {Integer} 
     */
    Call(_hwnd, uMsg, _lParam, lpData) {
        result := DllCall(this.value, HWND, _hwnd, UInt32, uMsg, LPARAM, _lParam, LPARAM, lpData, Int32)
        return result
    }

    /**
     * A BFFCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends BFFCALLBACK {
        /**
         * Creates a BFFCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func(HWND, UInt32, LPARAM, LPARAM) => Int32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, UInt32, LPARAM, LPARAM, Int32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
