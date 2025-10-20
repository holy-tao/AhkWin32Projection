#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\IUnknown.ahk

/**
 * Notifies subscribers of changes to the event store.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/nn-eventsys-ieventobjectchange
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IEventObjectChange extends IUnknown{
    /**
     * The interface identifier for IEventObjectChange
     * @type {Guid}
     */
    static IID => Guid("{f4a07d70-2e25-11d1-9964-00c04fbbb345}")

    /**
     * The class identifier for EventObjectChange
     * @type {Guid}
     */
    static CLSID => Guid("{d0565000-9df4-11d1-a281-00c04fca0aa7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} changeType 
     * @param {BSTR} bstrSubscriptionID 
     * @returns {HRESULT} 
     */
    ChangedSubscription(changeType, bstrSubscriptionID) {
        bstrSubscriptionID := bstrSubscriptionID is String ? BSTR.Alloc(bstrSubscriptionID).Value : bstrSubscriptionID

        result := ComCall(3, this, "int", changeType, "ptr", bstrSubscriptionID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} changeType 
     * @param {BSTR} bstrEventClassID 
     * @returns {HRESULT} 
     */
    ChangedEventClass(changeType, bstrEventClassID) {
        bstrEventClassID := bstrEventClassID is String ? BSTR.Alloc(bstrEventClassID).Value : bstrEventClassID

        result := ComCall(4, this, "int", changeType, "ptr", bstrEventClassID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} changeType 
     * @param {BSTR} bstrPublisherID 
     * @returns {HRESULT} 
     */
    ChangedPublisher(changeType, bstrPublisherID) {
        bstrPublisherID := bstrPublisherID is String ? BSTR.Alloc(bstrPublisherID).Value : bstrPublisherID

        result := ComCall(5, this, "int", changeType, "ptr", bstrPublisherID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
