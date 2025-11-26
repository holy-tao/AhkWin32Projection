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
     * This method is not used if the button item does not have the TF_LBI_STYLE_BTN_BUTTON style.
     * @param {Integer} click Contains a <a href="https://docs.microsoft.com/windows/win32/api/ctfutb/ne-ctfutb-tflbiclick">TfLBIClick</a> value that indicates which mouse button was used to click the button.
     * @param {POINT} pt Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd162805(v=vs.85)">POINT</a> structure that contains the position, in screen coordinates, of the mouse cursor at the time of the click event.
     * @param {Pointer<RECT>} prcArea Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that contains the bounding rectangle, in screen coordinates, of the button.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itflangbaritembitmapbutton-onclick
     */
    OnClick(click, pt, prcArea) {
        result := ComCall(7, this, "int", click, "ptr", pt, "ptr", prcArea, "HRESULT")
        return result
    }

    /**
     * This method is not used if the button item does not have the TF_LBI_STYLE_BTN_MENU style.
     * @param {ITfMenu} pMenu Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-itfmenu">ITfMenu</a> interface that the language bar bitmap button uses to add items to the menu that the language bar displays for the button.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itflangbaritembitmapbutton-initmenu
     */
    InitMenu(pMenu) {
        result := ComCall(8, this, "ptr", pMenu, "HRESULT")
        return result
    }

    /**
     * This method is not used if the button item does not have the TF_LBI_STYLE_BTN_MENU style.
     * @param {Integer} wID Specifies the identifier of the menu item selected. This is the value passed for <i>uId</i> in <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itfmenu-addmenuitem">ITfMenu::AddMenuItem</a>.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itflangbaritembitmapbutton-onmenuselect
     */
    OnMenuSelect(wID) {
        result := ComCall(9, this, "uint", wID, "HRESULT")
        return result
    }

    /**
     * ITfLangBarItemBitmapButton::GetPreferredSize method
     * @param {Pointer<SIZE>} pszDefault Pointer to a <a href="https://docs.microsoft.com/previous-versions/dd145106(v=vs.85)">SIZE</a> structure that contains the default size, in pixels, of the bitmap.
     * @returns {SIZE} Pointer to a SIZE structure that recevies the preferred size, in pixels, of the bitmap. The <b>cy</b> member of this structure is ignored.
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itflangbaritembitmapbutton-getpreferredsize
     */
    GetPreferredSize(pszDefault) {
        psz := SIZE()
        result := ComCall(10, this, "ptr", pszDefault, "ptr", psz, "HRESULT")
        return psz
    }

    /**
     * ITfLangBarItemBitmapButton::DrawBitmap method
     * @param {Integer} bmWidth Contains the width, in pixels, of the bitmap button item.
     * @param {Integer} bmHeight Contains the height, in pixels, of the bitmap button item.
     * @param {Integer} dwFlags Not currently used.
     * @param {Pointer<HBITMAP>} phbmp Pointer to an <b>HBITMAP</b> value that receives the handle of the bitmap drawn for the bitmap item.
     * @param {Pointer<HBITMAP>} phbmpMask Pointer to an <b>HBITMAP</b> value that receives the handle of the mask bitmap. This is a monochrome bitmap that functions as a mask for <i>phbmp</i>. Each black pixel in this bitmap will cause the cooresponding pixel in <i>phbmp</i> to be displayed in its normal color. Each white pixel in this bitmap will cause the cooresponding pixel in <i>phbmp</i> to be displayed in the inverse of its normal color.
     * 
     * To display the bitmap without color conversion, create a monochrome bitmap the same size as <i>phbmp</i> and set each pixel to black (RGB(0, 0, 0)).
     * @returns {HRESULT} This method can return one of these values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was successful.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One or more parameters are invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A memory allocation failure occurred.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itflangbaritembitmapbutton-drawbitmap
     */
    DrawBitmap(bmWidth, bmHeight, dwFlags, phbmp, phbmpMask) {
        result := ComCall(11, this, "int", bmWidth, "int", bmHeight, "uint", dwFlags, "ptr", phbmp, "ptr", phbmpMask, "HRESULT")
        return result
    }

    /**
     * ITfLangBarItemBitmapButton::GetText method
     * @returns {BSTR} Pointer to a <b>BSTR</b> value that receives the string for the language bar item. This string must be allocated using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> function. The caller must free this buffer when it is no longer required by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @see https://docs.microsoft.com/windows/win32/api//ctfutb/nf-ctfutb-itflangbaritembitmapbutton-gettext
     */
    GetText() {
        pbstrText := BSTR()
        result := ComCall(12, this, "ptr", pbstrText, "HRESULT")
        return pbstrText
    }
}
