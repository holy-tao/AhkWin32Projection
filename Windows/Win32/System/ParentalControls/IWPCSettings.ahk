#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Accesses general settings for the user.
 * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nn-wpcapi-iwpcsettings
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class IWPCSettings extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWPCSettings
     * @type {Guid}
     */
    static IID => Guid("{8fdf6ca1-0189-47e4-b670-1a8a4636e340}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsLoggingRequired", "GetLastSettingsChangeTime", "GetRestrictions"]

    /**
     * 
     * @param {Pointer<BOOL>} pfRequired 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcsettings-isloggingrequired
     */
    IsLoggingRequired(pfRequired) {
        result := ComCall(3, this, "ptr", pfRequired, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SYSTEMTIME>} pTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcsettings-getlastsettingschangetime
     */
    GetLastSettingsChangeTime(pTime) {
        result := ComCall(4, this, "ptr", pTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwRestrictions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wpcapi/nf-wpcapi-iwpcsettings-getrestrictions
     */
    GetRestrictions(pdwRestrictions) {
        pdwRestrictionsMarshal := pdwRestrictions is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, pdwRestrictionsMarshal, pdwRestrictions, "HRESULT")
        return result
    }
}
