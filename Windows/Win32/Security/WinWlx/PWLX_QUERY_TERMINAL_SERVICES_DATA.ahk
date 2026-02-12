#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by GINA to retrieve Terminal Services user configuration information after a user has logged on.
 * @remarks
 * <b>WlxQueryTerminalServicesData</b> should be called from within GINA's implementation of 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxloggedoutsas">WlxLoggedOutSAS</a> after a user has been authenticated.
 * 
 * In order to access this function, the GINA DLL must use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/ns-winwlx-wlx_dispatch_version_1_3">WLX_DISPATCH_VERSION_1_3</a> structure, and set the Winlogon version to at least WLX_VERSION_1_3 in its 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxnegotiate">WlxNegotiate</a> call.
 * @see https://learn.microsoft.com/windows/win32/api//content/winwlx/nc-winwlx-pwlx_query_terminal_services_data
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class PWLX_QUERY_TERMINAL_SERVICES_DATA extends IUnknown {

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
     * @param {HANDLE} hWlx 
     * @param {Pointer<WLX_TERMINAL_SERVICES_DATA>} pTSData 
     * @param {PWSTR} UserName 
     * @param {PWSTR} Domain 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hWlx, pTSData, UserName, Domain) {
        hWlx := hWlx is Win32Handle ? NumGet(hWlx, "ptr") : hWlx
        UserName := UserName is String ? StrPtr(UserName) : UserName
        Domain := Domain is String ? StrPtr(Domain) : Domain

        result := ComCall(3, this, "ptr", hWlx, "ptr", pTSData, "ptr", UserName, "ptr", Domain, "uint")
        return result
    }
}
