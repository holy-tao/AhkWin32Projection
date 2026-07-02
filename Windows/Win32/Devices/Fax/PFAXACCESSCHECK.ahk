#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * A fax client application calls the FaxAccessCheck function to query the fax access privileges of a user.
 * @remarks
 * The fax service is a secure service. Users must have certain access privileges to successfully call fax service functions. Call the <b>FaxAccessCheck</b> function to programmatically check a user's fax access permissions. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-checking-the-access-rights-of-users">Checking the Access Rights of Users</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-client-user-access-rights">Fax Client User Access Rights</a>.
 * 
 * The fax service administration application, a Microsoft Management Console (MMC) snap-in component, is also available for users to query and modify job access, port access, and global configuration data access privileges.
 * @see https://learn.microsoft.com/windows/win32/api/winfax/nc-winfax-pfaxaccesscheck
 * @namespace Windows.Win32.Devices.Fax
 */
export default struct PFAXACCESSCHECK {
    value : IntPtr

    __value {
        set {
            if (value is PFAXACCESSCHECK) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @param {HANDLE} FaxHandle Type: <b>HANDLE</b>
     * 
     * Specifies a fax server handle returned by a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function.
     * @param {Integer} AccessMask Type: <b>DWORD</b>
     * 
     * Specifies a <b>DWORD</b> variable that contains a set of bit flags defining a user's fax access permissions. This parameter can be one or more of the following generic access permissions: FAX_READ, FAX_WRITE, and FAX_ALL_ACCESS. It can also be one or more of the following specific access permissions:
     * 
     *                     
     * 
     * 
     * <ul>
     * <li>FAX_JOB_SUBMIT</li>
     * <li>FAX_JOB_QUERY</li>
     * <li>FAX_CONFIG_QUERY</li>
     * <li>FAX_CONFIG_SET</li>
     * <li>FAX_PORT_QUERY</li>
     * <li>FAX_PORT_SET</li>
     * <li>FAX_JOB_MANAGE</li>
     * </ul>
     * 
     * 
     * For a detailed description of these values, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-generic-fax-access-rights">Generic Fax Access Rights</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-specific-fax-access-rights">Specific Fax Access Rights</a>.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * If the user has the required permission, the return value is nonzero.
     * 
     * If the user does not have the required permission, the return value is zero, and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns ERROR_SUCCESS.
     * 
     * If the function fails, the return value is also zero, but <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns an error code other than ERROR_SUCCESS.
     */
    Call(FaxHandle, AccessMask) {
        result := DllCall(this.value, HANDLE, FaxHandle, UInt32, AccessMask, BOOL)
        return result
    }

    /**
     * A PFAXACCESSCHECK that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PFAXACCESSCHECK {
        /**
         * Creates a PFAXACCESSCHECK pointer that invokes the given AHK function when called.
         * @param {Func(HANDLE, UInt32) => BOOL} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 2)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 2 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [HANDLE, UInt32, BOOL])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
