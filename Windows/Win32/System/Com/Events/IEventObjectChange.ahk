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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ChangedSubscription", "ChangedEventClass", "ChangedPublisher"]

    /**
     * Indicates that a subscription object has been added, modified, or deleted.
     * @param {Integer} changeType The type of change to the subscription object. Values are taken from the EOC_ChangeType enumeration.
     * @param {BSTR} bstrSubscriptionID The SubscriptionID property of the subscription object that changed.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ieventobjectchange-changedsubscription
     */
    ChangedSubscription(changeType, bstrSubscriptionID) {
        bstrSubscriptionID := bstrSubscriptionID is String ? BSTR.Alloc(bstrSubscriptionID).Value : bstrSubscriptionID

        result := ComCall(3, this, "int", changeType, "ptr", bstrSubscriptionID, "HRESULT")
        return result
    }

    /**
     * Indicates that an event class object has been added, modified, or deleted.
     * @param {Integer} changeType The type of change to the event class object. Values are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/ne-eventsys-eoc_changetype">EOC_ChangeType</a> enumeration.
     * @param {BSTR} bstrEventClassID The EventClassID property of the event class object that changed.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ieventobjectchange-changedeventclass
     */
    ChangedEventClass(changeType, bstrEventClassID) {
        bstrEventClassID := bstrEventClassID is String ? BSTR.Alloc(bstrEventClassID).Value : bstrEventClassID

        result := ComCall(4, this, "int", changeType, "ptr", bstrEventClassID, "HRESULT")
        return result
    }

    /**
     * Indicates a publisher object has been added, modified, or deleted.
     * @param {Integer} changeType The type of change to the publisher object. Values are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/ne-eventsys-eoc_changetype">EOC_ChangeType</a> enumeration.
     * @param {BSTR} bstrPublisherID The PublisherID property of the publisher object that changed.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//eventsys/nf-eventsys-ieventobjectchange-changedpublisher
     */
    ChangedPublisher(changeType, bstrPublisherID) {
        bstrPublisherID := bstrPublisherID is String ? BSTR.Alloc(bstrPublisherID).Value : bstrPublisherID

        result := ComCall(5, this, "int", changeType, "ptr", bstrPublisherID, "HRESULT")
        return result
    }
}
