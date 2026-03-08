#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk
#Include ..\System\LibraryLoader\Apis.ahk
#Include ..\System\Diagnostics\Debug\Apis.ahk
#Include ..\System\Diagnostics\Debug\FORMAT_MESSAGE_OPTIONS.ahk

/**
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class NTSTATUS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Value {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
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
        hMod := LibraryLoader.LoadLibraryW("NTDLL.DLL")
        msgBuf := Buffer(1024, 0)
    
        chars := Debug.FormatMessageW(
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
