#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdateSearcher.ahk

/**
 * Searches for updates on a server.
 * @remarks
 * 
 * The <b>IUpdateSearcher2</b> interface  may require you to update Windows Update Agent (WUA). For more information, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/updating-the-windows-update-agent">Updating Windows Update Agent</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdatesearcher2
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateSearcher2 extends IUpdateSearcher{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateSearcher2
     * @type {Guid}
     */
    static IID => Guid("{4cbdcb2d-1589-4beb-bd1c-3e582ff0add0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 25

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IgnoreDownloadPriority", "put_IgnoreDownloadPriority"]

    /**
     * @type {VARIANT_BOOL} 
     */
    IgnoreDownloadPriority {
        get => this.get_IgnoreDownloadPriority()
        set => this.put_IgnoreDownloadPriority(value)
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher2-get_ignoredownloadpriority
     */
    get_IgnoreDownloadPriority() {
        result := ComCall(25, this, "short*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * 
     * @param {VARIANT_BOOL} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatesearcher2-put_ignoredownloadpriority
     */
    put_IgnoreDownloadPriority(value) {
        result := ComCall(26, this, "short", value, "HRESULT")
        return result
    }
}
