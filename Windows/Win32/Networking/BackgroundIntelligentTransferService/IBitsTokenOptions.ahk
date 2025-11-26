#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Use IBitsTokenOptions to associate and manage a pair of security tokens for a Background Intelligent Transfer Service (BITS) transfer job.
 * @see https://docs.microsoft.com/windows/win32/api//bits4_0/nn-bits4_0-ibitstokenoptions
 * @namespace Windows.Win32.Networking.BackgroundIntelligentTransferService
 * @version v4.0.30319
 */
class IBitsTokenOptions extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBitsTokenOptions
     * @type {Guid}
     */
    static IID => Guid("{9a2584c3-f7d2-457a-9a5e-22b67bffc7d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetHelperTokenFlags", "GetHelperTokenFlags", "SetHelperToken", "ClearHelperToken", "GetHelperTokenSid"]

    /**
     * Sets the usage flags for a token that is associated with a BITS transfer job.
     * @param {Integer} UsageFlags 
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bits4_0/nf-bits4_0-ibitstokenoptions-sethelpertokenflags
     */
    SetHelperTokenFlags(UsageFlags) {
        result := ComCall(3, this, "uint", UsageFlags, "HRESULT")
        return result
    }

    /**
     * Returns the usage flags for a token that is associated with a BITS transfer job.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//bits4_0/nf-bits4_0-ibitstokenoptions-gethelpertokenflags
     */
    GetHelperTokenFlags() {
        result := ComCall(4, this, "uint*", &pFlags := 0, "HRESULT")
        return pFlags
    }

    /**
     * Sets the helper token to impersonate the token of the COM client.
     * @returns {HRESULT} The following value might be returned:
     * 
     * <table>
     * <tr>
     * <th>Return code/value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>CO_E_FAILEDTOIMPERSONATE</b></dt>
     * <dt>0x80010123</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * COM settings on the client do not allow impersonate-level access to the client token.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ACCESSDENIED</b></dt>
     * <dt>0x80070005</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <ul>
     * <li>In versions prior to Windows 10, version 1607, the job is not owned by an administrator. In those versions of Windows, only administrator-owned jobs may set helper tokens.
     * </li>
     * <li>In Windows 10, version 1607 and newer versions, this error indicates that the helper token has administrator privileges, but the caller does not have administrator privileges.</li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//bits4_0/nf-bits4_0-ibitstokenoptions-sethelpertoken
     */
    SetHelperToken() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Discards the helper token, and does not change the usage flags.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//bits4_0/nf-bits4_0-ibitstokenoptions-clearhelpertoken
     */
    ClearHelperToken() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Returns the SID of the helper token if one is set.
     * @returns {PWSTR} Returns the SID that is retrieved from the <i>TokenInformation</i> parameter of the <a href="https://docs.microsoft.com/windows/win32/api/securitybaseapi/nf-securitybaseapi-gettokeninformation">GetTokenInformation</a> function.  If no SID is retrieved, this parameter is set to <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//bits4_0/nf-bits4_0-ibitstokenoptions-gethelpertokensid
     */
    GetHelperTokenSid() {
        result := ComCall(7, this, "ptr*", &pSid := 0, "HRESULT")
        return pSid
    }
}
