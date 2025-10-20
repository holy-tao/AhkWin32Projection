#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IDownloadManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDownloadManager
     * @type {Guid}
     */
    static IID => Guid("{988934a4-064b-11d3-bb80-00104b35e7f9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Download"]

    /**
     * 
     * @param {IMoniker} pmk 
     * @param {IBindCtx} pbc 
     * @param {Integer} dwBindVerb 
     * @param {Integer} grfBINDF 
     * @param {Pointer<BINDINFO>} pBindInfo 
     * @param {PWSTR} pszHeaders 
     * @param {PWSTR} pszRedir 
     * @param {Integer} uiCP 
     * @returns {HRESULT} 
     */
    Download(pmk, pbc, dwBindVerb, grfBINDF, pBindInfo, pszHeaders, pszRedir, uiCP) {
        pszHeaders := pszHeaders is String ? StrPtr(pszHeaders) : pszHeaders
        pszRedir := pszRedir is String ? StrPtr(pszRedir) : pszRedir

        result := ComCall(3, this, "ptr", pmk, "ptr", pbc, "uint", dwBindVerb, "int", grfBINDF, "ptr", pBindInfo, "ptr", pszHeaders, "ptr", pszRedir, "uint", uiCP, "HRESULT")
        return result
    }
}
