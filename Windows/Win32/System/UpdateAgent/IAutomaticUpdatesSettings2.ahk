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
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     */
    get_IncludeRecommendedUpdates(retval) {
        result := ComCall(17, this, "ptr", retval, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     */
    put_IncludeRecommendedUpdates(value) {
        result := ComCall(18, this, "short", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} userType 
     * @param {Integer} permissionType 
     * @param {Pointer<VARIANT_BOOL>} userHasPermission 
     * @returns {HRESULT} 
     */
    CheckPermission(userType, permissionType, userHasPermission) {
        result := ComCall(19, this, "int", userType, "int", permissionType, "ptr", userHasPermission, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
