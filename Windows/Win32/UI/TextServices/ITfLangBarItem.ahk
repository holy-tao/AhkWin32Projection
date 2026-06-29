#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TF_LANGBARITEMINFO.ahk" { TF_LANGBARITEMINFO }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfLangBarItem interface is implemented by a language bar item provider and used by the language bar manager to obtain detailed information about the language bar item.
 * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nn-ctfutb-itflangbaritem
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfLangBarItem extends IUnknown {
    /**
     * The interface identifier for ITfLangBarItem
     * @type {Guid}
     */
    static IID := Guid("{73540d69-edeb-4ee9-96c9-23aa30b25916}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfLangBarItem interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetInfo          : IntPtr
        GetStatus        : IntPtr
        Show             : IntPtr
        GetTooltipString : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfLangBarItem.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfLangBarItem::GetInfo method
     * @returns {TF_LANGBARITEMINFO} Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/ns-ctfutb-tf_langbariteminfo">TF_LANGBARITEMINFO</a> structure that receives the language bar item information.
     * 
     * Starting with Windows 8, the item will be ignored if the structure does not include GUID_LBI_INPUTMODE. For more information, see [Third-party input method editors](https://docs.microsoft.com/en-us/windows/win32/w8cookbook/third-party-input-method-editors#manifestation) in the Compatibility cookbook for Windows.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritem-getinfo
     */
    GetInfo() {
        pInfo := TF_LANGBARITEMINFO()
        result := ComCall(3, this, TF_LANGBARITEMINFO.Ptr, pInfo, "HRESULT")
        return pInfo
    }

    /**
     * ITfLangBarItem::GetStatus method
     * @returns {Integer} Pointer to a <b>DWORD</b> that receives zero or a combination of one or more of the <a href="https://docs.microsoft.com/windows/desktop/TSF/tf-lbi-status--constants">TF_LBI_STATUS_*</a> values that indicate the current status of the item.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritem-getstatus
     */
    GetStatus() {
        result := ComCall(4, this, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * ITfLangBarItem::Show method
     * @remarks
     * The language bar item implementation should update its visible status by modifying the value returned from <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritem-getstatus">ITfLangBarItem::GetStatus</a> to include or exclude the TF_LBI_STATUS_HIDDEN status flag. The implementation then prompts language bar to obtain the new status value by calling <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritemsink-onupdate">ITfLangBarItemSink::OnUpdate</a> with TF_LBI_STATUS.
     * 
     * This method is only useful when the item has the TF_LBI_STYLE_HIDDENSTATUSCONTROL style. Without this style, only the language bar can show or hide the item.
     * @param {BOOL} fShow Contains a <b>BOOL</b> that indicates if the item should be shown or hidden. Contains a nonzero value if the item should be shown or zero otherwise.
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
     * The language bar item does not support this method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritem-show
     */
    Show(fShow) {
        result := ComCall(5, this, BOOL, fShow, "HRESULT")
        return result
    }

    /**
     * ITfLangBarItem::GetTooltipString method
     * @returns {BSTR} Pointer to a <b>BSTR</b> value that receives the tooltip string for the language bar item. This string must be allocated using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysallocstring">SysAllocString</a> function. The caller must free this buffer when it is no longer required by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-sysfreestring">SysFreeString</a>.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritem-gettooltipstring
     */
    GetTooltipString() {
        pbstrToolTip := BSTR.Owned()
        result := ComCall(6, this, BSTR.Ptr, pbstrToolTip, "HRESULT")
        return pbstrToolTip
    }

    Query(iid) {
        if (ITfLangBarItem.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetInfo := CallbackCreate(GetMethod(implObj, "GetInfo"), flags, 2)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 2)
        this.vtbl.Show := CallbackCreate(GetMethod(implObj, "Show"), flags, 2)
        this.vtbl.GetTooltipString := CallbackCreate(GetMethod(implObj, "GetTooltipString"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetInfo)
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.Show)
        CallbackFree(this.vtbl.GetTooltipString)
    }
}
