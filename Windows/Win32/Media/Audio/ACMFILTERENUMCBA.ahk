#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\HACMDRIVERID.ahk" { HACMDRIVERID }
#Import ".\ACMFILTERDETAILSA.ahk" { ACMFILTERDETAILSA }

/**
 * The acmFilterEnumCallback function specifies a callback function used with the acmFilterEnum function. The acmFilterEnumCallback name is a placeholder for an application-defined function name. (ACMFILTERENUMCBA)
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
 * @see https://learn.microsoft.com/windows/win32/api/msacm/nc-msacm-acmfilterenumcba
 * @namespace Windows.Win32.Media.Audio
 * @charset ANSI
 */
export default struct ACMFILTERENUMCBA {
    value : IntPtr

    __value {
        set {
            if (value is ACMFILTERENUMCBA) {
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
     * @param {Pointer<ACMFILTERDETAILSA>} pafd Pointer to an [ACMFILTERDETAILS](./nf-msacm-acmfilterdetails.md) structure that contains the enumerated filter details for a filter tag.
     * @param {Pointer} dwInstance Application-defined value specified in <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmfilterenum">acmFilterEnum</a>.
     * @param {Integer} fdwSupport 
     * @returns {BOOL} The callback function must return <b>TRUE</b> to continue enumeration or <b>FALSE</b> to stop enumeration.
     */
    Call(hadid, pafd, dwInstance, fdwSupport) {
        result := DllCall(this.value, HACMDRIVERID, hadid, ACMFILTERDETAILSA.Ptr, pafd, IntPtr, dwInstance, UInt32, fdwSupport, BOOL)
        return result
    }

    /**
     * A ACMFILTERENUMCBA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ACMFILTERENUMCBA {
        /**
         * Creates a ACMFILTERENUMCBA pointer that invokes the given AHK function when called.
         * @param {Func(HACMDRIVERID, ACMFILTERDETAILSA, IntPtr, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HACMDRIVERID, ACMFILTERDETAILSA.Ptr, IntPtr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
