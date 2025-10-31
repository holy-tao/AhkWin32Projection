#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\IDispatch.ahk

/**
 * Specifies information about the relationship between an event subscriber and an event to which it is subscribing. It is used by publisher filters.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/nn-eventsys-ieventsubscription
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IEventSubscription extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEventSubscription
     * @type {Guid}
     */
    static IID => Guid("{4a6b0e15-2e38-11d1-9965-00c04fbbb345}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SubscriptionID", "put_SubscriptionID", "get_SubscriptionName", "put_SubscriptionName", "get_PublisherID", "put_PublisherID", "get_EventClassID", "put_EventClassID", "get_MethodName", "put_MethodName", "get_SubscriberCLSID", "put_SubscriberCLSID", "get_SubscriberInterface", "put_SubscriberInterface", "get_PerUser", "put_PerUser", "get_OwnerSID", "put_OwnerSID", "get_Enabled", "put_Enabled", "get_Description", "put_Description", "get_MachineName", "put_MachineName", "GetPublisherProperty", "PutPublisherProperty", "RemovePublisherProperty", "GetPublisherPropertyCollection", "GetSubscriberProperty", "PutSubscriberProperty", "RemoveSubscriberProperty", "GetSubscriberPropertyCollection", "get_InterfaceID", "put_InterfaceID"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSubscriptionID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_subscriptionid
     */
    get_SubscriptionID(pbstrSubscriptionID) {
        result := ComCall(7, this, "ptr", pbstrSubscriptionID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSubscriptionID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_subscriptionid
     */
    put_SubscriptionID(bstrSubscriptionID) {
        bstrSubscriptionID := bstrSubscriptionID is String ? BSTR.Alloc(bstrSubscriptionID).Value : bstrSubscriptionID

        result := ComCall(8, this, "ptr", bstrSubscriptionID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSubscriptionName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_subscriptionname
     */
    get_SubscriptionName(pbstrSubscriptionName) {
        result := ComCall(9, this, "ptr", pbstrSubscriptionName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSubscriptionName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_subscriptionname
     */
    put_SubscriptionName(bstrSubscriptionName) {
        bstrSubscriptionName := bstrSubscriptionName is String ? BSTR.Alloc(bstrSubscriptionName).Value : bstrSubscriptionName

        result := ComCall(10, this, "ptr", bstrSubscriptionName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPublisherID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_publisherid
     */
    get_PublisherID(pbstrPublisherID) {
        result := ComCall(11, this, "ptr", pbstrPublisherID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPublisherID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_publisherid
     */
    put_PublisherID(bstrPublisherID) {
        bstrPublisherID := bstrPublisherID is String ? BSTR.Alloc(bstrPublisherID).Value : bstrPublisherID

        result := ComCall(12, this, "ptr", bstrPublisherID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrEventClassID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_eventclassid
     */
    get_EventClassID(pbstrEventClassID) {
        result := ComCall(13, this, "ptr", pbstrEventClassID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrEventClassID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_eventclassid
     */
    put_EventClassID(bstrEventClassID) {
        bstrEventClassID := bstrEventClassID is String ? BSTR.Alloc(bstrEventClassID).Value : bstrEventClassID

        result := ComCall(14, this, "ptr", bstrEventClassID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMethodName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_methodname
     */
    get_MethodName(pbstrMethodName) {
        result := ComCall(15, this, "ptr", pbstrMethodName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMethodName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_methodname
     */
    put_MethodName(bstrMethodName) {
        bstrMethodName := bstrMethodName is String ? BSTR.Alloc(bstrMethodName).Value : bstrMethodName

        result := ComCall(16, this, "ptr", bstrMethodName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSubscriberCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_subscriberclsid
     */
    get_SubscriberCLSID(pbstrSubscriberCLSID) {
        result := ComCall(17, this, "ptr", pbstrSubscriberCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrSubscriberCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_subscriberclsid
     */
    put_SubscriberCLSID(bstrSubscriberCLSID) {
        bstrSubscriberCLSID := bstrSubscriberCLSID is String ? BSTR.Alloc(bstrSubscriberCLSID).Value : bstrSubscriberCLSID

        result := ComCall(18, this, "ptr", bstrSubscriberCLSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppSubscriberInterface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_subscriberinterface
     */
    get_SubscriberInterface(ppSubscriberInterface) {
        result := ComCall(19, this, "ptr*", ppSubscriberInterface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} pSubscriberInterface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_subscriberinterface
     */
    put_SubscriberInterface(pSubscriberInterface) {
        result := ComCall(20, this, "ptr", pSubscriberInterface, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfPerUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_peruser
     */
    get_PerUser(pfPerUser) {
        result := ComCall(21, this, "ptr", pfPerUser, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fPerUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_peruser
     */
    put_PerUser(fPerUser) {
        result := ComCall(22, this, "int", fPerUser, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrOwnerSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_ownersid
     */
    get_OwnerSID(pbstrOwnerSID) {
        result := ComCall(23, this, "ptr", pbstrOwnerSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrOwnerSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_ownersid
     */
    put_OwnerSID(bstrOwnerSID) {
        bstrOwnerSID := bstrOwnerSID is String ? BSTR.Alloc(bstrOwnerSID).Value : bstrOwnerSID

        result := ComCall(24, this, "ptr", bstrOwnerSID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_enabled
     */
    get_Enabled(pfEnabled) {
        result := ComCall(25, this, "ptr", pfEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_enabled
     */
    put_Enabled(fEnabled) {
        result := ComCall(26, this, "int", fEnabled, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_description
     */
    get_Description(pbstrDescription) {
        result := ComCall(27, this, "ptr", pbstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(28, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMachineName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_machinename
     */
    get_MachineName(pbstrMachineName) {
        result := ComCall(29, this, "ptr", pbstrMachineName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrMachineName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_machinename
     */
    put_MachineName(bstrMachineName) {
        bstrMachineName := bstrMachineName is String ? BSTR.Alloc(bstrMachineName).Value : bstrMachineName

        result := ComCall(30, this, "ptr", bstrMachineName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @param {Pointer<VARIANT>} propertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-getpublisherproperty
     */
    GetPublisherProperty(bstrPropertyName, propertyValue) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(31, this, "ptr", bstrPropertyName, "ptr", propertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @param {Pointer<VARIANT>} propertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-putpublisherproperty
     */
    PutPublisherProperty(bstrPropertyName, propertyValue) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(32, this, "ptr", bstrPropertyName, "ptr", propertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-removepublisherproperty
     */
    RemovePublisherProperty(bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(33, this, "ptr", bstrPropertyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEventObjectCollection>} collection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-getpublisherpropertycollection
     */
    GetPublisherPropertyCollection(collection) {
        result := ComCall(34, this, "ptr*", collection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @param {Pointer<VARIANT>} propertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-getsubscriberproperty
     */
    GetSubscriberProperty(bstrPropertyName, propertyValue) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(35, this, "ptr", bstrPropertyName, "ptr", propertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @param {Pointer<VARIANT>} propertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-putsubscriberproperty
     */
    PutSubscriberProperty(bstrPropertyName, propertyValue) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(36, this, "ptr", bstrPropertyName, "ptr", propertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-removesubscriberproperty
     */
    RemoveSubscriberProperty(bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(37, this, "ptr", bstrPropertyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IEventObjectCollection>} collection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-getsubscriberpropertycollection
     */
    GetSubscriberPropertyCollection(collection) {
        result := ComCall(38, this, "ptr*", collection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrInterfaceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_interfaceid
     */
    get_InterfaceID(pbstrInterfaceID) {
        result := ComCall(39, this, "ptr", pbstrInterfaceID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrInterfaceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_interfaceid
     */
    put_InterfaceID(bstrInterfaceID) {
        bstrInterfaceID := bstrInterfaceID is String ? BSTR.Alloc(bstrInterfaceID).Value : bstrInterfaceID

        result := ComCall(40, this, "ptr", bstrInterfaceID, "HRESULT")
        return result
    }
}
