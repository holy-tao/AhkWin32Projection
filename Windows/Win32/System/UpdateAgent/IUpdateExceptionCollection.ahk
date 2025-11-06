#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdateException.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents an ordered read-only list of IUpdateException interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdateexceptioncollection
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateExceptionCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateExceptionCollection
     * @type {Guid}
     */
    static IID => Guid("{503626a3-8e14-4729-9355-0fe664bd2321}")

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
     * @returns {IUpdateException} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateexceptioncollection-get_item
     */
    get_Item(index) {
        result := ComCall(7, this, "int", index, "ptr*", &retval := 0, "HRESULT")
        return IUpdateException(retval)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateexceptioncollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateexceptioncollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }
}
