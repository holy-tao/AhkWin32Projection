#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ITfLangBarItemSink.ahk" { ITfLangBarItemSink }
#Import ".\ITfLangBarItem.ahk" { ITfLangBarItem }
#Import ".\IEnumTfLangBarItems.ahk" { IEnumTfLangBarItems }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\TF_LANGBARITEMINFO.ahk" { TF_LANGBARITEMINFO }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The ITfLangBarItemMgr interface is implemented by the language bar and used by a text service to manage items in the language bar.
 * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nn-ctfutb-itflangbaritemmgr
 * @namespace Windows.Win32.UI.TextServices
 */
export default struct ITfLangBarItemMgr extends IUnknown {
    /**
     * The interface identifier for ITfLangBarItemMgr
     * @type {Guid}
     */
    static IID := Guid("{ba468c55-9956-4fb1-a59d-52a7dd7cc6aa}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ITfLangBarItemMgr interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        EnumItems           : IntPtr
        GetItem             : IntPtr
        AddItem             : IntPtr
        RemoveItem          : IntPtr
        AdviseItemSink      : IntPtr
        UnadviseItemSink    : IntPtr
        GetItemFloatingRect : IntPtr
        GetItemsStatus      : IntPtr
        GetItemNum          : IntPtr
        GetItems            : IntPtr
        AdviseItemsSink     : IntPtr
        UnadviseItemsSink   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ITfLangBarItemMgr.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * ITfLangBarItemMgr::EnumItems method
     * @returns {IEnumTfLangBarItems} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-ienumtflangbaritems">IEnumTfLangBarItems</a> interface pointer that receives the enumerator object.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-enumitems
     */
    EnumItems() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfLangBarItems(ppEnum)
    }

    /**
     * ITfLangBarItemMgr::GetItem method
     * @param {Pointer<Guid>} rguid GUID that identifies the item to obtain. This is the item GUID that the item supplies in <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritem-getinfo">ITfLangBarItem::GetInfo</a>. This identifier can be a custom value or one of the <a href="https://docs.microsoft.com/windows/desktop/TSF/predefined-lang-bar-items">predefined language bar items</a>.
     * @returns {ITfLangBarItem} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-itflangbaritem">ITfLangBarItem</a> interface pointer that receives the item interface.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-getitem
     */
    GetItem(rguid) {
        result := ComCall(4, this, Guid.Ptr, rguid, "ptr*", &ppItem := 0, "HRESULT")
        return ITfLangBarItem(ppItem)
    }

