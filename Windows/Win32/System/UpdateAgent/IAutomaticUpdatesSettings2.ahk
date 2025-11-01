#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAutomaticUpdatesSettings.ahk

/**
 * Contains the settings that are available in Automatic Updates.
 * @remarks
 * 
  * The <b>IAutomaticUpdatesSettings2</b> interface  may require you to update the Windows Update Agent (WUA). For more information, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/updating-the-windows-update-agent">Updating Windows Update Agent</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iautomaticupdatessettings2
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IAutomaticUpdatesSettings2 extends IAutomaticUpdatesSettings{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomaticUpdatesSettings2
     * @type {Guid}
     */
    static IID => Guid("{6abc136a-c3ca-4384-8171-cb2b1e59b8dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 17

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IncludeRecommendedUpdates", "put_IncludeRecommendedUpdates", "CheckPermission"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings2-get_includerecommendedupdates
     */
    get_IncludeRecommendedUpdates(retval) {
        result := ComCall(17, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings2-put_includerecommendedupdates
     */
    put_IncludeRecommendedUpdates(value) {
        result := ComCall(18, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} userType 
     * @param {Integer} permissionType 
     * @param {Pointer<VARIANT_BOOL>} userHasPermission 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings2-checkpermission
     */
    CheckPermission(userType, permissionType, userHasPermission) {
        result := ComCall(19, this, "int", userType, "int", permissionType, "ptr", userHasPermission, "HRESULT")
        return result
    }
}
