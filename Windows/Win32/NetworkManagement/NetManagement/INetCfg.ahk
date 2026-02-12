#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumNetCfgComponent.ahk
#Include .\INetCfgComponent.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 * @version v4.0.30319
 */
class INetCfg extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetCfg
     * @type {Guid}
     */
    static IID => Guid("{c0e8ae93-306e-11d1-aacf-00805fc1270e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Uninitialize", "Apply", "Cancel", "EnumComponents", "FindComponent", "QueryNetCfgClass"]

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
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api//content/roapi/nf-roapi-initialize
     */
    Initialize() {
        static pvReserved := 0 ;Reserved parameters must always be NULL

        result := ComCall(3, this, "ptr", pvReserved, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Uninitializes flat scroll bars for a particular window. The specified window will revert to standard scroll bars.
     * @remarks
     * <div class="alert"><b>Note</b>  Flat scroll bar functions are implemented in Comctl32.dll versions 4.71 through 5.82. Comctl32.dll versions 6.00 and higher do not support flat scroll bars.</div>
     * <div> </div>
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
     * @see https://learn.microsoft.com/windows/win32/api//content/commctrl/nf-commctrl-uninitializeflatsb
     */
    Uninitialize() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Provides a way to apply a control token to a security context.
     * @remarks
     * The <b>ApplyControlToken</b> function can modify the context based on this token. Among the tokens that this function can add to the client context are <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-schannel_alert_token">SCHANNEL_ALERT_TOKEN</a> and <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-schannel_session_token">SCHANNEL_SESSION_TOKEN</a>.
     * 
     * This function can be used to shut down the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security context</a> that underlies an existing Schannel connection. For information about how to do this, see <a href="https://docs.microsoft.com/windows/desktop/SecAuthN/shutting-down-an-schannel-connection">Shutting Down an Schannel Connection</a>.
     * @returns {HRESULT} If the function succeeds, the function returns SEC_E_OK.
     * 
     * If the function fails, it returns a nonzero error code. The following error code is one of the possible error codes that can be returned.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>SEC_E_UNSUPPORTED_FUNCTION</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This value is returned by Schannel kernel mode to indicate that this function is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api//content/sspi/nf-sspi-applycontroltoken
     */
    Apply() {
        result := ComCall(5, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Cancel Method (RDS)
     * @remarks
     * When you call **Cancel**, [ReadyState](./readystate-property-rds.md) is automatically set to **adcReadyStateLoaded**, and the [Recordset](../ado-api/recordset-object-ado.md) will be empty.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/ado/reference/rds-api/cancel-method-rds
     */
    Cancel() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidClass 
     * @returns {IEnumNetCfgComponent} 
     */
    EnumComponents(pguidClass) {
        result := ComCall(7, this, "ptr", pguidClass, "ptr*", &ppenumComponent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEnumNetCfgComponent(ppenumComponent)
    }

    /**
     * 
     * @param {PWSTR} pszwInfId 
     * @returns {INetCfgComponent} 
     */
    FindComponent(pszwInfId) {
        pszwInfId := pszwInfId is String ? StrPtr(pszwInfId) : pszwInfId

        result := ComCall(8, this, "ptr", pszwInfId, "ptr*", &pComponent := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return INetCfgComponent(pComponent)
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidClass 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     */
    QueryNetCfgClass(pguidClass, riid) {
        result := ComCall(9, this, "ptr", pguidClass, "ptr", riid, "ptr*", &ppvObject := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ppvObject
    }
}
