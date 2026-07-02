#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * An application-defined callback function used with the SendMessageCallback function.
 * @remarks
 * You install a <i>SendAsyncProc</i> application-defined callback function by passing a <b>SENDASYNCPROC</b> pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendmessagecallbacka">SendMessageCallback</a> function. 
 * 
 * The callback function is only called when the thread that called <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendmessagecallbacka">SendMessageCallback</a> calls <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getmessage">GetMessage</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-waitmessage">WaitMessage</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nc-winuser-sendasyncproc
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct SENDASYNCPROC {
    value : IntPtr

    __value {
        set {
            if (value is SENDASYNCPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} param0 Type: <b>HWND</b>
     * 
     * A handle to the window whose window procedure received the message. 
     * 
     * If the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendmessagecallbacka">SendMessageCallback</a> function was called with its <i>hwnd</i> parameter set to <b>HWND_BROADCAST</b>, the system calls the <i>SendAsyncProc</i> function once for each top-level window.
     * @param {Integer} param1 Type: <b>UINT</b>
     * 
     * The message.
     * @param {Pointer} param2 Type: <b>ULONG_PTR</b>
     * 
     * An application-defined value sent from the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendmessagecallbacka">SendMessageCallback</a> function.
     * @param {LRESULT} param3 Type: <b>LRESULT</b>
     * 
     * The result of the message processing. This value depends on the message.
     * @returns {String} Nothing - always returns an empty string
     */
    Call(param0, param1, param2, param3) {
        DllCall(this.value, HWND, param0, UInt32, param1, IntPtr, param2, LRESULT, param3)
    }

    /**
     * A SENDASYNCPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends SENDASYNCPROC {
        /**
         * Creates a SENDASYNCPROC pointer that invokes the given AHK function when called.
         * @param {Func(HWND, UInt32, IntPtr, LRESULT) => IntPtr} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, UInt32, IntPtr, LRESULT, IntPtr])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
