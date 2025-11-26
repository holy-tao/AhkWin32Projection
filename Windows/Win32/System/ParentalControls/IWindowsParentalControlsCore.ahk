#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWPCSettings.ahk
#Include .\IWPCWebSettings.ahk
#Include ..\Com\IUnknown.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nn-wpcapi-iwindowsparentalcontrolscore
 * @namespace Windows.Win32.System.ParentalControls
 * @version v4.0.30319
 */
class IWindowsParentalControlsCore extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsParentalControlsCore
     * @type {Guid}
     */
    static IID => Guid("{4ff40a0f-3f3b-4d7c-a41b-4f39d7b44d05}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetVisibility", "GetUserSettings", "GetWebSettings", "GetWebFilterInfo"]

    /**
     * Indicates the visibility of the Parental Controls user interface.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nf-wpcapi-iwindowsparentalcontrolscore-getvisibility
     */
    GetVisibility() {
        result := ComCall(3, this, "int*", &peVisibility := 0, "HRESULT")
        return peVisibility
    }

    /**
     * Retrieves a pointer to an interface for general settings for the specified user.
     * @param {PWSTR} pcszSID The SID string of the user. If this parameter is <b>NULL</b>, retrieve settings for the current user.
     * @returns {IWPCSettings} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wpcapi/nn-wpcapi-iwpcsettings">IWPCSettings</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nf-wpcapi-iwindowsparentalcontrolscore-getusersettings
     */
    GetUserSettings(pcszSID) {
        pcszSID := pcszSID is String ? StrPtr(pcszSID) : pcszSID

        result := ComCall(4, this, "ptr", pcszSID, "ptr*", &ppSettings := 0, "HRESULT")
        return IWPCSettings(ppSettings)
    }

    /**
     * Retrieves a pointer to an interface for web restrictions settings for the specified user.
     * @param {PWSTR} pcszSID The SID string of the user. If this parameter is <b>NULL</b>, retrieve settings for the current user.
     * @returns {IWPCWebSettings} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/wpcapi/nn-wpcapi-iwpcwebsettings">IWPCWebSettings</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nf-wpcapi-iwindowsparentalcontrolscore-getwebsettings
     */
    GetWebSettings(pcszSID) {
        pcszSID := pcszSID is String ? StrPtr(pcszSID) : pcszSID

        result := ComCall(5, this, "ptr", pcszSID, "ptr*", &ppSettings := 0, "HRESULT")
        return IWPCWebSettings(ppSettings)
    }

    /**
     * Retrieves the name and identifier of the currently active Web Content Filter.
     * @param {Pointer<PWSTR>} ppszName The name of the currently active Web Content Filter.
     * @returns {Guid} The GUID of the currently active Web Content Filter.
     * @see https://docs.microsoft.com/windows/win32/api//wpcapi/nf-wpcapi-iwindowsparentalcontrolscore-getwebfilterinfo
     */
    GetWebFilterInfo(ppszName) {
        ppszNameMarshal := ppszName is VarRef ? "ptr*" : "ptr"

        pguidID := Guid()
        result := ComCall(6, this, "ptr", pguidID, ppszNameMarshal, ppszName, "HRESULT")
        return pguidID
    }
}
