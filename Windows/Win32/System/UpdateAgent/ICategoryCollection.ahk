#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ICategory.ahk
#Include ..\Com\IUnknown.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Represents an ordered read-only list of ICategory interfaces.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-icategorycollection
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class ICategoryCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICategoryCollection
     * @type {Guid}
     */
    static IID => Guid("{3a56bfb8-576c-43f7-9335-fe4838fd7e37}")

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
     * @returns {ICategory} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategorycollection-get_item
     */
    get_Item(index) {
        result := ComCall(7, this, "int", index, "ptr*", &retval := 0, "HRESULT")
        return ICategory(retval)
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategorycollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(8, this, "ptr*", &retval := 0, "HRESULT")
        return IUnknown(retval)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-icategorycollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &retval := 0, "HRESULT")
        return retval
    }
}
