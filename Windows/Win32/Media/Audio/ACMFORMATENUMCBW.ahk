#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\HACMDRIVERID.ahk" { HACMDRIVERID }
#Import ".\tACMFORMATDETAILSW.ahk" { tACMFORMATDETAILSW }

/**
 * The ACMFORMATENUMCBW (Unicode) callback function specifies a callback function used with the acmFormatEnum function.
 * @remarks
 * The <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmformatenum">acmFormatEnum</a> function will return MMSYSERR_NOERROR (zero) if no formats are to be enumerated. Moreover, the callback function will not be called.
 * 
 * The following functions should not be called from within the callback function: <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriveradd">acmDriverAdd</a>, <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriverremove">acmDriverRemove</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmdriverpriority">acmDriverPriority</a>.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The msacm.h header defines ACMFORMATENUMCB as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/msacm/nc-msacm-acmformatenumcbw
 * @namespace Windows.Win32.Media.Audio
 * @charset Unicode
 */
export default struct ACMFORMATENUMCBW {
    value : IntPtr

    __value {
        set {
            if (value is ACMFORMATENUMCBW) {
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
     * @param {Pointer<tACMFORMATDETAILSW>} pafd Pointer to an [ACMFORMATDETAILS](./nf-msacm-acmformatdetails.md) structure that contains the enumerated format details for a format tag.
     * @param {Pointer} dwInstance Application-defined value specified in the <a href="https://docs.microsoft.com/windows/desktop/api/msacm/nf-msacm-acmformatenum">acmFormatEnum</a> function.
     * @param {Integer} fdwSupport 
     * @returns {BOOL} The callback function must return <b>TRUE</b> to continue enumeration or <b>FALSE</b> to stop enumeration.
     */
    Call(hadid, pafd, dwInstance, fdwSupport) {
        result := DllCall(this.value, HACMDRIVERID, hadid, tACMFORMATDETAILSW.Ptr, pafd, IntPtr, dwInstance, UInt32, fdwSupport, BOOL)
        return result
    }

    /**
     * A ACMFORMATENUMCBW that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends ACMFORMATENUMCBW {
        /**
         * Creates a ACMFORMATENUMCBW pointer that invokes the given AHK function when called.
         * @param {Func(HACMDRIVERID, tACMFORMATDETAILSW, IntPtr, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 4)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 4 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HACMDRIVERID, tACMFORMATDETAILSW.Ptr, IntPtr, UInt32, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
