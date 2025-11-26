#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IUpdateService.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents a list of IUpdateService interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iupdateservicecollection
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IUpdateServiceCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUpdateServiceCollection
     * @type {Guid}
     */
    static IID => Guid("{9b0353aa-0e52-44ff-b8b0-1f7fa0437f88}")

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
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @param {Integer} index 
     * @returns {IUpdateService} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservicecollection-get_item
     */
    get_Item(index) {
        result := ComCall(7, this, "int", index, "ptr*", &retval := 0, "HRESULT")
        return IUpdateService(retval)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservicecollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iupdateservicecollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }
}
