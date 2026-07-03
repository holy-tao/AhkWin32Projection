#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }
#Import ".\CQPAGE.ahk" { CQPAGE }

/**
 * Called by the query dialog box to notify the query form extension of events that occur in a query page.
 * @see https://learn.microsoft.com/windows/win32/api/cmnquery/nc-cmnquery-lpcqpageproc
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct LPCQPAGEPROC {
    value : IntPtr

    __value {
        set {
            if (value is LPCQPAGEPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {Pointer<CQPAGE>} pPage Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/cmnquery/ns-cmnquery-cqpage">CQPAGE</a> structure that contains data about a query page.
     * @param {HWND} _hwnd Contains the window handle of the query page.
     * @param {Integer} uMsg Contains a value that identifies the event that this function is called for. This can be one of the <a href="https://docs.microsoft.com/windows/desktop/AD/messages-communicated-through-user-interfaces">Common Query Page Messages</a>.
     * @param {WPARAM} _wParam Contains additional message data. The contents of this parameter depend on the value of the <i>uMsg</i> parameter.
     * @param {LPARAM} _lParam Contains additional message data. The content of this parameter depends on the value of the <i>uMsg</i> parameter.
     * @returns {HRESULT} The return value is the result of the message  and depends on the value of the <i>uMsg</i> parameter.
     */
    Call(pPage, _hwnd, uMsg, _wParam, _lParam) {
        result := DllCall(this.value, CQPAGE.Ptr, pPage, HWND, _hwnd, UInt32, uMsg, WPARAM, _wParam, LPARAM, _lParam, "HRESULT")
        return result
    }

    /**
     * A LPCQPAGEPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends LPCQPAGEPROC {
        /**
         * Creates a LPCQPAGEPROC pointer that invokes the given AHK function when called.
         * @param {Func(CQPAGE, HWND, UInt32, WPARAM, LPARAM) => "int"} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 5)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 5 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [CQPAGE.Ptr, HWND, UInt32, WPARAM, LPARAM, "int"])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
