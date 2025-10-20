#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IHomePageSetting extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHomePageSetting
     * @type {Guid}
     */
    static IID => Guid("{fdfc244f-18fa-4ff2-b08e-1d618f3ffbe4}")

    /**
     * The class identifier for HomePageSetting
     * @type {Guid}
     */
    static CLSID => Guid("{374cede0-873a-4c4f-bc86-bcc8cf5116a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetHomePage", "IsHomePage", "SetHomePageToBrowserDefault"]

    /**
     * 
     * @param {HWND} hwnd 
     * @param {PWSTR} homePageUri 
     * @param {PWSTR} brandingMessage 
     * @returns {HRESULT} 
     */
    SetHomePage(hwnd, homePageUri, brandingMessage) {
        hwnd := hwnd is Win32Handle ? NumGet(hwnd, "ptr") : hwnd
        homePageUri := homePageUri is String ? StrPtr(homePageUri) : homePageUri
        brandingMessage := brandingMessage is String ? StrPtr(brandingMessage) : brandingMessage

        result := ComCall(3, this, "ptr", hwnd, "ptr", homePageUri, "ptr", brandingMessage, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} uri 
     * @param {Pointer<BOOL>} isDefault 
     * @returns {HRESULT} 
     */
    IsHomePage(uri, isDefault) {
        uri := uri is String ? StrPtr(uri) : uri

        result := ComCall(4, this, "ptr", uri, "ptr", isDefault, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    SetHomePageToBrowserDefault() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
