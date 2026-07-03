#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\ACMFORMATTAGDETAILSA.ahk" { ACMFORMATTAGDETAILSA }
#Import ".\HACMDRIVERID.ahk" { HACMDRIVERID }

/**
 * The acmFormatTagEnumCallback function specifies a callback function used with the acmFormatTagEnum function. The acmFormatTagEnumCallback name is a placeholder for an application-defined function name. (ACMFORMATTAGENUMCBA)
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmformattagenum">acmFormatTagEnum</a> function will return MMSYSERR_NOERROR (zero) if no format tags are to be enumerated. Moreover, the callback function will not be called.
 * 
 * The following functions should not be called from within the callback function: <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriveradd">acmDriverAdd</a>, <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriverremove">acmDriverRemove</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriverpriority">acmDriverPriority</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The msacm.h header defines ACMFORMATTAGENUMCB as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/msacm/nc-msacm-acmformattagenumcba
 * @namespace Windows.Win32.Media.Audio
 * @charset ANSI
 */
export default struct ACMFORMATTAGENUMCBA {
    value : IntPtr

    __value {
        set {
            if (value is ACMFORMATTAGENUMCBA) {
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
     * @param {Pointer<ACMFORMATTAGDETAILSA>} paftd Pointer to an [ACMFORMATTAGDETAILS](./nf-msacm-acmformattagdetails.md) structure that contains the enumerated format tag details.
     * @param {Pointer} dwInstance Application-defined value specified in the <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmformattagenum">acmFormatTagEnum</a> function.
     * @param {Integer} fdwSupport 
     * @returns {BOOL} The callback function must return <b>TRUE</b> to continue enumeration or <b>FALSE</b> to stop enumeration.
     */
    Call(hadid, paftd, dwInstance, fdwSupport) {
        result := DllCall(this.value, HACMDRIVERID, hadid, ACMFORMATTAGDETAILSA.Ptr, paftd, IntPtr, dwInstance, UInt32, fdwSupport, BOOL)
        return result
    }

    /**
     * A ACMFORMATTAGENUMCBA that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ACMFORMATTAGENUMCBA {
        /**
         * Creates a ACMFORMATTAGENUMCBA pointer that invokes the given AHK function when called.
         * @param {Func(HACMDRIVERID, ACMFORMATTAGDETAILSA, IntPtr, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HACMDRIVERID, ACMFORMATTAGDETAILSA.Ptr, IntPtr, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
