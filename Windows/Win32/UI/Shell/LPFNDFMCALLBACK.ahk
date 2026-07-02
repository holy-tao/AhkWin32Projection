#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\System\Com\IDataObject.ahk" { IDataObject }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IShellFolder.ahk" { IShellFolder }

/**
 * LPFNDFMCALLBACK may be altered or unavailable.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/nc-shlobj_core-lpfndfmcallback
 * @namespace Windows.Win32.UI.Shell
 */
export default struct LPFNDFMCALLBACK {
    value : IntPtr

    __value {
        set {
            if (value is LPFNDFMCALLBACK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {IShellFolder} psf Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a>*</b>
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellfolder">IShellFolder</a> object the message applies to. This value can be <b>NULL</b>.
     * @param {HWND} _hwnd Type: <b>HWND</b>
     * 
     * The handle of the window that contains the view. This value can be <b>NULL</b>.
     * @param {IDataObject} pdtobj Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a>*</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> that represents the selection the context menu is based on. This value can be <b>NULL</b>.
     * @param {Integer} uMsg Type: <b>UINT</b>
     * 
     * One of the following notifications.
     *     					
     *                         
     * 
     * <table class="clsStd">
     * <tr>
     * <th>Notification</th>
     * <th>Usage</th>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/registering-control-panel-items">DFM_MERGECONTEXTMENU</a>
     * </td>
     * <td>Sent by the default context menu implementation to allow <b>LPFNDFMCALLBACK</b> to add items to the menu.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/preview-handler-guidelines">DFM_INVOKECOMMAND</a>
     * </td>
     * <td>Sent by the default context menu implementation to request <b>LPFNDFMCALLBACK</b> to invoke a menu command.</td>
     * </tr>
     * <tr>
     * <td>
     * <a href="https://docs.microsoft.com/windows/desktop/shell/library-ovw">DFM_GETDEFSTATICID</a>
     * </td>
     * <td>Sent by the default context menu implementation when the default menu command is being created, allowing an alternate choice to be made.</td>
     * </tr>
     * </table>
     * @param {WPARAM} _wParam Type: <b>WPARAM</b>
     * 
     * Additional information. See the individual notification pages for specific requirements.
     * @param {LPARAM} _lParam Type: <b>LPARAM</b>
     * 
     * Additional information. See the individual notification pages for specific requirements.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if the message was handled, or an error value otherwise, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The message was not handled.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call(psf, _hwnd, pdtobj, uMsg, _wParam, _lParam) {
        result := DllCall(this.value, "ptr", psf, HWND, _hwnd, "ptr", pdtobj, UInt32, uMsg, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
        return result
    }

    /**
     * A LPFNDFMCALLBACK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPFNDFMCALLBACK {
        /**
         * Creates a LPFNDFMCALLBACK pointer that invokes the given AHK function when called.
         * @param {Func("ptr", HWND, "ptr", UInt32, WPARAM, LPARAM) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 6)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 6 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , ["ptr", HWND, "ptr", UInt32, WPARAM, LPARAM, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
