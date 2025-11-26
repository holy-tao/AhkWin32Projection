#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\IUnknown.ahk
#Include ..\..\Variant\VARIANT.ahk
#Include .\IEnumEventObject.ahk
#Include ..\IDispatch.ahk

/**
 * Manages objects in an event objects collection.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/nn-eventsys-ieventobjectcollection
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IEventObjectCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEventObjectCollection
     * @type {Guid}
     */
    static IID => Guid("{f89ac270-d4eb-11d1-b682-00805fc79216}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_NewEnum", "get_Count", "Add", "Remove"]

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {IEnumEventObject} 
     */
    NewEnum {
        get => this.get_NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventobjectcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &ppUnkEnum := 0, "HRESULT")
        return IUnknown(ppUnkEnum)
    }

    /**
     * 
     * @param {BSTR} objectID 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventobjectcollection-get_item
     */
    get_Item(objectID) {
        objectID := objectID is String ? BSTR.Alloc(objectID).Value : objectID

        pItem := VARIANT()
        result := ComCall(8, this, "ptr", objectID, "ptr", pItem, "HRESULT")
        return pItem
    }

    /**
     * 
     * @returns {IEnumEventObject} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventobjectcollection-get_newenum
     */
    get_NewEnum() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumEventObject(ppEnum)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventobjectcollection-get_count
     */
    get_Count() {
        result := ComCall(10, this, "int*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {Pointer<VARIANT>} item 
     * @param {BSTR} objectID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventobjectcollection-add
     */
    Add(item, objectID) {
        objectID := objectID is String ? BSTR.Alloc(objectID).Value : objectID

        result := ComCall(11, this, "ptr", item, "ptr", objectID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} objectID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventobjectcollection-remove
     */
    Remove(objectID) {
        objectID := objectID is String ? BSTR.Alloc(objectID).Value : objectID

        result := ComCall(12, this, "ptr", objectID, "HRESULT")
        return result
    }
}
