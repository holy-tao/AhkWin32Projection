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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetImpersonationSidBlobs"]

    /**
     * 
     * @param {PWSTR} pcwszURL 
     * @param {Pointer<Integer>} pcSidCount 
     * @param {Pointer<Pointer<BLOB>>} ppSidBlobs 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/searchapi/nf-searchapi-iurlaccessor3-getimpersonationsidblobs
     */
    GetImpersonationSidBlobs(pcwszURL, pcSidCount, ppSidBlobs) {
        pcwszURL := pcwszURL is String ? StrPtr(pcwszURL) : pcwszURL

        pcSidCountMarshal := pcSidCount is VarRef ? "uint*" : "ptr"

        result := ComCall(19, this, "ptr", pcwszURL, pcSidCountMarshal, pcSidCount, "ptr*", ppSidBlobs, "HRESULT")
        return result
    }
}
