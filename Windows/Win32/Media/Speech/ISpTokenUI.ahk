#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class ISpTokenUI extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISpTokenUI
     * @type {Guid}
     */
    static IID => Guid("{f8e690f0-39cb-4843-b8d7-c84696e1119d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["IsUISupported", "DisplayUI"]

    /**
     * 
     * @param {PWSTR} pszTypeOfUI 
     * @param {Pointer<Void>} pvExtraData 
     * @param {Integer} cbExtraData 
     * @param {IUnknown} punkObject 
     * @param {Pointer<BOOL>} pfSupported 
     * @returns {HRESULT} 
     */
    IsUISupported(pszTypeOfUI, pvExtraData, cbExtraData, punkObject, pfSupported) {
        pszTypeOfUI := pszTypeOfUI is String ? StrPtr(pszTypeOfUI) : pszTypeOfUI

        result := ComCall(3, this, "ptr", pszTypeOfUI, "ptr", pvExtraData, "uint", cbExtraData, "ptr", punkObject, "ptr", pfSupported, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hwndParent 
     * @param {PWSTR} pszTitle 
     * @param {PWSTR} pszTypeOfUI 
     * @param {Pointer<Void>} pvExtraData 
     * @param {Integer} cbExtraData 
     * @param {ISpObjectToken} pToken 
     * @param {IUnknown} punkObject 
     * @returns {HRESULT} 
     */
    DisplayUI(hwndParent, pszTitle, pszTypeOfUI, pvExtraData, cbExtraData, pToken, punkObject) {
        hwndParent := hwndParent is Win32Handle ? NumGet(hwndParent, "ptr") : hwndParent
        pszTitle := pszTitle is String ? StrPtr(pszTitle) : pszTitle
        pszTypeOfUI := pszTypeOfUI is String ? StrPtr(pszTypeOfUI) : pszTypeOfUI

        result := ComCall(4, this, "ptr", hwndParent, "ptr", pszTitle, "ptr", pszTypeOfUI, "ptr", pvExtraData, "uint", cbExtraData, "ptr", pToken, "ptr", punkObject, "HRESULT")
        return result
    }
}
