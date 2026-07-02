#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\Graphics\Gdi\HDC.ahk" { HDC }

/**
 * The AbortProc function is an application-defined callback function used with the SetAbortProc function.
 * @remarks
 * <div class="alert"><b>Note</b>  This is a blocking or synchronous function and might not return immediately. How quickly this function returns depends on run-time factors such as network status, print server configuration, and printer driver implementation—factors that are difficult to predict when writing an application. Calling this function from a thread that manages interaction with the user interface could make the application appear to be unresponsive.</div>
 * <div> </div>
 * If the <i>iError</i> parameter is SP_OUTOFDISK, the application need not cancel the print job. If it does not cancel the job, it must yield to Print Manager by calling the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-peekmessagea">PeekMessage</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-faxaccountincomingarchive-getmessage-vb">GetMessage</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/nc-wingdi-abortproc
 * @namespace Windows.Win32.Storage.Xps
 */
export default struct ABORTPROC {
    value : IntPtr

    __value {
        set {
            if (value is ABORTPROC) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HDC} param0 
     * @param {Integer} param1 
     * @returns {BOOL} The callback function should return <b>TRUE</b> to continue the print job or <b>FALSE</b> to cancel the print job.
     */
    Call(param0, param1) {
        result := DllCall(this.value, HDC, param0, Int32, param1, BOOL)
        return result
    }

    /**
     * A ABORTPROC that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ABORTPROC {
        /**
         * Creates a ABORTPROC pointer that invokes the given AHK function when called.
         * @param {Func(HDC, Int32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HDC, Int32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
