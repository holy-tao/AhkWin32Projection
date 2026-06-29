#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfLangBarItemSink interface is implemented by the language bar and used by a language bar item provider to notify the language bar of changes to a language bar item.
 * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nn-ctfutb-itflangbaritemsink
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfLangBarItemSink extends IUnknown {
    /**
     * The interface identifier for ITfLangBarItemSink
     * @type {Guid}
     */
    static IID := Guid("{57dbe1a0-de25-11d2-afdd-00105a2799b5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfLangBarItemSink interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnUpdate : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfLangBarItemSink.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfLangBarItemSink::OnUpdate method
     * @remarks
     * A language bar item should call this method when the internal state of the item changes. TSF will update the language bar user interface appropriately.
     * @param {Integer} dwFlags Contains a set of flags that indicate changes in the language bar item. This can be a combination of one or more of the <a href="https://docs.microsoft.com/windows/desktop/TSF/tf-lbi--constants">TF_LBI_*</a> values.
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
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemsink-onupdate
     */
    OnUpdate(dwFlags) {
        result := ComCall(3, this, "uint", dwFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfLangBarItemSink.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnUpdate := CallbackCreate(GetMethod(implObj, "OnUpdate"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnUpdate)
    }
}
