#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called by a replacement GINA DLL if Terminal Services is enabled. GINA calls this function to complete the setup of the Terminal Services client.
 * @remarks
 * GINA needs to call this function before starting the shell, so that the migration and setup will be complete before the shell starts, but after it has processed any logon scripts.
 * 
 * In order to use this function, the GINA DLL must specify the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/ns-winwlx-wlx_dispatch_version_1_3">WLX_DISPATCH_VERSION_1_3</a> structure in its call to 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxinitialize">WlxInitialize</a>, and set the Winlogon version to at least WLX_VERSION_1_3 in its 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nf-winwlx-wlxnegotiate">WlxNegotiate</a> call.
 * 
 * Other Winlogon support functions that may be called when Terminal Services is enabled are <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_disconnect">WlxDisconnect</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_query_client_credentials">WlxQueryClientCredentials</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/winwlx/nc-winwlx-pwlx_query_ic_credentials">WlxQueryInetConnectorCredentials</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/winwlx/nc-winwlx-pwlx_win31_migrate
 * @namespace Windows.Win32.Security.WinWlx
 * @version v4.0.30319
 */
class PWLX_WIN31_MIGRATE extends IUnknown {

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
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hWlx) {
        hWlx := hWlx is Win32Handle ? NumGet(hWlx, "ptr") : hWlx

        ComCall(3, this, "ptr", hWlx)
    }
}
