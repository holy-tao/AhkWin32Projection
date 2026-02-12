#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\System\Com\IUnknown.ahk

/**
 * Implemented by a password filter DLL. The value returned by this function determines whether the new password is accepted by the system.
 * @remarks
 * Password change requests may be made when users specify a new password, accounts are created and when administrators override a password.
 * 
 * This function must use the __stdcall calling convention and must be exported by the DLL.
 * 
 * When the <b>PasswordFilter</b> routine is running, processing is blocked until the routine is finished. When appropriate, move any lengthy processing to a separate thread prior to returning from this routine.
 * 
 * This function is called only for <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">password filters</a> that are installed and registered on a system.
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
 * <td>The password filter DLL provided by Microsoft </td>
 * <td>
 * <a href="https://docs.microsoft.com/windows/desktop/SecMgmt/strong-password-enforcement-and-passfilt-dll">Strong Password Enforcement and Passfilt.dll</a>
 * </td>
 * </tr>
 * </table>
 * @see https://learn.microsoft.com/windows/win32/api//content/ntsecapi/nc-ntsecapi-psam_password_filter_routine
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class PSAM_PASSWORD_FILTER_ROUTINE extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {Pointer<LSA_UNICODE_STRING>} AccountName 
     * @param {Pointer<LSA_UNICODE_STRING>} FullName 
     * @param {Pointer<LSA_UNICODE_STRING>} Password 
     * @param {BOOLEAN} SetOperation 
     * @returns {BOOLEAN} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(AccountName, FullName, Password, SetOperation) {
        result := ComCall(3, this, "ptr", AccountName, "ptr", FullName, "ptr", Password, "char", SetOperation, "char")
        return result
    }
}
