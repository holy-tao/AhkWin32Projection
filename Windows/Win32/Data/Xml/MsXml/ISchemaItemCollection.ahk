#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\ISchemaItem.ahk
#Include ..\..\..\System\Com\IUnknown.ahk
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
     * @returns {ISchemaItem} 
     */
    get_item(index) {
        result := ComCall(7, this, "int", index, "ptr*", &item := 0, "HRESULT")
        return ISchemaItem(item)
    }

    /**
     * 
     * @param {BSTR} name 
     * @returns {ISchemaItem} 
     */
    itemByName(name) {
        name := name is String ? BSTR.Alloc(name).Value : name

        result := ComCall(8, this, "ptr", name, "ptr*", &item := 0, "HRESULT")
        return ISchemaItem(item)
    }

    /**
     * 
     * @param {BSTR} name 
     * @param {BSTR} namespaceURI 
     * @returns {ISchemaItem} 
     */
    itemByQName(name, namespaceURI) {
        name := name is String ? BSTR.Alloc(name).Value : name
        namespaceURI := namespaceURI is String ? BSTR.Alloc(namespaceURI).Value : namespaceURI

        result := ComCall(9, this, "ptr", name, "ptr", namespaceURI, "ptr*", &item := 0, "HRESULT")
        return ISchemaItem(item)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_length() {
        result := ComCall(10, this, "int*", &length := 0, "HRESULT")
        return length
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__newEnum() {
        result := ComCall(11, this, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }
}
