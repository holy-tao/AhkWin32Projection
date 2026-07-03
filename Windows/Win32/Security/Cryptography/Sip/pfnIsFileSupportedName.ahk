#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Queries the subject interface packages (SIPs) listed in the registry to determine which SIP handles the file type. (pfnIsFileSupportedName)
 * @remarks
 * If the SIP supports the file type passed by <i>hfile</i>, the function returns <b>TRUE</b>, and sets <i>pgSubject</i> to the GUID that identifies the SIP for handling the file type.
 * 
 * Each SIP implements its own version of the function that determines if the file type is supported. The specific name of the function may vary depending on the implementation of the SIP, but the signature of the function will match that of the [SIP_ADD_NEWPROVIDER](/windows/desktop/api/mssip/ns-mssip-sip_add_newprovider) structure.
 * 
 * SIPs must support a limited set of file types and file extensions. The fileSupportedName function must check that the provided file matches one of the file extensions supported by the SIP.  For instance, the WSH SIP supports only the following list of file extensions and checks that the file under validation is a member of the following list: .js, .jse, .vbe, .vbs, or .wsf.
 * @see https://learn.microsoft.com/windows/win32/api/mssip/nc-mssip-pfnisfilesupportedname
 * @namespace Windows.Win32.Security.Cryptography.Sip
 */
export default struct pfnIsFileSupportedName {
    value : IntPtr

    __value {
        set {
            if (value is pfnIsFileSupportedName) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {PWSTR} pwszFileName A pointer to a <b>null</b>-terminated string that contains the absolute path to the file to be processed by the SIP.
     * @param {Pointer<Guid>} pgSubject The GUID identifying the SIP that handles the file type.
     * @returns {BOOL} The return value is <b>TRUE</b> if the function succeeds; <b>FALSE</b> if the function fails. If the function fails, call the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function to determine the reason for failure.
     */
    Call(pwszFileName, pgSubject) {
        pwszFileName := pwszFileName is String ? StrPtr(pwszFileName) : pwszFileName

        result := DllCall(this.value, "ptr", pwszFileName, Guid.Ptr, pgSubject, BOOL)
        return result
    }

    /**
     * A pfnIsFileSupportedName that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pfnIsFileSupportedName {
        /**
         * Creates a pfnIsFileSupportedName pointer that invokes the given AHK function when called.
         * @param {Func(PWSTR, Guid) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [PWSTR, Guid.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
