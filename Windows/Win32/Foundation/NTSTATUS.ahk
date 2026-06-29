#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\System\Diagnostics\Debug\FORMAT_MESSAGE_OPTIONS.ahk" { FORMAT_MESSAGE_OPTIONS }
#Import "..\System\LibraryLoader\Apis.ahk" { LoadLibraryW }
#Import "..\System\Diagnostics\Debug\Apis.ahk" { FormatMessageW }

/**
 * @namespace Windows.Win32.Foundation
 */
export default struct NTSTATUS {
    value : Int32

    __value {
        set {
            if (value is NTSTATUS) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Determine if the given NTSTATUS value idicates success
     *
     * @param {Integer} status the status to check
     * @returns {Boolean} 1 if the status indicates success, 0 otherwise
     */
    static IsSuccess(status) => status >= 0
    
    /**
     * Determine if the given NTSTATUS value is informational
     *
     * @param {Integer} status the status to check
     * @returns {Boolean} 1 if the status is informational, 0 otherwise
     */
    static IsInformational(status) => status >>> 30 == 1
    
    /**
     * Determine if the given NTSTATUS value is a warning
     *
     * @param {Integer} status the status to check
     * @returns {Boolean} 1 if the status indicates a warning, 0 otherwise
     */
    static IsWarning(status) => status >>> 30 == 2
    
    /**
     * Determine if the given NTSTATUS value idicates success
     *
     * @param {Integer} status the status to check
     * @returns {Boolean} 1 if the status indicates success, 0 otherwise
     */
    static IsError(status) => status >>> 30 == 3
    
    /**
     * Get the error message assosciated with the specified `NTSTATUS` code. Prefer this (or `NTSTATUS.Throw`) over
     * [`RtlNtStatusToDosError`](https://learn.microsoft.com/en-us/windows/win32/api/winternl/nf-winternl-rtlntstatustodoserror),
     * since many `NTSTATUS` error codes do not have equivalent `HRESULT` values. The conversion also
     * [may or may not be](https://stackoverflow.com/questions/25566234/how-to-convert-specific-ntstatus-value-to-the-hresult#comment57039828_25567826)
     * spotty.
     *
     * @param {Integer} status an `NTSTATUS` code
     * @returns {String} the error message for the provided status code
     */
    static GetErrorMessage(status) {
        hMod := LoadLibraryW("NTDLL.DLL")
        msgBuf := Buffer(1024, 0)
    
        chars := FormatMessageW(
            FORMAT_MESSAGE_OPTIONS.FORMAT_MESSAGE_FROM_HMODULE | FORMAT_MESSAGE_OPTIONS.FORMAT_MESSAGE_FROM_SYSTEM,
            hMod.value,
            status,
            0,
            msgBuf,
            msgBuf.Size // 2,
            0
        )
    
        return StrGet(msgBuf, chars, "UTF-16")
    }
    
    /**
     * Throw an `OSError` for the given `NTSTATUS` value. Note this function does not check to see
     * if the value is actually an error.
     *
     * @param {Integer} status the status
     */
    static Throw(status) {
        err := OSError(, -1)
    
        err.Number := status
        err.Message := Format("(NTSTATUS: 0x{1:X}) {2}", status, NTSTATUS.GetErrorMessage(status))
    
        throw err
    }
    
    /**
     * Throw an `OSError` for the given `NTSTATUS` value if it is an error
     *
     * @param {Integer} status the status
     */
    static ThrowIfError(status) {
        if(NTSTATUS.IsError(status))
            NTSTATUS.Throw(status)
    }
    
}
