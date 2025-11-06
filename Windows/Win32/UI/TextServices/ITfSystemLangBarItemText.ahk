#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfSystemLangBarItemText interface is implemented by a system language bar and is used by a system language bar extension to modify the description displayed for the menu.
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nn-ctfutb-itfsystemlangbaritemtext
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfSystemLangBarItemText extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfSystemLangBarItemText
     * @type {Guid}
     */
    static IID => Guid("{5c4ce0e5-ba49-4b52-ac6b-3b397b4f701f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetItemText", "GetItemText"]

    /**
     * 
     * @param {PWSTR} pch 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itfsystemlangbaritemtext-setitemtext
     */
    SetItemText(pch, cch) {
        pch := pch is String ? StrPtr(pch) : pch

        result := ComCall(3, this, "ptr", pch, "uint", cch, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itfsystemlangbaritemtext-getitemtext
     */
    GetItemText() {
        pbstrText := BSTR()
        result := ComCall(4, this, "ptr", pbstrText, "HRESULT")
        return pbstrText
    }
}
