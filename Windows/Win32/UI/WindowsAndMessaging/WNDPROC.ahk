#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\LPARAM.ahk" { LPARAM }
#Import "..\..\Foundation\LRESULT.ahk" { LRESULT }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * A callback function, which you define in your application, that processes messages sent to a window.
 * @remarks
 * If your application runs on a 32-bit version of Windows operating system, uncaught exceptions from the callback will be passed onto higher-level exception handlers of your application when available. The system then calls the unhandled exception filter to handle the exception prior to terminating the process. If the PCA is enabled, it will offer to fix the problem the next time you run the application.
 * 
 * However, if your application runs on a 64-bit version of Windows operating system or WOW64, you should be aware that a 64-bit operating system handles uncaught exceptions differently based on its 64-bit processor architecture, exception architecture, and calling convention. The following table summarizes all possible ways that a 64-bit Windows operating system or WOW64 handles uncaught exceptions.
 * 
 * |Behavior type|How the system handles uncaught exceptions|
 * |-|-|
 * |1|The system suppresses any uncaught exceptions.|
 * |2|The system first terminates the process, and then the Program Compatibility Assistant (PCA) offers to fix it the next time you run the application. You can disable the PCA mitigation by adding a Compatibility section to the [application manifest](/windows/win32/win7appqual/compatibility---application-manifest).|
 * |3|The system calls the exception filters but suppresses any uncaught exceptions when it leaves the callback scope, without invoking the associated handlers.|
 * 
 * The following table shows how a 64-bit version of the Windows operating system, and WOW64, handles uncaught exceptions. Notice that behavior type 2 applies only to the 64-bit version of the Windows 7 operating system and later.
 * 
 * |Operating system|WOW64|64-bit Windows|
 * |-|-|-|
 * |Windows XP|3|1|
 * |Windows Server 2003|3|1|
 * |Windows Vista|3|1|
 * |Windows Vista SP1|1|1|
 * |Windows 7 and later|1|2|
 * 
 * > [!NOTE]
 * > On Windows 7 with SP1 (32-bit, 64-bit, or WOW64), the system calls the unhandled exception filter to handle the exception prior to terminating the process. If the Program Compatibility Assistant (PCA) is enabled, then it will offer to fix the problem the next time you run the application.
 * 
 * If you need to handle exceptions in your application, you can use structured exception handling to do so. For more information on how to use structured exception handling, see [Structured exception handling](/windows/win32/debug/structured-exception-handling).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/nc-winuser-wndproc
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct WNDPROC {
    value : IntPtr

    __value {
        set {
            if (value is WNDPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HWND} param0 Type: **[HWND](/windows/win32/winprog/windows-data-types)**
     * 
     * A handle to the window. This parameter is typically named *hWnd*.
     * @param {Integer} param1 Type: **[UINT](/windows/win32/winprog/windows-data-types)**
     * 
     * The message. This parameter is typically named *uMsg*.
     * 
     * For lists of the system-provided messages, see [System-defined messages](/windows/win32/winmsg/about-messages-and-message-queues#system-defined-messages).
     * @param {WPARAM} param2 Type: **[WPARAM](/windows/win32/winprog/windows-data-types)**
     * 
     * Additional message information. This parameter is typically named *wParam*.
     * 
     * The contents of the *wParam* parameter depend on the value of the *uMsg* parameter.
     * @param {LPARAM} param3 Type: **[LPARAM](/windows/win32/winprog/windows-data-types)**
     * 
     * Additional message information. This parameter is typically named *lParam*.
     * 
     * The contents of the *lParam* parameter depend on the value of the *uMsg* parameter.
     * @returns {LRESULT} Type: **[LRESULT](/windows/win32/winprog/windows-data-types)**
     * 
     * The return value is the result of the message processing, and depends on the message sent.
     */
    Call(param0, param1, param2, param3) {
        result := DllCall(this.value, HWND, param0, UInt32, param1, WPARAM, param2, LPARAM, param3, LRESULT)
        return result
    }

    /**
     * A WNDPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends WNDPROC {
        /**
         * Creates a WNDPROC pointer that invokes the given AHK function when called.
         * @param {Func(HWND, UInt32, WPARAM, LPARAM) => LRESULT} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HWND, UInt32, WPARAM, LPARAM, LRESULT])
        }

        __Delete() => CallbackFree(this.value)
    }
}
