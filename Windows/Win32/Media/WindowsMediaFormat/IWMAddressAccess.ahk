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
     * 
     * @param {Integer} aeType 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmaddressaccess-getaccessentrycount
     */
    GetAccessEntryCount(aeType) {
        result := ComCall(3, this, "int", aeType, "uint*", &pcEntries := 0, "HRESULT")
        return pcEntries
    }

    /**
     * 
     * @param {Integer} aeType 
     * @param {Integer} dwEntryNum 
     * @returns {WM_ADDRESS_ACCESSENTRY} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmaddressaccess-getaccessentry
     */
    GetAccessEntry(aeType, dwEntryNum) {
        pAddrAccessEntry := WM_ADDRESS_ACCESSENTRY()
        result := ComCall(4, this, "int", aeType, "uint", dwEntryNum, "ptr", pAddrAccessEntry, "HRESULT")
        return pAddrAccessEntry
    }

    /**
     * 
     * @param {Integer} aeType 
     * @param {Pointer<WM_ADDRESS_ACCESSENTRY>} pAddrAccessEntry 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmaddressaccess-addaccessentry
     */
    AddAccessEntry(aeType, pAddrAccessEntry) {
        result := ComCall(5, this, "int", aeType, "ptr", pAddrAccessEntry, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} aeType 
     * @param {Integer} dwEntryNum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmaddressaccess-removeaccessentry
     */
    RemoveAccessEntry(aeType, dwEntryNum) {
        result := ComCall(6, this, "int", aeType, "uint", dwEntryNum, "HRESULT")
        return result
    }
}
