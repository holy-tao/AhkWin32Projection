#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdateDownloadContent.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents a collection of download contents for an update.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdatedownloadcontentcollection
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateDownloadContentCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateDownloadContentCollection
     * @type {Guid}
     */
    static IID => Guid("{bc5513c8-b3b8-4bf7-a4d4-361c0d8c88ba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Item", "get__NewEnum", "get_Count"]

    /**
     * 
     * @param {Integer} index 
     * @returns {IUpdateDownloadContent} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloadcontentcollection-get_item
     */
    get_Item(index) {
        result := ComCall(7, this, "int", index, "ptr*", &retval := 0, "HRESULT")
        return IUpdateDownloadContent(retval)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloadcontentcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloadcontentcollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }
}
