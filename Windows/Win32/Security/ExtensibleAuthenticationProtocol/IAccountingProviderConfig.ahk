#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class IAccountingProviderConfig extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAccountingProviderConfig
     * @type {Guid}
     */
    static IID => Guid("{66a2db18-d706-11d0-a37b-00c04fc9da04}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Uninitialize", "Configure", "Activate", "Deactivate"]

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @remarks
     * <b>Windows::Foundation::Initialize</b> is changed to create 
     *     ASTAs instead of classic STAs for the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a> 
     *     value <b>RO_INIT_SINGLETHREADED</b>. 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_SINGLETHREADED</b>) 
     *     is not supported for desktop applications and will return <b>CO_E_NOTSUPPORTED</b> if called 
     *     from a process other than a Windows Store app.
     * 
     * For Microsoft DirectX applications, you must initialize the initial thread by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * 
     * For an out-of-process EXE server,  you must initialize the initial thread of the server by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * @param {PWSTR} pszMachineName 
     * @returns {Pointer} 
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize(pszMachineName) {
        pszMachineName := pszMachineName is String ? StrPtr(pszMachineName) : pszMachineName

        result := ComCall(3, this, "ptr", pszMachineName, "ptr*", &puConnectionParam := 0, "HRESULT")
        return puConnectionParam
    }

    /**
     * Uninitializes flat scroll bars for a particular window. The specified window will revert to standard scroll bars.
     * @remarks
     * <div class="alert"><b>Note</b>  Flat scroll bar functions are implemented in Comctl32.dll versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do not support flat scroll bars.</div>
     * <div> </div>
     * @param {Pointer} uConnectionParam 
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HRESULT</a></b>
     * 
     * Returns one of the following values. 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the window's scroll bars is currently in use. The operation cannot be completed at this time. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The window does not have flat scroll bars initialized. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was successful. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/commctrl/nf-commctrl-uninitializeflatsb
     */
    Uninitialize(uConnectionParam) {
        result := ComCall(4, this, "ptr", uConnectionParam, "HRESULT")
        return result
    }

    /**
     * Configures the expert within the expert DLL.
     * @remarks
     * Network Monitor calls the **Configure** function with the current configuration of the expert, if one exists. The expert displays a dialog box, with which you can change any configurable item.
     * 
     * When *ppConfig* is passed in and Network Monitor does not have a configuration stored for the specified expert, the parameter value can be **NULL**. In this case, the **Configure** function assumes hard-coded default values (or, uses the startup information) to open the dialog box.
     * 
     * The configuration data can also be **NULL** when the **Configure** function returns, and a **NULL** was passed-in. This situation occurs when Network Monitor does not have a stored default, and the user presses **Cancel**.
     * 
     * The beginning of the [**EXPERTCONFIG**](expertconfig.md) data structure includes a Private section that stores the structure size information. The size of the **EXPERTCONFIG** structure should include the reserved **DWORD** length that appears at the beginning of the structure. For example, if your configuration data requires 20 bytes of storage space, allocate 24 bytes to store the data. If a *ppConfig* is **NULL**, the **Configure** function calls the [**ExpertAllocMemory**](expertallocmemory.md) function to allocate a new configuration that is the correct size. If the buffer is not enough to hold the expert data, the expert should call the [**ExpertReallocMemory**](expertreallocmemory.md) function.
     * @param {Pointer} uConnectionParam 
     * @param {HWND} _hWnd 
     * @param {Integer} dwFlags 
     * @param {Pointer} uReserved1 
     * @param {Pointer} uReserved2 
     * @returns {HRESULT} If the function is successful (that is, if a current configuration exists), the return value is **TRUE**.
     * 
     * If the function is unsuccessful, the return value is **FALSE**.
     * @see https://learn.microsoft.com/windows/win32/NetMon2/configure
     */
    Configure(uConnectionParam, _hWnd, dwFlags, uReserved1, uReserved2) {
        _hWnd := _hWnd is Win32Handle ? NumGet(_hWnd, "ptr") : _hWnd

        result := ComCall(5, this, "ptr", uConnectionParam, "ptr", _hWnd, "uint", dwFlags, "ptr", uReserved1, "ptr", uReserved2, "HRESULT")
        return result
    }

    /**
     * The ActivateActCtx function activates the specified activation context.
     * @remarks
     * The <i>lpCookie</i> parameter is later passed to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-deactivateactctx">DeactivateActCtx</a>, which verifies the pairing of calls to 
     * <b>ActivateActCtx</b> and 
     * <b>DeactivateActCtx</b> and ensures that the appropriate activation context is being deactivated. This is done because the deactivation of activation contexts must occur in the reverse order of activation.
     * 
     * The activation of activation contexts can be understood as pushing an activation context onto a stack of activation contexts. The activation context you activate through this function  redirects any binding to DLLs, window classes, COM servers, type libraries, and mutexes for any side-by-side APIs you call.
     * 
     * The top item of an activation context stack is the active, default-activation context of the current thread. If a null activation context handle is pushed onto the stack, thereby activating it, the default settings in the original manifest override all activation contexts that are lower on the stack.
     * @param {Pointer} uConnectionParam 
     * @param {Pointer} uReserved1 
     * @param {Pointer} uReserved2 
     * @returns {HRESULT} If the function succeeds, it returns <b>TRUE</b>. Otherwise, it returns <b>FALSE</b>.
     * 
     * This function sets errors that can be retrieved by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. For an example, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/retrieving-the-last-error-code">Retrieving the Last-Error Code</a>. For a complete list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-activateactctx
     */
    Activate(uConnectionParam, uReserved1, uReserved2) {
        result := ComCall(6, this, "ptr", uConnectionParam, "ptr", uReserved1, "ptr", uReserved2, "HRESULT")
        return result
    }

    /**
     * The DeactivateActCtx function deactivates the activation context corresponding to the specified cookie.
     * @remarks
     * The deactivation of activation contexts must occur in the reverse order of activation. It can be understood as popping an activation context from a stack.
     * @param {Pointer} uConnectionParam 
     * @param {Pointer} uReserved1 
     * @param {Pointer} uReserved2 
     * @returns {HRESULT} If the function succeeds, it returns <b>TRUE</b>. Otherwise, it returns <b>FALSE</b>.
     * 
     * This function sets errors that can be retrieved by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. For an example, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/retrieving-the-last-error-code">Retrieving the Last-Error Code</a>. For a complete list of error codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">System Error Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winbase/nf-winbase-deactivateactctx
     */
    Deactivate(uConnectionParam, uReserved1, uReserved2) {
        result := ComCall(7, this, "ptr", uConnectionParam, "ptr", uReserved1, "ptr", uReserved2, "HRESULT")
        return result
    }
}
