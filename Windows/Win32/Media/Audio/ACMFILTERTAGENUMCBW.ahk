#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ACMFILTERTAGDETAILSW.ahk" { ACMFILTERTAGDETAILSW }
#Import ".\HACMDRIVERID.ahk" { HACMDRIVERID }

/**
 * The ACMFILTERTAGENUMCBW (Unicode) callback function specifies a callback function used with the acmFilterTagEnum function.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmfiltertagenum">acmFilterTagEnum</a> function returns <b>MMSYSERR_NOERROR</b> (zero) if no filter tags are to be enumerated. Moreover, the callback function will not be called.
 * 
 * The following functions should not be called from within the callback function: <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriveradd">acmDriverAdd</a>, <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriverremove">acmDriverRemove</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriverpriority">acmDriverPriority</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The msacm.h header defines ACMFILTERTAGENUMCB as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/msacm/nc-msacm-acmfiltertagenumcbw
 * @namespace Windows.Win32.Media.Audio
 * @charset Unicode
 */
export default struct ACMFILTERTAGENUMCBW {
    value : IntPtr

    __value {
        set {
            if (value is ACMFILTERTAGENUMCBW) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HACMDRIVERID} hadid Handle to the ACM driver identifier.
     * @param {Pointer<ACMFILTERTAGDETAILSW>} paftd Pointer to an [ACMFILTERTAGDETAILS](./nf-msacm-acmfiltertagdetails.md) structure that contains the enumerated filter tag details.
     * @param {Pointer} dwInstance Application-defined value specified in <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmfiltertagenum">acmFilterTagEnum</a>.
     * @param {Integer} fdwSupport 
     * @returns {BOOL} The callback function must return <b>TRUE</b> to continue enumeration or <b>FALSE</b> to stop enumeration.
     */
    Call(hadid, paftd, dwInstance, fdwSupport) {
        result := DllCall(this.value, HACMDRIVERID, hadid, ACMFILTERTAGDETAILSW.Ptr, paftd, IntPtr, dwInstance, UInt32, fdwSupport, BOOL)
        return result
    }

    /**
     * A ACMFILTERTAGENUMCBW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ACMFILTERTAGENUMCBW {
        /**
         * Creates a ACMFILTERTAGENUMCBW pointer that invokes the given AHK function when called.
         * @param {Func(HACMDRIVERID, ACMFILTERTAGDETAILSW, IntPtr, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HACMDRIVERID, ACMFILTERTAGDETAILSW.Ptr, IntPtr, UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
