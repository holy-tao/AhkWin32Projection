#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WM_AETYPE.ahk" { WM_AETYPE }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IWMAddressAccess.ahk" { IWMAddressAccess }

/**
 * The IWMAddressAccess2 interface controls IP access lists on the writer network sink object.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmaddressaccess2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 */
export default struct IWMAddressAccess2 extends IWMAddressAccess {
    /**
     * The interface identifier for IWMAddressAccess2
     * @type {Guid}
     */
    static IID := Guid("{65a83fc2-3e98-4d4d-81b5-2a742886b33d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWMAddressAccess2 interfaces
    */
    struct Vtbl extends IWMAddressAccess.Vtbl {
        GetAccessEntryEx : IntPtr
        AddAccessEntryEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWMAddressAccess2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetAccessEntryEx method retrieves an entry from the IP address access list.
     * @remarks
     * For more information about the meaning of the <i>pbstrAddress</i> and <i>pbstrMask</i> parameters, see <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmaddressaccess2-addaccessentryex">IWMAddressAccess2::AddAccessEntryEx</a>.
     * 
     * The caller must release the returned <b>BSTR</b> values, by calling <b>SysFreeString</b>.
     * @param {WM_AETYPE} aeType A member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wm_aetype">WM_AETYPE</a> enumeration specifying the type of entry to retrieve (exclusion or inclusion).
     * @param {Integer} dwEntryNum Zero-based index of the entry. Use the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmaddressaccess-getaccessentrycount">IWMAddressAccess::GetAccessEntryCount</a> method to get the number of entries.
     * @param {Pointer<BSTR>} pbstrAddress Pointer to a variable that receives the IP address.
     * @param {Pointer<BSTR>} pbstrMask Pointer to a variable that receives the bit mask.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmaddressaccess2-getaccessentryex
     */
    GetAccessEntryEx(aeType, dwEntryNum, pbstrAddress, pbstrMask) {
        result := ComCall(7, this, WM_AETYPE, aeType, "uint", dwEntryNum, BSTR.Ptr, pbstrAddress, BSTR.Ptr, pbstrMask, "HRESULT")
        return result
    }

    /**
     * The AddAccessEntryEx method adds an entry to the IP address access list.
     * @param {WM_AETYPE} aeType A member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wm_aetype">WM_AETYPE</a> enumeration specifying the specifying the access permissions (exclusion or inclusion).
     * @param {BSTR} bstrAddress Specifies an IP address as a <b>BSTR</b>, using standard "dot" notation. Both IPv4 and IPv6 addresses are supported. For example, <c>206.73.118.1</code> is an IPv4 address and <code>fe80::201:3ff:fee8:5058</c> is an IPv6 address.
     * @param {BSTR} bstrMask Bit mask that defines which bits in the IP address are matched against. For example, if the IP address is <c>206.73.118.1</code> and the mask is <code>255.255.255.0</c>, only the first 24 bits of the address are examined. Thus, any IP addresses in the range 206.73.118.<i>XXX</i> would match this entry.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmaddressaccess2-addaccessentryex
     */
    AddAccessEntryEx(aeType, bstrAddress, bstrMask) {
        bstrAddress := bstrAddress is String ? BSTR.Alloc(bstrAddress).Value : bstrAddress
        bstrMask := bstrMask is String ? BSTR.Alloc(bstrMask).Value : bstrMask

        result := ComCall(8, this, WM_AETYPE, aeType, BSTR, bstrAddress, BSTR, bstrMask, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWMAddressAccess2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetAccessEntryEx := CallbackCreate(GetMethod(implObj, "GetAccessEntryEx"), flags, 5)
        this.vtbl.AddAccessEntryEx := CallbackCreate(GetMethod(implObj, "AddAccessEntryEx"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetAccessEntryEx)
        CallbackFree(this.vtbl.AddAccessEntryEx)
    }
}
