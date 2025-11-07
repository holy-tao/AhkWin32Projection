#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IPersist.ahk

/**
 * @namespace Windows.Win32.Web.InternetExplorer
 * @version v4.0.30319
 */
class IPersistHistory extends IPersist{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPersistHistory
     * @type {Guid}
     */
    static IID => Guid("{91a565c1-e38f-11d0-94bf-00a0c9055cbf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["LoadHistory", "SaveHistory", "SetPositionCookie", "GetPositionCookie"]

    /**
     * 
     * @param {IStream} pStream 
     * @param {IBindCtx} pbc 
     * @returns {HRESULT} 
     */
    LoadHistory(pStream, pbc) {
        result := ComCall(4, this, "ptr", pStream, "ptr", pbc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IStream} pStream 
     * @returns {HRESULT} 
     */
    SaveHistory(pStream) {
        result := ComCall(5, this, "ptr", pStream, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwPositioncookie 
     * @returns {HRESULT} 
     */
    SetPositionCookie(dwPositioncookie) {
        result := ComCall(6, this, "uint", dwPositioncookie, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetPositionCookie() {
        result := ComCall(7, this, "uint*", &pdwPositioncookie := 0, "HRESULT")
        return pdwPositioncookie
    }
}
