#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ACMFILTERDETAILSW.ahk" { ACMFILTERDETAILSW }
#Import ".\HACMDRIVERID.ahk" { HACMDRIVERID }

/**
 * The ACMFILTERENUMCBW (Unicode) callback function specifies a callback function used with the acmFilterEnum function.
 * @remarks
 * The <b>acmFilterEnum</b> function will return MMSYSERR_NOERROR (zero) if no filters are to be enumerated. Moreover, the callback function will not be called.
 * 
 * The following functions should not be called from within the callback function: <b>acmDriverAdd</b>, <b>acmDriverRemove</b>, and <b>acmDriverPriority</b>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The msacm.h header defines ACMFILTERENUMCB as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/msacm/nc-msacm-acmfilterenumcbw
 * @namespace Windows.Win32.Media.Audio
 * @charset Unicode
 */
export default struct ACMFILTERENUMCBW {
    value : IntPtr

    __value {
        set {
            if (value is ACMFILTERENUMCBW) {
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
     * @param {Pointer<ACMFILTERDETAILSW>} pafd Pointer to an [ACMFILTERDETAILS](./nf-msacm-acmfilterdetails.md) structure that contains the enumerated filter details for a filter tag.
     * @param {Pointer} dwInstance Application-defined value specified in <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmfilterenum">acmFilterEnum</a>.
     * @param {Integer} fdwSupport 
     * @returns {BOOL} The callback function must return <b>TRUE</b> to continue enumeration or <b>FALSE</b> to stop enumeration.
     */
    Call(hadid, pafd, dwInstance, fdwSupport) {
        result := DllCall(this.value, HACMDRIVERID, hadid, ACMFILTERDETAILSW.Ptr, pafd, IntPtr, dwInstance, UInt32, fdwSupport, BOOL)
        return result
    }

    /**
     * A ACMFILTERENUMCBW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ACMFILTERENUMCBW {
        /**
         * Creates a ACMFILTERENUMCBW pointer that invokes the given AHK function when called.
         * @param {Func(HACMDRIVERID, ACMFILTERDETAILSW, IntPtr, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HACMDRIVERID, ACMFILTERDETAILSW.Ptr, IntPtr, UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
