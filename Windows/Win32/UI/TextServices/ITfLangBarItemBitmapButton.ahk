#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Graphics\Gdi\HBITMAP.ahk" { HBITMAP }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ITfMenu.ahk" { ITfMenu }
#Import ".\ITfLangBarItem.ahk" { ITfLangBarItem }
#Import ".\TfLBIClick.ahk" { TfLBIClick }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * The ITfLangBarItemBitmapButton interface is implemented by a language bar bitmap button provider and is used by the language bar manager to obtain information specific to a bitmap button item on the language bar.
 * @remarks
 * A language bar bitmap button functions as a button item on the language bar that displays text and a small bitmap. The bitmap displayed for the item should not be larger than the size of a small icon. Obtain these dimensions by calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsystemmetrics">GetSystemMetrics</a> with SM_CXSMICON for the width and SM_CYSMICON for the height.
 * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nn-ctfutb-itflangbaritembitmapbutton
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfLangBarItemBitmapButton extends ITfLangBarItem {
    /**
     * The interface identifier for ITfLangBarItemBitmapButton
     * @type {Guid}
     */
    static IID := Guid("{a26a0525-3fae-4fa0-89ee-88a964f9f1b5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfLangBarItemBitmapButton interfaces
    */
    struct Vtbl extends ITfLangBarItem.Vtbl {
        OnClick          : IntPtr
        InitMenu         : IntPtr
        OnMenuSelect     : IntPtr
        GetPreferredSize : IntPtr
        DrawBitmap       : IntPtr
        GetText          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfLangBarItemBitmapButton.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This method is not used if the button item does not have the TF_LBI_STYLE_BTN_BUTTON style. (ITfLangBarItemBitmapButton.OnClick)
     * @param {TfLBIClick} click Contains a <a href="https://docs.microsoft.com/windows/win32/api/ctfutb/ne-ctfutb-tflbiclick">TfLBIClick</a> value that indicates which mouse button was used to click the button.
     * @param {POINT} pt Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that contains the position, in screen coordinates, of the mouse cursor at the time of the click event.
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
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembitmapbutton-onclick
     */
    OnClick(click, pt, prcArea) {
        result := ComCall(7, this, TfLBIClick, click, POINT, pt, RECT.Ptr, prcArea, "HRESULT")
        return result
    }

    /**
     * This method is not used if the button item does not have the TF_LBI_STYLE_BTN_MENU style. (ITfLangBarItemBitmapButton.InitMenu)
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
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembitmapbutton-initmenu
     */
    InitMenu(pMenu) {
        result := ComCall(8, this, "ptr", pMenu, "HRESULT")
        return result
    }

    /**
     * This method is not used if the button item does not have the TF_LBI_STYLE_BTN_MENU style. (ITfLangBarItemBitmapButton.OnMenuSelect)
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
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembitmapbutton-onmenuselect
     */
    OnMenuSelect(wID) {
        result := ComCall(9, this, "uint", wID, "HRESULT")
        return result
    }

    /**
     * ITfLangBarItemBitmapButton::GetPreferredSize method
     * @remarks
     * The results of this method are not currently used. The bitmap for a bitmap button item should not be larger than the size of a small icon. Obtain these dimensions by calling <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-getsystemmetrics">GetSystemMetrics</a> with SM_CXSMICON for the width and SM_CYSMICON for the height.
     * @param {Pointer<SIZE>} pszDefault Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a> structure that contains the default size, in pixels, of the bitmap.
     * @returns {SIZE} Pointer to a SIZE structure that receives the preferred size, in pixels, of the bitmap. The <b>cy</b> member of this structure is ignored.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembitmapbutton-getpreferredsize
     */
    GetPreferredSize(pszDefault) {
        psz := SIZE()
        result := ComCall(10, this, SIZE.Ptr, pszDefault, SIZE.Ptr, psz, "HRESULT")
        return psz
    }

    /**
     * ITfLangBarItemBitmapButton::DrawBitmap method
     * @param {Integer} bmWidth Contains the width, in pixels, of the bitmap button item.
     * @param {Integer} bmHeight Contains the height, in pixels, of the bitmap button item.
     * @param {Integer} dwFlags Not currently used.
     * @param {Pointer<HBITMAP>} phbmp Pointer to an <b>HBITMAP</b> value that receives the handle of the bitmap drawn for the bitmap item.
     * @param {Pointer<HBITMAP>} phbmpMask Pointer to an <b>HBITMAP</b> value that receives the handle of the mask bitmap. This is a monochrome bitmap that functions as a mask for <i>phbmp</i>. Each black pixel in this bitmap will cause the corresponding pixel in <i>phbmp</i> to be displayed in its normal color. Each white pixel in this bitmap will cause the cooresponding pixel in <i>phbmp</i> to be displayed in the inverse of its normal color.
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
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembitmapbutton-drawbitmap
     */
    DrawBitmap(bmWidth, bmHeight, dwFlags, phbmp, phbmpMask) {
        result := ComCall(11, this, "int", bmWidth, "int", bmHeight, "uint", dwFlags, HBITMAP.Ptr, phbmp, HBITMAP.Ptr, phbmpMask, "HRESULT")
        return result
    }

    /**
     * ITfLangBarItemBitmapButton::GetText method
     * @returns {BSTR} Pointer to a <b>BSTR</b> value that receives the string for the language bar item. This string must be allocated using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> function. The caller must free this buffer when it is no longer required by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembitmapbutton-gettext
     */
    GetText() {
        pbstrText := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pbstrText, "HRESULT")
        return pbstrText
    }

    Query(iid) {
        if (ITfLangBarItemBitmapButton.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnClick := CallbackCreate(GetMethod(implObj, "OnClick"), flags, 4)
        this.vtbl.InitMenu := CallbackCreate(GetMethod(implObj, "InitMenu"), flags, 2)
        this.vtbl.OnMenuSelect := CallbackCreate(GetMethod(implObj, "OnMenuSelect"), flags, 2)
        this.vtbl.GetPreferredSize := CallbackCreate(GetMethod(implObj, "GetPreferredSize"), flags, 3)
        this.vtbl.DrawBitmap := CallbackCreate(GetMethod(implObj, "DrawBitmap"), flags, 6)
        this.vtbl.GetText := CallbackCreate(GetMethod(implObj, "GetText"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnClick)
        CallbackFree(this.vtbl.InitMenu)
        CallbackFree(this.vtbl.OnMenuSelect)
        CallbackFree(this.vtbl.GetPreferredSize)
        CallbackFree(this.vtbl.DrawBitmap)
        CallbackFree(this.vtbl.GetText)
    }
}
