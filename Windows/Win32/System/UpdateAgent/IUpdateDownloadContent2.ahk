#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdateDownloadContent.ahk

/**
 * Represents the download content of an update.
 * @remarks
 * 
  * The <b>IUpdateDownloadContent2</b> interface  may require you to update the Windows Update Agent (WUA). For more information, see <a href="https://docs.microsoft.com/windows/desktop/Wua_Sdk/updating-the-windows-update-agent">Updating Windows Update Agent</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdatedownloadcontent2
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateDownloadContent2 extends IUpdateDownloadContent{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateDownloadContent2
     * @type {Guid}
     */
    static IID => Guid("{c97ad11b-f257-420b-9d9f-377f733f6f68}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsDeltaCompressedContent"]

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloadcontent2-get_isdeltacompressedcontent
     */
    get_IsDeltaCompressedContent(retval) {
        result := ComCall(8, this, "ptr", retval, "HRESULT")
        return result
    }
}
