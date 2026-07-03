#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import ".\IShellFolder.ahk" { IShellFolder }
#Import ".\IShellView.ahk" { IShellView }

/**
 * Defines the prototype for the callback function used by the system folder view object. This function essentially duplicates the functionality of IShellFolderViewCB.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nc-shlobj_core-lpfnviewcallback
 * @namespace Windows.Win32.UI.Shell
 */
export default struct LPFNVIEWCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPFNVIEWCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IShellView} psvOuter Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>*</b>
     * 
     * A pointer to the owning instance of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellview">IShellView</a>, if applicable. This parameter can be <b>NULL</b>.
     * @param {IShellFolder} psf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to the instance of <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> the message applies to.
     * @param {HWND} hwndMain Type: <b>HWND</b>
     * 
     * The handle of the window that contains the view that receives the message.
     * @param {Integer} uMsg Type: <b>UINT</b>
     * 
     * One of the following notifications.
     * @param {WPARAM} _wParam Type: <b>WPARAM</b>
     * 
     * Additional information dependent on the value in <i>uMsg</i>. See the individual notification pages for specific requirements.
     * @param {LPARAM} _lParam Type: <b>LPARAM</b>
     * 
     * Additional information dependent on the value in <i>uMsg</i>. See the individual notification pages for specific requirements.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this callback function succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     */
    Call(psvOuter, psf, hwndMain, uMsg, _wParam, _lParam) {
        result := DllCall(this.value, "ptr", psvOuter, "ptr", psf, HWND, hwndMain, UInt32, uMsg, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
        return result
    }

    /**
     * A LPFNVIEWCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNVIEWCALLBACK {
        /**
         * Creates a LPFNVIEWCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", "ptr", HWND, UInt32, WPARAM, LPARAM) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", "ptr", HWND, UInt32, WPARAM, LPARAM, "int"])
        }

        __Delete() => CallbackFree(this.value)
    }
}
