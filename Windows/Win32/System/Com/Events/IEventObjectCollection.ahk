#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\IDispatch.ahk

/**
 * Manages objects in an event objects collection.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/nn-eventsys-ieventobjectcollection
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IEventObjectCollection extends IDispatch{
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
     * 
     * @param {Pointer<IUnknown>} ppUnkEnum 
     * @returns {HRESULT} 
     */
    get__NewEnum(ppUnkEnum) {
        result := ComCall(7, this, "ptr", ppUnkEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} objectID 
     * @param {Pointer<VARIANT>} pItem 
     * @returns {HRESULT} 
     */
    get_Item(objectID, pItem) {
        objectID := objectID is String ? BSTR.Alloc(objectID).Value : objectID

        result := ComCall(8, this, "ptr", objectID, "ptr", pItem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEnumEventObject>} ppEnum 
     * @returns {HRESULT} 
     */
    get_NewEnum(ppEnum) {
        result := ComCall(9, this, "ptr", ppEnum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pCount 
     * @returns {HRESULT} 
     */
    get_Count(pCount) {
        result := ComCall(10, this, "int*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} item 
     * @param {BSTR} objectID 
     * @returns {HRESULT} 
     */
    Add(item, objectID) {
        objectID := objectID is String ? BSTR.Alloc(objectID).Value : objectID

        result := ComCall(11, this, "ptr", item, "ptr", objectID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} objectID 
     * @returns {HRESULT} 
     */
    Remove(objectID) {
        objectID := objectID is String ? BSTR.Alloc(objectID).Value : objectID

        result := ComCall(12, this, "ptr", objectID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
