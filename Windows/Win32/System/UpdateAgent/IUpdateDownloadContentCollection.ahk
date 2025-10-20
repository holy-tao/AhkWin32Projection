#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<IUpdateDownloadContent>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloadcontentcollection-get_item
     */
    get_Item(index, retval) {
        result := ComCall(7, this, "int", index, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloadcontentcollection-get__newenum
     */
    get__NewEnum(retval) {
        result := ComCall(8, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdatedownloadcontentcollection-get_count
     */
    get_Count(retval) {
        result := ComCall(9, this, "int*", retval, "HRESULT")
        return result
    }
}
