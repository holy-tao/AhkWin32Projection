#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\SIZE.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\ITfLangBarItem.ahk

/**
 * The ITfLangBarItemBitmapButton interface is implemented by a language bar bitmap button provider and is used by the language bar manager to obtain information specific to a bitmap button item on the language bar.
 * @remarks
 * 
 * A language bar bitmap button functions as a button item on the language bar that displays text and a small bitmap. The bitmap displayed for the item should not be larger than the size of a small icon. Obtain these dimensions by calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsystemmetrics">GetSystemMetrics</a> with SM_CXSMICON for the width and SM_CYSMICON for the height.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nn-ctfutb-itflangbaritembitmapbutton
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfLangBarItemBitmapButton extends ITfLangBarItem{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfLangBarItemBitmapButton
     * @type {Guid}
     */
    static IID => Guid("{a26a0525-3fae-4fa0-89ee-88a964f9f1b5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnClick", "InitMenu", "OnMenuSelect", "GetPreferredSize", "DrawBitmap", "GetText"]

    /**
     * 
     * @param {Integer} click 
     * @param {POINT} pt 
     * @param {Pointer<RECT>} prcArea 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembitmapbutton-onclick
     */
    OnClick(click, pt, prcArea) {
        result := ComCall(7, this, "int", click, "ptr", pt, "ptr", prcArea, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfMenu} pMenu 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembitmapbutton-initmenu
     */
    InitMenu(pMenu) {
        result := ComCall(8, this, "ptr", pMenu, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} wID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembitmapbutton-onmenuselect
     */
    OnMenuSelect(wID) {
        result := ComCall(9, this, "uint", wID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<SIZE>} pszDefault 
     * @returns {SIZE} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembitmapbutton-getpreferredsize
     */
    GetPreferredSize(pszDefault) {
        psz := SIZE()
        result := ComCall(10, this, "ptr", pszDefault, "ptr", psz, "HRESULT")
        return psz
    }

    /**
     * 
     * @param {Integer} bmWidth 
     * @param {Integer} bmHeight 
     * @param {Integer} dwFlags 
     * @param {Pointer<HBITMAP>} phbmp 
     * @param {Pointer<HBITMAP>} phbmpMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembitmapbutton-drawbitmap
     */
    DrawBitmap(bmWidth, bmHeight, dwFlags, phbmp, phbmpMask) {
        result := ComCall(11, this, "int", bmWidth, "int", bmHeight, "uint", dwFlags, "ptr", phbmp, "ptr", phbmpMask, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembitmapbutton-gettext
     */
    GetText() {
        pbstrText := BSTR()
        result := ComCall(12, this, "ptr", pbstrText, "HRESULT")
        return pbstrText
    }
}
