#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SCE_LOG_ERR_LEVEL.ahk" { SCE_LOG_ERR_LEVEL }

/**
 * Logs messages to the configuration log file or analysis log file.
 * @see https://learn.microsoft.com/windows/win32/api/scesvc/nc-scesvc-pfsce_log_info
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 */
export default struct PFSCE_LOG_INFO {
    value : IntPtr

    __value {
        set {
            if (value is PFSCE_LOG_INFO) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {SCE_LOG_ERR_LEVEL} ErrLevel 
     * @param {Integer} Win32rc Specifies the Windows result code to log.
     * @param {Pointer<Integer>} pErrFmt Specifies the result format. This parameter uses the same format conventions as the C library function <b>printf</b>.
     * @returns {Integer} If the function succeeds, it returns SCESTATUS_SUCCESS; otherwise, an error code is returned.
     */
    Call(ErrLevel, Win32rc, pErrFmt) {
        pErrFmtMarshal := pErrFmt is VarRef ? "char*" : "ptr"

        result := DllCall(this.value, SCE_LOG_ERR_LEVEL, ErrLevel, UInt32, Win32rc, pErrFmtMarshal, pErrFmt, UInt32)
        return result
    }

    /**
     * A PFSCE_LOG_INFO that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFSCE_LOG_INFO {
        /**
         * Creates a PFSCE_LOG_INFO pointer that invokes the given AHK function when called.
         * @param {Func(SCE_LOG_ERR_LEVEL, UInt32, "char*") => UInt32} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 3)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 3 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, "cdecl", [SCE_LOG_ERR_LEVEL, UInt32, "char*", UInt32])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