    /**
     * ITfLangBarItemMgr::AddItem method
     * @param {ITfLangBarItem} punk Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-itflangbaritem">ITfLangBarItem</a> object to add to the language bar. 
     * 
     * Starting with Windows 8, only the first item that returns GUID_LBI_INPUTMODE (from [GetInfo](/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritem-getinfo)) is shown. For more information, see [Third-party input method editors](https://docs.microsoft.com/en-us/windows/win32/w8cookbook/third-party-input-method-editors#manifestation) in the Compatibility cookbook for Windows.
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
     * The method was successful (silently ignored calls also return this status).
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>punk</i> is invalid.
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
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-additem
     */
    AddItem(punk) {
        result := ComCall(5, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * ITfLangBarItemMgr::RemoveItem method
     * @param {ITfLangBarItem} punk Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-itflangbaritem">ITfLangBarItem</a> object to remove from the language bar. The language bar will call <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritem-getinfo">ITfLangBarItem::GetInfo</a> and use the item <b>GUID</b> to identify the item to remove.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>punk</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-removeitem
     */
    RemoveItem(punk) {
        result := ComCall(6, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * ITfLangBarItemMgr::AdviseItemSink method
     * @param {ITfLangBarItemSink} punk Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-itflangbaritemsink">ITfLangBarItemSink</a> object to install.
     * @param {Pointer<Guid>} rguidItem Contains the <b>GUID</b> that identifies the item to install the advise sink for. This is the item <b>GUID</b> that the item supplies in <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritem-getinfo">ITfLangBarItem::GetInfo</a>. This can be a custom value or one of the <a href="https://docs.microsoft.com/windows/desktop/TSF/predefined-lang-bar-items">predefined language bar items</a>.
     * @returns {Integer} Pointer to a <b>DWORD</b> that receives an advise sink identification cookie. This cookie identifies the advise sink when it is removed with the <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritemmgr-unadviseitemsink">ITfLangBarItemMgr::UnadviseItemSink</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritemmgr-unadviseitemssink">ITfLangBarItemMgr::UnadviseItemsSink</a> method.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-adviseitemsink
     */
    AdviseItemSink(punk, rguidItem) {
        result := ComCall(7, this, "ptr", punk, "uint*", &pdwCookie := 0, Guid.Ptr, rguidItem, "HRESULT")
        return pdwCookie
    }

    /**
     * ITfLangBarItemMgr::UnadviseItemSink method
     * @param {Integer} dwCookie Contains a <i>DWORD</i> that identifies the advise sink to remove. This cookie is obtained when the advise sink is installed with <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritemmgr-adviseitemsink">ITfLangBarItemMgr::AdviseItemSink</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritemmgr-adviseitemssink">ITfLangBarItemMgr::AdviseItemsSink</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-unadviseitemsink
     */
    UnadviseItemSink(dwCookie) {
        result := ComCall(8, this, "uint", dwCookie, "HRESULT")
        return result
    }

    /**
     * ITfLangBarItemMgr::GetItemFloatingRect method
     * @param {Integer} dwThreadId Not currently used. Must be zero.
     * @param {Pointer<Guid>} rguid Contains the <b>GUID</b> that identifies the item to obtain the bounding rectangle for. This is the item <b>GUID</b> that the item supplies in <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritem-getinfo">ITfLangBarItem::GetInfo</a>. This can be a custom value or one of the <a href="https://docs.microsoft.com/windows/desktop/TSF/predefined-lang-bar-items">predefined language bar items</a>.
     * @returns {RECT} Pointer to a <b>RECT</b> structure that receives the bounding rectangle in screen coordinates.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-getitemfloatingrect
     */
    GetItemFloatingRect(dwThreadId, rguid) {
        prc := RECT()
        result := ComCall(9, this, "uint", dwThreadId, Guid.Ptr, rguid, RECT.Ptr, prc, "HRESULT")
        return prc
    }

    /**
     * ITfLangBarItemMgr::GetItemsStatus method
     * @remarks
     * This method causes the <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritem-getstatus">ITfLangBarItem::GetStatus</a> method of each language bar item identified by <i>prgguid</i> to be called.
     * @param {Integer} ulCount Specifies the number of items to obtain the status for.
     * @param {Pointer<Guid>} prgguid Pointer to an array of <b>GUID</b>s that identify the items obtain the status for. These are the item <b>GUID</b>s that the item supplies in <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritem-getinfo">ITfLangBarItem::GetInfo</a>. This array must be at least <i>ulCount</i> elements in length.
     * @returns {Integer} Pointer to an array of <b>DWORD</b> values that receive the status of each item. Each element in this array receives zero or a combination of one or more of the <a href="https://docs.microsoft.com/windows/desktop/TSF/tf-lbi-status--constants">TF_LBI_STATUS_*</a> values. This array must be at least <i>ulCount</i> elements in length.
     * 
     * The index of each status value corresponds to the index of the item identifier in <i>prgguid</i>. For example, the element 0 in <i>pdwStatus</i> receives the for the item identified by element 0 of <i>prgguid</i>.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-getitemsstatus
     */
    GetItemsStatus(ulCount, prgguid) {
        result := ComCall(10, this, "uint", ulCount, Guid.Ptr, prgguid, "uint*", &pdwStatus := 0, "HRESULT")
        return pdwStatus
    }

    /**
     * ITfLangBarItemMgr::GetItemNum method
     * @returns {Integer} Pointer to a <b>ULONG</b> that receives the number of items in the language bar.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-getitemnum
     */
    GetItemNum() {
        result := ComCall(11, this, "uint*", &pulCount := 0, "HRESULT")
        return pulCount
    }

    /**
     * ITfLangBarItemMgr::GetItems method
     * @param {Integer} ulCount Specifies the number of items to obtain the status for.
     * @param {Pointer<ITfLangBarItem>} ppItem Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-itflangbaritem">ITfLangBarItem</a> interface pointers that receive the item interfaces. This array must be at least <i>ulCount</i> elements in length.
     * @param {Pointer<TF_LANGBARITEMINFO>} pInfo [in, out] Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/ns-ctfutb-tf_langbariteminfo">TF_LANGBARITEMINFO</a> structures that receive the information for each item. This array must be at least <i>ulCount</i> elements in length.
     * @param {Pointer<Integer>} pdwStatus [in, out] Pointer to an array of <b>DWORD</b> values that receive the status of each item. Each element in this array receives zero or a combination of one or more of the <a href="https://docs.microsoft.com/windows/desktop/TSF/tf-lbi-status--constants">TF_LBI_STATUS_*</a> values. This array must be at least <i>ulCount</i> elements in length.
     * @param {Pointer<Integer>} pcFetched [in, out] Pointer to a ULONG that receives the number of items obtained by this method. This parameter can be <b>NULL</b> if this information is not required.
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
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The number of items obtained is less than the number of items requested. If <i>pcFetched</i> is not <b>NULL</b>, <i>pcFetched</i> receives the number of items obtained.
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
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-getitems
     */
    GetItems(ulCount, ppItem, pInfo, pdwStatus, pcFetched) {
        pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "uint", ulCount, ITfLangBarItem.Ptr, ppItem, TF_LANGBARITEMINFO.Ptr, pInfo, pdwStatusMarshal, pdwStatus, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * ITfLangBarItemMgr::AdviseItemsSink method
     * @param {Integer} ulCount Contains the number of advise sinks to install.
     * @param {Pointer<ITfLangBarItemSink>} ppunk Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nn-ctfutb-itflangbaritemsink">ITfLangBarItemSink</a> objects to install. This array must be at least <i>ulCount</i> elements in length.
     * @param {Pointer<Guid>} pguidItem Pointer to an array of <b>GUID</b>s that identify the items to install the advise sinks for. These are the item <b>GUID</b>s that the item supplies in <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritem-getinfo">ITfLangBarItem::GetInfo</a>. This array must be at least <i>ulCount</i> elements in length.
     * @returns {Integer} Pointer to an array of <b>DWORD</b>s that receive the corresponding advise sink identification cookies. These cookies identify the advise sinks when they are removed with the <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritemmgr-unadviseitemsink">ITfLangBarItemMgr::UnadviseItemSink</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritemmgr-unadviseitemssink">ITfLangBarItemMgr::UnadviseItemsSink</a> method. This array must be at least <i>ulCount</i> elements in length.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-adviseitemssink
     */
    AdviseItemsSink(ulCount, ppunk, pguidItem) {
        result := ComCall(13, this, "uint", ulCount, ITfLangBarItemSink.Ptr, ppunk, Guid.Ptr, pguidItem, "uint*", &pdwCookie := 0, "HRESULT")
        return pdwCookie
    }

    /**
     * ITfLangBarItemMgr::UnadviseItemsSink method
     * @param {Integer} ulCount Contains the number of advise sinks to install.
     * @param {Pointer<Integer>} pdwCookie Pointer to an array of <b>DWORD</b>s that identify the advise sinks to remove. These cookies are obtained when the advise sinks are installed with <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritemmgr-adviseitemsink">ITfLangBarItemMgr::AdviseItemSink</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ctfutb/nf-ctfutb-itflangbaritemmgr-adviseitemssink">ITfLangBarItemMgr::AdviseItemsSink</a>. This array must be at least <i>ulCount</i> elements in length.
     * @returns {HRESULT} This method has no return values.
     * @see https://learn.microsoft.com/windows/win32/api/ctfutb/nf-ctfutb-itflangbaritemmgr-unadviseitemssink
     */
    UnadviseItemsSink(ulCount, pdwCookie) {
        pdwCookieMarshal := pdwCookie is VarRef ? "uint*" : "ptr"

        result := ComCall(14, this, "uint", ulCount, pdwCookieMarshal, pdwCookie, "HRESULT")
        return result
    }

    Query(iid) {
        if (ITfLangBarItemMgr.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.EnumItems := CallbackCreate(GetMethod(implObj, "EnumItems"), flags, 2)
        this.vtbl.GetItem := CallbackCreate(GetMethod(implObj, "GetItem"), flags, 3)
        this.vtbl.AddItem := CallbackCreate(GetMethod(implObj, "AddItem"), flags, 2)
        this.vtbl.RemoveItem := CallbackCreate(GetMethod(implObj, "RemoveItem"), flags, 2)
        this.vtbl.AdviseItemSink := CallbackCreate(GetMethod(implObj, "AdviseItemSink"), flags, 4)
        this.vtbl.UnadviseItemSink := CallbackCreate(GetMethod(implObj, "UnadviseItemSink"), flags, 2)
        this.vtbl.GetItemFloatingRect := CallbackCreate(GetMethod(implObj, "GetItemFloatingRect"), flags, 4)
        this.vtbl.GetItemsStatus := CallbackCreate(GetMethod(implObj, "GetItemsStatus"), flags, 4)
        this.vtbl.GetItemNum := CallbackCreate(GetMethod(implObj, "GetItemNum"), flags, 2)
        this.vtbl.GetItems := CallbackCreate(GetMethod(implObj, "GetItems"), flags, 6)
        this.vtbl.AdviseItemsSink := CallbackCreate(GetMethod(implObj, "AdviseItemsSink"), flags, 5)
        this.vtbl.UnadviseItemsSink := CallbackCreate(GetMethod(implObj, "UnadviseItemsSink"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.EnumItems)
        CallbackFree(this.vtbl.GetItem)
        CallbackFree(this.vtbl.AddItem)
        CallbackFree(this.vtbl.RemoveItem)
        CallbackFree(this.vtbl.AdviseItemSink)
        CallbackFree(this.vtbl.UnadviseItemSink)
        CallbackFree(this.vtbl.GetItemFloatingRect)
        CallbackFree(this.vtbl.GetItemsStatus)
        CallbackFree(this.vtbl.GetItemNum)
        CallbackFree(this.vtbl.GetItems)
        CallbackFree(this.vtbl.AdviseItemsSink)
        CallbackFree(this.vtbl.UnadviseItemsSink)
    }
}
