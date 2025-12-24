#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that set and retrieve information about a computer's default sharing settings for the Users (C:\Users) or Public (C:\Users\Public) folder. Also exposes a set of methods that allow control of printer sharing.
 * @remarks
 * 
 * <h3><a id="When_to_Implement"></a><a id="when_to_implement"></a><a id="WHEN_TO_IMPLEMENT"></a>When to Implement</h3>
 * An implementation of this interface is included in the <b>CSharingConfiguration</b> class. Third parties do not provide their own implementation.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-isharingconfigurationmanager
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ISharingConfigurationManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISharingConfigurationManager
     * @type {Guid}
     */
    static IID => Guid("{b4cd448a-9c86-4466-9201-2e62105b87ae}")

    /**
     * The class identifier for SharingConfigurationManager
     * @type {Guid}
     */
    static CLSID => Guid("{49f371e1-8c5c-4d9c-9a3b-54a6827f513c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateShare", "DeleteShare", "ShareExists", "GetSharePermissions", "SharePrinters", "StopSharingPrinters", "ArePrintersShared"]

    /**
     * Shares the Users or Public folder. If the folder is already shared, this method updates its sharing status.
     * @param {Integer} dsid Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-def_share_id">DEF_SHARE_ID</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-def_share_id">DEF_SHARE_ID</a> values that indicates the folder to share or update.
     * @param {Integer} role Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-share_role">SHARE_ROLE</a></b>
     * 
     * One of the following <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-share_role">SHARE_ROLE</a> values that sets the access permissions of the share for the <i>Everyone</i> ACE. <b>CreateShare</b> accepts only these values.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns S_OK if successful, or an error value otherwise, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>role</i> parameter specifies a value other than SHARE_ROLE_READER or SHARE_ROLE_CO_OWNER.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-isharingconfigurationmanager-createshare
     */
    CreateShare(dsid, role) {
        result := ComCall(3, this, "int", dsid, "int", role, "HRESULT")
        return result
    }

    /**
     * Removes sharing from either the Users or Public folder.
     * @param {Integer} dsid Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-def_share_id">DEF_SHARE_ID</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-def_share_id">DEF_SHARE_ID</a> values that specifies the folder to no longer share.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-isharingconfigurationmanager-deleteshare
     */
    DeleteShare(dsid) {
        result := ComCall(4, this, "int", dsid, "HRESULT")
        return result
    }

    /**
     * Queries whether the Users or Public folder is shared.
     * @param {Integer} dsid Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-def_share_id">DEF_SHARE_ID</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-def_share_id">DEF_SHARE_ID</a> values that indicates the folder whose sharing state is being checked.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * S_OK if the folder is shared; otherwise, S_FALSE.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-isharingconfigurationmanager-shareexists
     */
    ShareExists(dsid) {
        result := ComCall(5, this, "int", dsid, "HRESULT")
        return result
    }

    /**
     * Gets the access permissions currently associated with the User or Public folder for the Everyone access control entry (ACE).
     * @param {Integer} dsid Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-def_share_id">DEF_SHARE_ID</a></b>
     * 
     * One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-def_share_id">DEF_SHARE_ID</a> values that specifies the folder.
     * @returns {Integer} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-share_role">SHARE_ROLE</a>*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives one of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-share_role">SHARE_ROLE</a> values that indicate the sharing permissions set for the folder specified in the <i>dsid</i> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-isharingconfigurationmanager-getsharepermissions
     */
    GetSharePermissions(dsid) {
        result := ComCall(6, this, "int", dsid, "int*", &pRole := 0, "HRESULT")
        return pRole
    }

    /**
     * Shares all local printers connected to a computer, enabling them to be discovered by other computers on the network.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-isharingconfigurationmanager-shareprinters
     */
    SharePrinters() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * Stops sharing all local, shared printers connected to a computer.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-isharingconfigurationmanager-stopsharingprinters
     */
    StopSharingPrinters() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * Determines whether any printers connected to this computer are shared.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * Returns standard HRESULT values, including the following:
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Shared printers were detected.
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
     * No shared printers were found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No printers capable of being shared were found.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-isharingconfigurationmanager-areprintersshared
     */
    ArePrintersShared() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
