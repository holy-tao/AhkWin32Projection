#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * Queries the subject interface packages (SIPs) listed in the registry to determine which SIP handles the file type. (pfnIsFileSupported)
 * @remarks
 * If the SIP supports the file type passed by <i>hfile</i>, the function returns <b>TRUE</b>, and sets <i>pgSubject</i> to the GUID that identifies the SIP for handling the file type.
 * 
 * Each SIP implements its own version of the function that determines whether the file type is supported. The specific name of the function may vary depending on the implementation of the SIP, but the signature of the function will match that of the [SIP_ADD_NEWPROVIDER](/windows/desktop/api/mssip/ns-mssip-sip_add_newprovider) structure.
 * @see https://learn.microsoft.com/windows/win32/api/mssip/nc-mssip-pfnisfilesupported
 * @namespace Windows.Win32.Security.Cryptography.Sip
 */
export default struct pfnIsFileSupported {
    value : IntPtr

    __value {
        set {
            if (value is pfnIsFileSupported) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} hFile A handle to the file.
     * @param {Pointer<Guid>} pgSubject The GUID that identifies the SIP that handles the file type.
     * @returns {BOOL} If the function succeeds, the function returns <b>TRUE</b>.
     * 
     * If the function fails, it returns <b>FALSE</b>. For extended error information, call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     */
    Call(hFile, pgSubject) {
        result := DllCall(this.value, HANDLE, hFile, Guid.Ptr, pgSubject, BOOL)
        return result
    }

    /**
     * A pfnIsFileSupported that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends pfnIsFileSupported {
        /**
         * Creates a pfnIsFileSupported pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, Guid) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, Guid.Ptr, BOOL])
        }

        __Delete() => CallbackFree(this.value)
    }
}
