#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUrlAccessor2.ahk

/**
 * Extends the functionality of the IUrlAccessor2 interface with the IUrlAccessor3::GetImpersonationSidBlobs method to identify user security identifiers (SIDs) for a specified URL.
 * @see https://docs.microsoft.com/windows/win32/api//searchapi/nn-searchapi-iurlaccessor3
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class IUrlAccessor3 extends IUrlAccessor2{
    /**
     * The interface identifier for IUrlAccessor3
     * @type {Guid}
     */
    static IID => Guid("{6fbc7005-0455-4874-b8ff-7439450241a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 19

    /**
     * 
     * @param {PWSTR} pcwszURL 
     * @param {Pointer<UInt32>} pcSidCount 
     * @param {Pointer<BLOB>} ppSidBlobs 
     * @returns {HRESULT} 
     */
    GetImpersonationSidBlobs(pcwszURL, pcSidCount, ppSidBlobs) {
        pcwszURL := pcwszURL is String ? StrPtr(pcwszURL) : pcwszURL

        result := ComCall(19, this, "ptr", pcwszURL, "uint*", pcSidCount, "ptr", ppSidBlobs, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
