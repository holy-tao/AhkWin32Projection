#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMAddressAccess interface controls IP access lists on the writer network sink object.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmaddressaccess
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMAddressAccess extends IUnknown{
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
     * 
     * @param {Integer} aeType 
     * @param {Pointer<UInt32>} pcEntries 
     * @returns {HRESULT} 
     */
    GetAccessEntryCount(aeType, pcEntries) {
        result := ComCall(3, this, "int", aeType, "uint*", pcEntries, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} aeType 
     * @param {Integer} dwEntryNum 
     * @param {Pointer<WM_ADDRESS_ACCESSENTRY>} pAddrAccessEntry 
     * @returns {HRESULT} 
     */
    GetAccessEntry(aeType, dwEntryNum, pAddrAccessEntry) {
        result := ComCall(4, this, "int", aeType, "uint", dwEntryNum, "ptr", pAddrAccessEntry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} aeType 
     * @param {Pointer<WM_ADDRESS_ACCESSENTRY>} pAddrAccessEntry 
     * @returns {HRESULT} 
     */
    AddAccessEntry(aeType, pAddrAccessEntry) {
        result := ComCall(5, this, "int", aeType, "ptr", pAddrAccessEntry, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} aeType 
     * @param {Integer} dwEntryNum 
     * @returns {HRESULT} 
     */
    RemoveAccessEntry(aeType, dwEntryNum) {
        result := ComCall(6, this, "int", aeType, "uint", dwEntryNum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
