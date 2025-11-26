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
     * Retrieves an array of user security identifiers (SIDs) for a specified URL. This method enables protocol handlers to specify which users can access the file and the search protocol host to impersonate a user in order to index the file.
     * @param {PWSTR} pcwszURL Type: <b>LPCWSTR</b>
     * 
     * The URL to access on behalf of an impersonated user.
     * @param {Pointer<Integer>} pcSidCount Type: <b>DWORD*</b>
     * 
     * Receives a pointer to the number of user SIDs returned in <i>ppSidBlobs</i>.
     * @param {Pointer<Pointer<BLOB>>} ppSidBlobs Type: <b>BLOB**</b>
     * 
     * Receives the address of a pointer to the array of candidate impersonation user SIDs.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//searchapi/nf-searchapi-iurlaccessor3-getimpersonationsidblobs
     */
    GetImpersonationSidBlobs(pcwszURL, pcSidCount, ppSidBlobs) {
        pcwszURL := pcwszURL is String ? StrPtr(pcwszURL) : pcwszURL

        pcSidCountMarshal := pcSidCount is VarRef ? "uint*" : "ptr"
        ppSidBlobsMarshal := ppSidBlobs is VarRef ? "ptr*" : "ptr"

        result := ComCall(19, this, "ptr", pcwszURL, pcSidCountMarshal, pcSidCount, ppSidBlobsMarshal, ppSidBlobs, "HRESULT")
        return result
    }
}
