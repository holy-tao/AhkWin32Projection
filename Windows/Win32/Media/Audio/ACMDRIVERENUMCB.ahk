#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\HACMDRIVERID.ahk" { HACMDRIVERID }

/**
 * The acmDriverEnumCallback function specifies a callback function used with the acmDriverEnum function. The acmDriverEnumCallback name is a placeholder for an application-defined function name.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriverenum">acmDriverEnum</a> function will return MMSYSERR_NOERROR (zero) if no ACM drivers are installed. Moreover, the callback function will not be called.
 * 
 * The following functions should not be called from within the callback function: <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriveradd">acmDriverAdd</a>, <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriverremove">acmDriverRemove</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriverpriority">acmDriverPriority</a>.
 * @see https://learn.microsoft.com/windows/win32/api/msacm/nc-msacm-acmdriverenumcb
 * @namespace Windows.Win32.Media.Audio
 */
export default struct ACMDRIVERENUMCB {
    value : IntPtr

    __value {
        set {
            if (value is ACMDRIVERENUMCB) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HACMDRIVERID} hadid Handle to an ACM driver identifier.
     * @param {Pointer} dwInstance Application-defined value specified in <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriverenum">acmDriverEnum</a>.
     * @param {Integer} fdwSupport 
     * @returns {BOOL} The callback function must return <b>TRUE</b> to continue enumeration or <b>FALSE</b> to stop enumeration.
     */
    Call(hadid, dwInstance, fdwSupport) {
        result := DllCall(this.value, HACMDRIVERID, hadid, IntPtr, dwInstance, UInt32, fdwSupport, BOOL)
        return result
    }

    /**
     * A ACMDRIVERENUMCB that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ACMDRIVERENUMCB {
        /**
         * Creates a ACMDRIVERENUMCB pointer that invokes the given AHK function when called.
         * @param {Func(HACMDRIVERID, IntPtr, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HACMDRIVERID, IntPtr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
