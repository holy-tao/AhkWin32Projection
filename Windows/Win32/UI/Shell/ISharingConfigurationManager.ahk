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
     * 
     * @param {Integer} dsid 
     * @param {Integer} role 
     * @returns {HRESULT} 
     */
    CreateShare(dsid, role) {
        result := ComCall(3, this, "int", dsid, "int", role, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dsid 
     * @returns {HRESULT} 
     */
    DeleteShare(dsid) {
        result := ComCall(4, this, "int", dsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dsid 
     * @returns {HRESULT} 
     */
    ShareExists(dsid) {
        result := ComCall(5, this, "int", dsid, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dsid 
     * @param {Pointer<Int32>} pRole 
     * @returns {HRESULT} 
     */
    GetSharePermissions(dsid, pRole) {
        result := ComCall(6, this, "int", dsid, "int*", pRole, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SharePrinters() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    StopSharingPrinters() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ArePrintersShared() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
