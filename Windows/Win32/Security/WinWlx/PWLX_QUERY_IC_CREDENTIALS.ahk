#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by a replacement GINA DLL if Terminal Services is enabled. GINA calls this function to determine whether the terminal server is using Internet connector licensing and to retrieve credentials information.
 * @remarks
 * The GINA DLL is responsible for calling 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> to free the resources used by this structure when the structure is no longer needed.
 * 
 * In order to access this function, the GINA DLL must use the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/ns-winwlx-wlx_dispatch_version_1_3">WLX_DISPATCH_VERSION_1_3</a> structure, and set the Winlogon version to at least WLX_VERSION_1_3 in its 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxnegotiate">WlxNegotiate</a> call.
 * 
 * If Terminal Services is not using an Internet connector license, the GINA DLL must call 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_query_client_credentials">WlxQueryClientCredentials</a>.
 * 
 * Other Winlogon support functions that may be called when Terminal Services is enabled are <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_disconnect">WlxDisconnect</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_query_client_credentials">WlxQueryClientCredentials</a>,
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_query_terminal_services_data">WlxQueryTerminalServicesData</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_win31_migrate">WlxWin31Migrate</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/winwlx/nc-winwlx-pwlx_query_ic_credentials
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class PWLX_QUERY_IC_CREDENTIALS extends IUnknown {

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
     * @param {Pointer<WLX_CLIENT_CREDENTIALS_INFO_V1_0>} pCred 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(pCred) {
        result := ComCall(3, this, "ptr", pCred, "int")
        return result
    }
}
