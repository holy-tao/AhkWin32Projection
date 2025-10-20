#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Data.Xml.MsXml
 * @version v4.0.30319
 */
class ISchemaItemCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISchemaItemCollection
     * @type {Guid}
     */
    static IID => Guid("{50ea08b2-dd1b-4664-9a50-c2f40f4bd79a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_item", "itemByName", "itemByQName", "get_length", "get__newEnum"]

    /**
     * 
     * @param {Integer} index 
     * @param {Pointer<ISchemaItem>} item 
     * @returns {HRESULT} 
     */
    get_item(index, item) {
        result := ComCall(7, this, "int", index, "ptr*", item, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {Pointer<ISchemaItem>} item 
     * @returns {HRESULT} 
     */
    itemByName(name, item) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "ptr*", item, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {BSTR} namespaceURI 
     * @param {Pointer<ISchemaItem>} item 
     * @returns {HRESULT} 
     */
    itemByQName(name, namespaceURI, item) {
        name := name is String ? BSTR.Alloc(name).Value : name
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(9, this, "ptr", name, "ptr", namespaceURI, "ptr*", item, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} length 
     * @returns {HRESULT} 
     */
    get_length(length) {
        result := ComCall(10, this, "int*", length, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    get__newEnum(ppunk) {
        result := ComCall(11, this, "ptr*", ppunk, "HRESULT")
        return result
    }
}
