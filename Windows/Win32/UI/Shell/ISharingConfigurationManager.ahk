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
     * 
     * @param {Integer} dsid 
     * @param {Integer} role 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isharingconfigurationmanager-createshare
     */
    CreateShare(dsid, role) {
        result := ComCall(3, this, "int", dsid, "int", role, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isharingconfigurationmanager-deleteshare
     */
    DeleteShare(dsid) {
        result := ComCall(4, this, "int", dsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dsid 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isharingconfigurationmanager-shareexists
     */
    ShareExists(dsid) {
        result := ComCall(5, this, "int", dsid, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dsid 
     * @param {Pointer<Integer>} pRole 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isharingconfigurationmanager-getsharepermissions
     */
    GetSharePermissions(dsid, pRole) {
        pRoleMarshal := pRole is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "int", dsid, pRoleMarshal, pRole, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isharingconfigurationmanager-shareprinters
     */
    SharePrinters() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isharingconfigurationmanager-stopsharingprinters
     */
    StopSharingPrinters() {
        result := ComCall(8, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-isharingconfigurationmanager-areprintersshared
     */
    ArePrintersShared() {
        result := ComCall(9, this, "HRESULT")
        return result
    }
}
