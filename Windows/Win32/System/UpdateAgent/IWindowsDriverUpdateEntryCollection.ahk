#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Contains a collection of driver update entries associated with a driver update. All of the properties have the standard collection semantics.
 * @see https://docs.microsoft.com/windows/win32/api//wuapi/nn-wuapi-iwindowsdriverupdateentrycollection
 * @namespace Windows.Win32.System.UpdateAgent
 * @version v4.0.30319
 */
class IWindowsDriverUpdateEntryCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsDriverUpdateEntryCollection
     * @type {Guid}
     */
    static IID => Guid("{0d521700-a372-4bef-828b-3d00c10adebd}")

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
     * @param {Pointer<IWindowsDriverUpdateEntry>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdateentrycollection-get_item
     */
    get_Item(index, retval) {
        result := ComCall(7, this, "int", index, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdateentrycollection-get__newenum
     */
    get__NewEnum(retval) {
        result := ComCall(8, this, "ptr*", retval, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} retval 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wuapi/nf-wuapi-iwindowsdriverupdateentrycollection-get_count
     */
    get_Count(retval) {
        retvalMarshal := retval is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, retvalMarshal, retval, "HRESULT")
        return result
    }
}
