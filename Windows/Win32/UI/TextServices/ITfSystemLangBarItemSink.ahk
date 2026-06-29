#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfMenu.ahk" { ITfMenu }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfSystemLangBarItemSink interface is implemented by a system language bar menu extension and used by a system language bar menu (host) to allow menu items to be added to an existing system language bar menu.
 * @remarks
 * A system language bar menu is an object on the language bar that supports menu items added to it by third-partyextensions. The system item must support the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfsource">ITfSource</a> interface and support the IID_ITfSystemLangBarItemSink identifier in its <b>ITfSource::AdviseSink</b> implementation. The system item should also implement the <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-itfsystemlangbaritem">ITfSystemLangBarItem</a> interface. The system item uses the <b>ITfSystemLangBarItemSink</b> interface to allow the extension to add its items.
 * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nn-ctfutb-itfsystemlangbaritemsink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfSystemLangBarItemSink extends IUnknown {
    /**
     * The interface identifier for ITfSystemLangBarItemSink
     * @type {Guid}
     */
    static IID := Guid("{1449d9ab-13cf-4687-aa3e-8d8b18574396}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfSystemLangBarItemSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        InitMenu     : IntPtr
        OnMenuSelect : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfSystemLangBarItemSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfSystemLangBarItemSink::InitMenu method
     * @param {ITfMenu} pMenu Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-itfmenu">ITfMenu</a> interface that the system language bar item uses to add items to the system language bar menu.
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
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itfsystemlangbaritemsink-initmenu
     */
    InitMenu(pMenu) {
        result := ComCall(3, this, "ptr", pMenu, "HRESULT")
        return result
    }

    /**
     * ITfSystemLangBarItemSink::OnMenuSelect method
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
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itfsystemlangbaritemsink-onmenuselect
     */
    OnMenuSelect(wID) {
        result := ComCall(4, this, "uint", wID, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfSystemLangBarItemSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitMenu := CallbackCreate(GetMethod(implObj, "InitMenu"), flags, 2)
        this.vtbl.OnMenuSelect := CallbackCreate(GetMethod(implObj, "OnMenuSelect"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitMenu)
        CallbackFree(this.vtbl.OnMenuSelect)
    }
}
