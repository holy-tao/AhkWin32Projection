#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A fax client application calls the FaxAccessCheck function to query the fax access privileges of a user.
 * @remarks
 * The fax service is a secure service. Users must have certain access privileges to successfully call fax service functions. Call the <b>FaxAccessCheck</b> function to programmatically check a user's fax access permissions. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-checking-the-access-rights-of-users">Checking the Access Rights of Users</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-fax-client-user-access-rights">Fax Client User Access Rights</a>.
 * 
 * The fax service administration application, a Microsoft Management Console (MMC) snap-in component, is also available for users to query and modify job access, port access, and global configuration data access privileges.
 * @see https://learn.microsoft.com/windows/win32/api//content/winfax/nc-winfax-pfaxaccesscheck
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class PFAXACCESSCHECK extends IUnknown {

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
     * @param {HANDLE} FaxHandle 
     * @param {Integer} AccessMask 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(FaxHandle, AccessMask) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        result := ComCall(3, this, "ptr", FaxHandle, "uint", AccessMask, "int")
        return result
    }
}
