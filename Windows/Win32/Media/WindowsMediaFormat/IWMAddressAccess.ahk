#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WM_AETYPE.ahk" { WM_AETYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WM_ADDRESS_ACCESSENTRY.ahk" { WM_ADDRESS_ACCESSENTRY }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IWMAddressAccess interface controls IP access lists on the writer network sink object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmaddressaccess
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMAddressAccess extends IUnknown {
    /**
     * The interface identifier for IWMAddressAccess
     * @type {Guid}
     */
    static IID := Guid("{bb3c6389-1633-4e92-af14-9f3173ba39d0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMAddressAccess interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetAccessEntryCount : IntPtr
        GetAccessEntry      : IntPtr
        AddAccessEntry      : IntPtr
        RemoveAccessEntry   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMAddressAccess.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetAccessEntryCount method retrieves the number of entries in the IP address access list.
     * @param {WM_AETYPE} aeType A member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wm_aetype">WM_AETYPE</a> enumeration specifying the type of entry (exclusion or inclusion).
     * @returns {Integer} Pointer to a variable that receives the number of entries of the type specified in <i>aeType</i>.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmaddressaccess-getaccessentrycount
     */
    GetAccessEntryCount(aeType) {
        result := ComCall(3, this, WM_AETYPE, aeType, "uint*", &pcEntries := 0, "HRESULT")
        return pcEntries
    }

    /**
     * The GetAccessEntry method retrieves an entry from the IP address access list.
     * @param {WM_AETYPE} aeType A member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wm_aetype">WM_AETYPE</a> enumeration specifying the type of entry to retrieve (exclusion or inclusion).
     * @param {Integer} dwEntryNum Specifies the zero-based index of the entry. Use the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmaddressaccess-getaccessentrycount">IWMAddressAccess::GetAccessEntryCount</a> method to get the number of entries.
     * @returns {WM_ADDRESS_ACCESSENTRY} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_address_accessentry">WM_ADDRESS_ACCESSENTRY</a> structure that receives the access entry.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmaddressaccess-getaccessentry
     */
    GetAccessEntry(aeType, dwEntryNum) {
        pAddrAccessEntry := WM_ADDRESS_ACCESSENTRY()
        result := ComCall(4, this, WM_AETYPE, aeType, "uint", dwEntryNum, WM_ADDRESS_ACCESSENTRY.Ptr, pAddrAccessEntry, "HRESULT")
        return pAddrAccessEntry
    }

    /**
     * The AddAccessEntry method adds an entry to the IP address access list.
     * @param {WM_AETYPE} aeType A member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wm_aetype">WM_AETYPE</a> enumeration specifying the access permissions (exclusion or inclusion).
     * @param {Pointer<WM_ADDRESS_ACCESSENTRY>} pAddrAccessEntry Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_address_accessentry">WM_ADDRESS_ACCESSENTRY</a> structure that specifies the IP address or range of addresses.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmaddressaccess-addaccessentry
     */
    AddAccessEntry(aeType, pAddrAccessEntry) {
        result := ComCall(5, this, WM_AETYPE, aeType, WM_ADDRESS_ACCESSENTRY.Ptr, pAddrAccessEntry, "HRESULT")
        return result
    }

    /**
     * The RemoveAccessEntry method removes an access entry.
     * @param {WM_AETYPE} aeType A member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wm_aetype">WM_AETYPE</a> enumeration specifying the type of entry to remove (exclusion or inclusion).
     * @param {Integer} dwEntryNum Zero-based index of the access entry to remove. Use the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmaddressaccess-getaccessentrycount">IWMAddressAccess::GetAccessEntryCount</a> method to get the number of entries.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
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
     * NULL pointer argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_INDEX</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid index number.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmaddressaccess-removeaccessentry
     */
    RemoveAccessEntry(aeType, dwEntryNum) {
        result := ComCall(6, this, WM_AETYPE, aeType, "uint", dwEntryNum, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMAddressAccess.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAccessEntryCount := CallbackCreate(GetMethod(implObj, "GetAccessEntryCount"), flags, 3)
        this.vtbl.GetAccessEntry := CallbackCreate(GetMethod(implObj, "GetAccessEntry"), flags, 4)
        this.vtbl.AddAccessEntry := CallbackCreate(GetMethod(implObj, "AddAccessEntry"), flags, 3)
        this.vtbl.RemoveAccessEntry := CallbackCreate(GetMethod(implObj, "RemoveAccessEntry"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAccessEntryCount)
        CallbackFree(this.vtbl.GetAccessEntry)
        CallbackFree(this.vtbl.AddAccessEntry)
        CallbackFree(this.vtbl.RemoveAccessEntry)
    }
}
