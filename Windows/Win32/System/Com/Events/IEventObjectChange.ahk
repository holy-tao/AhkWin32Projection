#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\EOC_ChangeType.ahk" { EOC_ChangeType }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\IUnknown.ahk" { IUnknown }

/**
 * Notifies subscribers of changes to the event store.
 * @see https://learn.microsoft.com/windows/win32/api/eventsys/nn-eventsys-ieventobjectchange
 * @namespace Windows.Win32.System.Com.Events
 */
export default struct IEventObjectChange extends IUnknown {
    /**
     * The interface identifier for IEventObjectChange
     * @type {Guid}
     */
    static IID := Guid("{f4a07d70-2e25-11d1-9964-00c04fbbb345}")

    /**
     * The class identifier for EventObjectChange
     * @type {Guid}
     */
    static CLSID := Guid("{d0565000-9df4-11d1-a281-00c04fca0aa7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEventObjectChange interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        ChangedSubscription : IntPtr
        ChangedEventClass   : IntPtr
        ChangedPublisher    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEventObjectChange.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Indicates that a subscription object has been added, modified, or deleted. (IEventObjectChange.ChangedSubscription)
     * @param {EOC_ChangeType} _changeType The type of change to the subscription object. Values are taken from the EOC_ChangeType enumeration.
     * @param {BSTR} bstrSubscriptionID The SubscriptionID property of the subscription object that changed.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventobjectchange-changedsubscription
     */
    ChangedSubscription(_changeType, bstrSubscriptionID) {
        bstrSubscriptionID := bstrSubscriptionID is String ? BSTR.Alloc(bstrSubscriptionID).Value : bstrSubscriptionID

        result := ComCall(3, this, EOC_ChangeType, _changeType, BSTR, bstrSubscriptionID, "HRESULT")
        return result
    }

    /**
     * Indicates that an event class object has been added, modified, or deleted. (IEventObjectChange.ChangedEventClass)
     * @param {EOC_ChangeType} _changeType The type of change to the event class object. Values are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/ne-eventsys-eoc_changetype">EOC_ChangeType</a> enumeration.
     * @param {BSTR} bstrEventClassID The EventClassID property of the event class object that changed.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventobjectchange-changedeventclass
     */
    ChangedEventClass(_changeType, bstrEventClassID) {
        bstrEventClassID := bstrEventClassID is String ? BSTR.Alloc(bstrEventClassID).Value : bstrEventClassID

        result := ComCall(4, this, EOC_ChangeType, _changeType, BSTR, bstrEventClassID, "HRESULT")
        return result
    }

    /**
     * Indicates a publisher object has been added, modified, or deleted.
     * @param {EOC_ChangeType} _changeType The type of change to the publisher object. Values are taken from the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/ne-eventsys-eoc_changetype">EOC_ChangeType</a> enumeration.
     * @param {BSTR} bstrPublisherID The PublisherID property of the publisher object that changed.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventobjectchange-changedpublisher
     */
    ChangedPublisher(_changeType, bstrPublisherID) {
        bstrPublisherID := bstrPublisherID is String ? BSTR.Alloc(bstrPublisherID).Value : bstrPublisherID

        result := ComCall(5, this, EOC_ChangeType, _changeType, BSTR, bstrPublisherID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEventObjectChange.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ChangedSubscription := CallbackCreate(GetMethod(implObj, "ChangedSubscription"), flags, 3)
        this.vtbl.ChangedEventClass := CallbackCreate(GetMethod(implObj, "ChangedEventClass"), flags, 3)
        this.vtbl.ChangedPublisher := CallbackCreate(GetMethod(implObj, "ChangedPublisher"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ChangedSubscription)
        CallbackFree(this.vtbl.ChangedEventClass)
        CallbackFree(this.vtbl.ChangedPublisher)
    }
}
