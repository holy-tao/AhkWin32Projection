#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\WindowsAndMessaging\HICON.ahk" { HICON }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfSystemLangBarItem interface is implemented by a system language bar menu and is used by a system language bar extension to modify the icon and/or tooltip string displayed for the menu.
 * @remarks
 * A system language bar menu is an object on the language bar that supports menu items added to it by third-partyextensions. The system item must support the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfsource">ITfSource</a> interface and support the IID_ITfSystemLangBarItemSink identifier in its <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfsource-advisesink">ITfSource::AdviseSink</a> implementation. The system item should also implement the <b>ITfSystemLangBarItem</b> interface. The system item uses the <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-itfsystemlangbaritemsink">ITfSystemLangBarItemSink</a> interface to enable the extension to add items.
 * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nn-ctfutb-itfsystemlangbaritem
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfSystemLangBarItem extends IUnknown {
    /**
     * The interface identifier for ITfSystemLangBarItem
     * @type {Guid}
     */
    static IID := Guid("{1e13e9ec-6b33-4d4a-b5eb-8a92f029f356}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfSystemLangBarItem interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetIcon          : IntPtr
        SetTooltipString : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfSystemLangBarItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfSystemLangBarItem::SetIcon method
     * @remarks
     * In response to this method, the system language bar menu should call <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritemsink-onupdate">ITfLangBarItemSink::OnUpdate</a> with TF_LBI_ICON to force the language bar to obtain the new icon.
     * @param {HICON} _hIcon Contains the handle to the new icon.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system language bar menu does not allow its icon to be modified.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itfsystemlangbaritem-seticon
     */
    SetIcon(_hIcon) {
        result := ComCall(3, this, HICON, _hIcon, "HRESULT")
        return result
    }

    /**
     * ITfSystemLangBarItem::SetTooltipString method
     * @remarks
     * In response to this method, the system language bar menu should call <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritemsink-onupdate">ITfLangBarItemSink::OnUpdate</a> with TF_LBI_TOOLTIP to force the language bar to obtain the new tooltip text.
     * @param {PWSTR} pchToolTip A string that appears as a tooltip.
     * @param {Integer} cch Size, in characters, of the string.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The tooltip string for the system language bar menu cannot be modified.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itfsystemlangbaritem-settooltipstring
     */
    SetTooltipString(pchToolTip, cch) {
        pchToolTip := pchToolTip is String ? StrPtr(pchToolTip) : pchToolTip

        result := ComCall(4, this, "ptr", pchToolTip, "uint", cch, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfSystemLangBarItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetIcon := CallbackCreate(GetMethod(implObj, "SetIcon"), flags, 2)
        this.vtbl.SetTooltipString := CallbackCreate(GetMethod(implObj, "SetTooltipString"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetIcon)
        CallbackFree(this.vtbl.SetTooltipString)
    }
}
