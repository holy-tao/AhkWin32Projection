#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * The InitializeChangeNotify function is implemented by a password filter DLL. This function initializes the DLL.
 * @remarks
 * <b>InitializeChangeNotify</b> is called by the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/l-gly">Local Security Authority</a> (LSA) to verify that the password notification DLL is loaded and initialized.
 * 
 * This function must use the __stdcall calling convention, and must be exported by the DLL.
 * 
 * This function is called only for password filters that are installed and registered on a system.
 * 
 * Any process exception that is not handled within this function may cause security-related failures system-wide. Structured exception handling should be used when appropriate.
 * 
 * <table>
 * <tr>
 * <th>For information about</th>
 * <th>See</th>
 * </tr>
 * <tr>
 * <td>Programming issues when implementing a password filter DLL</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/password-filter-programming-considerations">Password Filter Programming Considerations</a>
 * </td>
 * </tr>
 * <tr>
 * <td>How to install and register your own password filter DLL</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/installing-and-registering-a-password-filter-dll">Installing and Registering a Password Filter DLL</a>
 * </td>
 * </tr>
 * <tr>
 * <td>The password filter DLL provided by Microsoft</td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/strong-password-enforcement-and-passfilt-dll">Strong Password Enforcement and Passfilt.dll</a>
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api/ntsecapi/nc-ntsecapi-psam_init_notification_routine
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct PSAM_INIT_NOTIFICATION_ROUTINE {
    value : IntPtr

    __value {
        set {
            if (value is PSAM_INIT_NOTIFICATION_ROUTINE) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    /**
     * 
     * @returns {BOOLEAN} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The password filter DLL is initialized.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The password filter DLL is not initialized.
     * 
     * </td>
     * </tr>
     * </table>
     */
    Call() {
        result := DllCall(this.value, BOOLEAN)
        return result
    }

    /**
     * A PSAM_INIT_NOTIFICATION_ROUTINE that invokes the given AHK function when called.
     * This callback is owned by the script and cleaned up automatically.
     */
    struct From extends PSAM_INIT_NOTIFICATION_ROUTINE {
        /**
         * Creates a PSAM_INIT_NOTIFICATION_ROUTINE pointer that invokes the given AHK function when called.
         * @param {Func() => BOOLEAN} fn the function to invoke.
         */
        __New(fn) {
            if (!HasMethod(fn, , 0)) {
                throw MethodError("Object of type " Type(fn) " is not callable with 0 parameters.", -1, fn)
            }
            this.value := CallbackCreate(fn, , [BOOLEAN])
        }

        __Delete() {
            if (this.value) {
                CallbackFree(this.value)
            }
        }
    }
}
