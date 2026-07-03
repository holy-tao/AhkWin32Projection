#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * Called before messages are processed by the certificate selection dialog box produced by the CertSelectCertificate function.
 * @remarks
 * For information about hooks, see <a href="https://docs.microsoft.com/windows/desktop/winmsg/hooks">Hooks</a>.
 * @see https://learn.microsoft.com/windows/win32/api/cryptdlg/nc-cryptdlg-pfncmhookproc
 * @namespace Windows.Win32.Security.Cryptography.UI
 */
export default struct PFNCMHOOKPROC {
    value : IntPtr

    __value {
        set {
            if (value is PFNCMHOOKPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} hwndDialog A handle to a dialog box window.
     * @param {Integer} message The message.
     * @param {WPARAM} _wParam Additional information about the message sent or posted.
     * @param {LPARAM} _lParam Additional information about the message sent or posted.
     * @returns {Integer} Return a nonzero value (<b>TRUE</b>) if this function processes the message. Return zero (<b>FALSE</b>) if this function does not process the message.
     */
    Call(hwndDialog, message, _wParam, _lParam) {
        result := DllCall(this.value, HWND, hwndDialog, UInt32, message, WPARAM, _wParam, LPARAM, _lParam, UInt32)
        return result
    }

    /**
     * A PFNCMHOOKPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFNCMHOOKPROC {
        /**
         * Creates a PFNCMHOOKPROC pointer that invokes the given AHK function when called.
         * @param {Func(HWND, UInt32, WPARAM, LPARAM) => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, UInt32, WPARAM, LPARAM, UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
