#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\ITfMenu.ahk" { ITfMenu }
#Import ".\ITfLangBarItem.ahk" { ITfLangBarItem }
#Import "..\WindowsAndMessaging\HICON.ahk" { HICON }
#Import ".\TfLBIClick.ahk" { TfLBIClick }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * The ITfLangBarItemButton interface is implemented by a language bar button provider and used by the language bar manager to obtain information about a button item on the language bar.
 * @remarks
 * A language bar button functions as a pushbutton, toggle button, or a menu on the language bar.
 * 
 * If the button has the TF_LBI_STYLE_BTN_BUTTON style, the button acts as a pushbutton that the user can click with the mouse. When the user clicks the button, <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritembutton-onclick">ITfLangBarItemButton::OnClick</a> is called. <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritembutton-initmenu">ITfLangBarItemButton::InitMenu</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritembutton-onmenuselect">ITfLangBarItemButton::OnMenuSelect</a> are not used.
 * 
 * If the button has the TF_LBI_STYLE_BTN_TOGGLE style, the button functions similar to a check box that the user can select or deselect with the mouse. When the user clicks the button, <b>ITfLangBarItemButton::OnClick</b> is called. <b>ITfLangBarItemButton::InitMenu</b> and <b>ITfLangBarItemButton::OnMenuSelect</b> are not used.
 * 
 * If the button has the TF_LBI_STYLE_BTN_MENU style, the button acts like a top-level menu item. When the user clicks the button, <b>ITfLangBarItemButton::InitMenu</b> is called. If the user selects an item in the menu, <b>ITfLangBarItemButton::OnMenuSelect</b> is called. <b>ITfLangBarItemButton::OnClick</b> is not used.
 * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nn-ctfutb-itflangbaritembutton
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfLangBarItemButton extends ITfLangBarItem {
    /**
     * The interface identifier for ITfLangBarItemButton
     * @type {Guid}
     */
    static IID := Guid("{28c7f1d0-de25-11d2-afdd-00105a2799b5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfLangBarItemButton interfaces
    */
    struct Vtbl extends ITfLangBarItem.Vtbl {
        OnClick      : IntPtr
        InitMenu     : IntPtr
        OnMenuSelect : IntPtr
        GetIcon      : IntPtr
        GetText      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfLangBarItemButton.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * This method is not used if the button item does not have the TF_LBI_STYLE_BTN_BUTTON style. (ITfLangBarItemButton.OnClick)
     * @param {TfLBIClick} click Contains one of the <a href="https://docs.microsoft.com/windows/win32/api/ctfutb/ne-ctfutb-tflbiclick">TfLBIClick</a> values that indicate which mouse button was used to click the button.
     * @param {POINT} pt Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-point">POINT</a> structure that contains the position of the mouse cursor, in screen coordinates, at the time of the click event.
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
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembutton-onclick
     */
    OnClick(click, pt, prcArea) {
        result := ComCall(7, this, TfLBIClick, click, POINT, pt, RECT.Ptr, prcArea, "HRESULT")
        return result
    }

    /**
     * This method is not used if the button item does not have the TF_LBI_STYLE_BTN_MENU style. (ITfLangBarItemButton.InitMenu)
     * @param {ITfMenu} pMenu Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-itfmenu">ITfMenu</a> interface that the language bar button uses to add items to the menu that the language bar displays for the button.
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
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembutton-initmenu
     */
    InitMenu(pMenu) {
        result := ComCall(8, this, "ptr", pMenu, "HRESULT")
        return result
    }

    /**
     * This method is not used if the button item does not have the TF_LBI_STYLE_BTN_MENU style. (ITfLangBarItemButton.OnMenuSelect)
     * @param {Integer} wID Specifies the identifier of the menu item selected. This is the value passed for the <i>uId</i> parameter in <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itfmenu-addmenuitem">ITfMenu::AddMenuItem</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembutton-onmenuselect
     */
    OnMenuSelect(wID) {
        result := ComCall(9, this, "uint", wID, "HRESULT")
        return result
    }

    /**
     * ITfLangBarItemButton::GetIcon method
     * @remarks
     * The ideal size of the icon can be obtained by calling GetSystemMetrics(SM_CXSMICON) for the icon width and GetSystemMetrics(SM_CYSMICON) for the icon height.
     * 
     * If the button has the TF_LBI_STYLE_TEXTCOLORICON style, the icon obtained by this method should be a monochrome icon.
     * @returns {HICON} Pointer to an <b>HICON</b> value that receives the icon handle. Receives <b>NULL</b> if the button has no icon. The caller must free this icon when it is no longer required by calling <b>DestroyIcon</b>.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembutton-geticon
     */
    GetIcon() {
        phIcon := HICON.Owned()
        result := ComCall(10, this, HICON.Ptr, phIcon, "HRESULT")
        return phIcon
    }

    /**
     * ITfLangBarItemButton::GetText method
     * @returns {BSTR} Pointer to a <b>BSTR</b> that receives the string for the language bar item. This string must be allocated using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> function. The caller must free this buffer when it is no longer required by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritembutton-gettext
     */
    GetText() {
        pbstrText := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrText, "HRESULT")
        return pbstrText
    }

    Query(iid) {
        if (ITfLangBarItemButton.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnClick := CallbackCreate(GetMethod(implObj, "OnClick"), flags, 4)
        this.vtbl.InitMenu := CallbackCreate(GetMethod(implObj, "InitMenu"), flags, 2)
        this.vtbl.OnMenuSelect := CallbackCreate(GetMethod(implObj, "OnMenuSelect"), flags, 2)
        this.vtbl.GetIcon := CallbackCreate(GetMethod(implObj, "GetIcon"), flags, 2)
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
        CallbackFree(this.vtbl.GetIcon)
        CallbackFree(this.vtbl.GetText)
    }
}
