#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.SideShow
 * @version v4.0.30319
 */
class ISideShowKeyCollection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISideShowKeyCollection
     * @type {Guid}
     */
    static IID => Guid("{045473bc-a37b-4957-b144-68105411ed8e}")

    /**
     * The class identifier for SideShowKeyCollection
     * @type {Guid}
     */
    static CLSID => Guid("{dfbbdbf8-18de-49b8-83dc-ebc727c62d94}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Add", "Clear", "GetAt", "GetCount", "RemoveAt"]

    /**
     * 
     * @param {Pointer<PROPERTYKEY>} Key 
     * @returns {HRESULT} 
     */
    Add(Key) {
        result := ComCall(3, this, "ptr", Key, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {Pointer<PROPERTYKEY>} pKey 
     * @returns {HRESULT} 
     */
    GetAt(dwIndex, pKey) {
        result := ComCall(5, this, "uint", dwIndex, "ptr", pKey, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcElems 
     * @returns {HRESULT} 
     */
    GetCount(pcElems) {
        result := ComCall(6, this, "uint*", pcElems, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @returns {HRESULT} 
     */
    RemoveAt(dwIndex) {
        result := ComCall(7, this, "uint", dwIndex, "HRESULT")
        return result
    }
}
