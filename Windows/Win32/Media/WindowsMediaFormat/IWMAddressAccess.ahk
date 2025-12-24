#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WM_ADDRESS_ACCESSENTRY.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMAddressAccess interface controls IP access lists on the writer network sink object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmaddressaccess
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMAddressAccess extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMAddressAccess
     * @type {Guid}
     */
    static IID => Guid("{bb3c6389-1633-4e92-af14-9f3173ba39d0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAccessEntryCount", "GetAccessEntry", "AddAccessEntry", "RemoveAccessEntry"]

    /**
     * The GetAccessEntryCount method retrieves the number of entries in the IP address access list.
     * @param {Integer} aeType A member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wm_aetype">WM_AETYPE</a> enumeration specifying the type of entry (exclusion or inclusion).
     * @returns {Integer} Pointer to a variable that receives the number of entries of the type specified in <i>aeType</i>.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmaddressaccess-getaccessentrycount
     */
    GetAccessEntryCount(aeType) {
        result := ComCall(3, this, "int", aeType, "uint*", &pcEntries := 0, "HRESULT")
        return pcEntries
    }

    /**
     * The GetAccessEntry method retrieves an entry from the IP address access list.
     * @param {Integer} aeType A member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wm_aetype">WM_AETYPE</a> enumeration specifying the type of entry to retrieve (exclusion or inclusion).
     * @param {Integer} dwEntryNum Specifies the zero-based index of the entry. Use the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmaddressaccess-getaccessentrycount">IWMAddressAccess::GetAccessEntryCount</a> method to get the number of entries.
     * @returns {WM_ADDRESS_ACCESSENTRY} Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_address_accessentry">WM_ADDRESS_ACCESSENTRY</a> structure that receives the access entry.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmaddressaccess-getaccessentry
     */
    GetAccessEntry(aeType, dwEntryNum) {
        pAddrAccessEntry := WM_ADDRESS_ACCESSENTRY()
        result := ComCall(4, this, "int", aeType, "uint", dwEntryNum, "ptr", pAddrAccessEntry, "HRESULT")
        return pAddrAccessEntry
    }

    /**
     * The AddAccessEntry method adds an entry to the IP address access list.
     * @param {Integer} aeType A member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wm_aetype">WM_AETYPE</a> enumeration specifying the access permissions (exclusion or inclusion).
     * @param {Pointer<WM_ADDRESS_ACCESSENTRY>} pAddrAccessEntry Pointer to a <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_address_accessentry">WM_ADDRESS_ACCESSENTRY</a> structure that specifies the IP address or range of addresses.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmaddressaccess-addaccessentry
     */
    AddAccessEntry(aeType, pAddrAccessEntry) {
        result := ComCall(5, this, "int", aeType, "ptr", pAddrAccessEntry, "HRESULT")
        return result
    }

    /**
     * The RemoveAccessEntry method removes an access entry.
     * @param {Integer} aeType A member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wm_aetype">WM_AETYPE</a> enumeration specifying the type of entry to remove (exclusion or inclusion).
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
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmaddressaccess-removeaccessentry
     */
    RemoveAccessEntry(aeType, dwEntryNum) {
        result := ComCall(6, this, "int", aeType, "uint", dwEntryNum, "HRESULT")
        return result
    }
}
