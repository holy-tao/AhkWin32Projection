#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAutomaticUpdatesSettings2.ahk

/**
 * Contains the settings that are available in Automatic Updates.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iautomaticupdatessettings3
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IAutomaticUpdatesSettings3 extends IAutomaticUpdatesSettings2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutomaticUpdatesSettings3
     * @type {Guid}
     */
    static IID => Guid("{b587f5c3-f57e-485f-bbf5-0d181c5cd0dc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_NonAdministratorsElevated", "put_NonAdministratorsElevated", "get_FeaturedUpdatesEnabled", "put_FeaturedUpdatesEnabled"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings3-get_nonadministratorselevated
     */
    get_NonAdministratorsElevated(retval) {
        result := ComCall(20, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings3-put_nonadministratorselevated
     */
    put_NonAdministratorsElevated(value) {
        result := ComCall(21, this, "short", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings3-get_featuredupdatesenabled
     */
    get_FeaturedUpdatesEnabled(retval) {
        result := ComCall(22, this, "ptr", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iautomaticupdatessettings3-put_featuredupdatesenabled
     */
    put_FeaturedUpdatesEnabled(value) {
        result := ComCall(23, this, "short", value, "HRESULT")
        return result
    }
}
