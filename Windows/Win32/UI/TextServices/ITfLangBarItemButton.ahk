#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\WindowsAndMessaging\HICON.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITfLangBarItem.ahk

/**
 * The ITfLangBarItemButton interface is implemented by a language bar button provider and used by the language bar manager to obtain information about a button item on the language bar.
 * @remarks
 * 
  * A language bar button functions as a pushbutton, toggle button, or a menu on the language bar.
  * 
  * If the button has the TF_LBI_STYLE_BTN_BUTTON style, the button acts as a pushbutton that the user can click with the mouse. When the user clicks the button, <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritembutton-onclick">ITfLangBarItemButton::OnClick</a> is called. <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritembutton-initmenu">ITfLangBarItemButton::InitMenu</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritembutton-onmenuselect">ITfLangBarItemButton::OnMenuSelect</a> are not used.
  * 
  * If the button has the TF_LBI_STYLE_BTN_TOGGLE style, the button functions similar to a check box that the user can select or deselect with the mouse. When the user clicks the button, <b>ITfLangBarItemButton::OnClick</b> is called. <b>ITfLangBarItemButton::InitMenu</b> and <b>ITfLangBarItemButton::OnMenuSelect</b> are not used.
  * 
  * If the button has the TF_LBI_STYLE_BTN_MENU style, the button acts like a top-level menu item. When the user clicks the button, <b>ITfLangBarItemButton::InitMenu</b> is called. If the user selects an item in the menu, <b>ITfLangBarItemButton::OnMenuSelect</b> is called. <b>ITfLangBarItemButton::OnClick</b> is not used.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nn-ctfutb-itflangbaritembutton
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfLangBarItemButton extends ITfLangBarItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfLangBarItemButton
     * @type {Guid}
     */
    static IID => Guid("{28c7f1d0-de25-11d2-afdd-00105a2799b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnClick", "InitMenu", "OnMenuSelect", "GetIcon", "GetText"]

    /**
     * 
     * @param {Integer} click 
     * @param {POINT} pt 
     * @param {Pointer<RECT>} prcArea 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembutton-onclick
     */
    OnClick(click, pt, prcArea) {
        result := ComCall(7, this, "int", click, "ptr", pt, "ptr", prcArea, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfMenu} pMenu 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembutton-initmenu
     */
    InitMenu(pMenu) {
        result := ComCall(8, this, "ptr", pMenu, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembutton-onmenuselect
     */
    OnMenuSelect(wID) {
        result := ComCall(9, this, "uint", wID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HICON} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembutton-geticon
     */
    GetIcon() {
        phIcon := HICON()
        result := ComCall(10, this, "ptr", phIcon, "HRESULT")
        return phIcon
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembutton-gettext
     */
    GetText() {
        pbstrText := BSTR()
        result := ComCall(11, this, "ptr", pbstrText, "HRESULT")
        return pbstrText
    }
}
