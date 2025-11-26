#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWMAddressAccess.ahk

/**
 * The IWMAddressAccess2 interface controls IP access lists on the writer network sink object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmaddressaccess2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMAddressAccess2 extends IWMAddressAccess{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMAddressAccess2
     * @type {Guid}
     */
    static IID => Guid("{65a83fc2-3e98-4d4d-81b5-2a742886b33d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAccessEntryEx", "AddAccessEntryEx"]

    /**
     * The GetAccessEntryEx method retrieves an entry from the IP address access list.
     * @param {Integer} aeType A member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wm_aetype">WM_AETYPE</a> enumeration specifying the type of entry to retrieve (exclusion or inclusion).
     * @param {Integer} dwEntryNum Zero-based index of the entry. Use the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmaddressaccess-getaccessentrycount">IWMAddressAccess::GetAccessEntryCount</a> method to get the number of entries.
     * @param {Pointer<BSTR>} pbstrAddress Pointer to a variable that receives the IP address.
     * @param {Pointer<BSTR>} pbstrMask Pointer to a variable that receives the bit mask.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmaddressaccess2-getaccessentryex
     */
    GetAccessEntryEx(aeType, dwEntryNum, pbstrAddress, pbstrMask) {
        result := ComCall(7, this, "int", aeType, "uint", dwEntryNum, "ptr", pbstrAddress, "ptr", pbstrMask, "HRESULT")
        return result
    }

    /**
     * The AddAccessEntryEx method adds an entry to the IP address access list.
     * @param {Integer} aeType A member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wm_aetype">WM_AETYPE</a> enumeration specifying the specifying the access permissions (exclusion or inclusion).
     * @param {BSTR} bstrAddress Specifies an IP address as a <b>BSTR</b>, using standard "dot" notation. Both IPv4 and IPv6 addresses are supported. For example, <c>206.73.118.1</code> is an IPv4 address and <code>fe80::201:3ff:fee8:5058</c> is an IPv6 address.
     * @param {BSTR} bstrMask Bit mask that defines which bits in the IP address are matched against. For example, if the IP address is <c>206.73.118.1</code> and the mask is <code>255.255.255.0</c>, only the first 24 bits of the address are examined. Thus, any IP addresses in the range 206.73.118.<i>XXX</i> would match this entry.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmaddressaccess2-addaccessentryex
     */
    AddAccessEntryEx(aeType, bstrAddress, bstrMask) {
        bstrAddress := bstrAddress is String ? BSTR.Alloc(bstrAddress).Value : bstrAddress
        bstrMask := bstrMask is String ? BSTR.Alloc(bstrMask).Value : bstrMask

        result := ComCall(8, this, "int", aeType, "ptr", bstrAddress, "ptr", bstrMask, "HRESULT")
        return result
    }
}
