#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\IUnknown.ahk
#Include ..\..\Variant\VARIANT.ahk
#Include .\IEventObjectCollection.ahk
#Include ..\IDispatch.ahk

/**
 * Specifies information about the relationship between an event subscriber and an event to which it is subscribing. It is used by publisher filters.
 * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nn-eventsys-ieventsubscription
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
     * @type {BSTR} 
     */
    SubscriptionID {
        get => this.get_SubscriptionID()
        set => this.put_SubscriptionID(value)
    }

    /**
     * @type {BSTR} 
     */
    SubscriptionName {
        get => this.get_SubscriptionName()
        set => this.put_SubscriptionName(value)
    }

    /**
     * @type {BSTR} 
     */
    PublisherID {
        get => this.get_PublisherID()
        set => this.put_PublisherID(value)
    }

    /**
     * @type {BSTR} 
     */
    EventClassID {
        get => this.get_EventClassID()
        set => this.put_EventClassID(value)
    }

    /**
     * @type {BSTR} 
     */
    MethodName {
        get => this.get_MethodName()
        set => this.put_MethodName(value)
    }

    /**
     * @type {BSTR} 
     */
    SubscriberCLSID {
        get => this.get_SubscriberCLSID()
        set => this.put_SubscriberCLSID(value)
    }

    /**
     * @type {IUnknown} 
     */
    SubscriberInterface {
        get => this.get_SubscriberInterface()
        set => this.put_SubscriberInterface(value)
    }

    /**
     * @type {BOOL} 
     */
    PerUser {
        get => this.get_PerUser()
        set => this.put_PerUser(value)
    }

    /**
     * @type {BSTR} 
     */
    OwnerSID {
        get => this.get_OwnerSID()
        set => this.put_OwnerSID(value)
    }

    /**
     * @type {BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * @type {BSTR} 
     */
    MachineName {
        get => this.get_MachineName()
        set => this.put_MachineName(value)
    }

    /**
     * @type {BSTR} 
     */
    InterfaceID {
        get => this.get_InterfaceID()
        set => this.put_InterfaceID(value)
    }

    /**
     * The unique ID for the subscription object. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-get_subscriptionid
     */
    get_SubscriptionID() {
        pbstrSubscriptionID := BSTR()
        result := ComCall(7, this, "ptr", pbstrSubscriptionID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrSubscriptionID
    }

    /**
     * The unique ID for the subscription object. (Put)
     * @param {BSTR} bstrSubscriptionID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-put_subscriptionid
     */
    put_SubscriptionID(bstrSubscriptionID) {
        if(bstrSubscriptionID is String) {
            pin := BSTR.Alloc(bstrSubscriptionID)
            bstrSubscriptionID := pin.Value
        }

        result := ComCall(8, this, "ptr", bstrSubscriptionID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * A displayable name for the subscription object. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-get_subscriptionname
     */
    get_SubscriptionName() {
        pbstrSubscriptionName := BSTR()
        result := ComCall(9, this, "ptr", pbstrSubscriptionName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrSubscriptionName
    }

    /**
     * A displayable name for the subscription object. (Put)
     * @param {BSTR} bstrSubscriptionName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-put_subscriptionname
     */
    put_SubscriptionName(bstrSubscriptionName) {
        if(bstrSubscriptionName is String) {
            pin := BSTR.Alloc(bstrSubscriptionName)
            bstrSubscriptionName := pin.Value
        }

        result := ComCall(10, this, "ptr", bstrSubscriptionName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The unique ID of the event publisher. (Get)
     * @remarks
     * Specifying a <b>PublisherID</b> property does not guarantee that a subscriber will not receive events fired by other publishers.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-get_publisherid
     */
    get_PublisherID() {
        pbstrPublisherID := BSTR()
        result := ComCall(11, this, "ptr", pbstrPublisherID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrPublisherID
    }

    /**
     * The unique ID of the event publisher. (Put)
     * @remarks
     * Specifying a <b>PublisherID</b> property does not guarantee that a subscriber will not receive events fired by other publishers.
     * @param {BSTR} bstrPublisherID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-put_publisherid
     */
    put_PublisherID(bstrPublisherID) {
        if(bstrPublisherID is String) {
            pin := BSTR.Alloc(bstrPublisherID)
            bstrPublisherID := pin.Value
        }

        result := ComCall(12, this, "ptr", bstrPublisherID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The unique ID of the event class associated with the subscription. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-get_eventclassid
     */
    get_EventClassID() {
        pbstrEventClassID := BSTR()
        result := ComCall(13, this, "ptr", pbstrEventClassID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrEventClassID
    }

    /**
     * The unique ID of the event class associated with the subscription. (Put)
     * @param {BSTR} bstrEventClassID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-put_eventclassid
     */
    put_EventClassID(bstrEventClassID) {
        if(bstrEventClassID is String) {
            pin := BSTR.Alloc(bstrEventClassID)
            bstrEventClassID := pin.Value
        }

        result := ComCall(14, this, "ptr", bstrEventClassID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The name of the event method. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-get_methodname
     */
    get_MethodName() {
        pbstrMethodName := BSTR()
        result := ComCall(15, this, "ptr", pbstrMethodName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrMethodName
    }

    /**
     * The name of the event method. (Put)
     * @param {BSTR} bstrMethodName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-put_methodname
     */
    put_MethodName(bstrMethodName) {
        if(bstrMethodName is String) {
            pin := BSTR.Alloc(bstrMethodName)
            bstrMethodName := pin.Value
        }

        result := ComCall(16, this, "ptr", bstrMethodName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The CLSID of the subscriber component (for a persistent subscription). (Get)
     * @remarks
     * If not empty, the subscription is persistent and the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsubscription-get_subscriberinterface">SubscriberInterface</a> property must be <b>NULL</b>. This property works in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsubscription-get_machinename">MachineName</a> property in a persistent subscription.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-get_subscriberclsid
     */
    get_SubscriberCLSID() {
        pbstrSubscriberCLSID := BSTR()
        result := ComCall(17, this, "ptr", pbstrSubscriberCLSID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrSubscriberCLSID
    }

    /**
     * The CLSID of the subscriber component (for a persistent subscription). (Put)
     * @remarks
     * If not empty, the subscription is persistent and the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsubscription-get_subscriberinterface">SubscriberInterface</a> property must be <b>NULL</b>. This property works in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsubscription-get_machinename">MachineName</a> property in a persistent subscription.
     * @param {BSTR} bstrSubscriberCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-put_subscriberclsid
     */
    put_SubscriberCLSID(bstrSubscriberCLSID) {
        if(bstrSubscriberCLSID is String) {
            pin := BSTR.Alloc(bstrSubscriberCLSID)
            bstrSubscriberCLSID := pin.Value
        }

        result := ComCall(18, this, "ptr", bstrSubscriberCLSID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * A marshaled pointer to the event interface on the subscriber (for a transient subscription). (Get)
     * @remarks
     * If not <b>NULL</b>, the subscription is transient and the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsubscription-get_subscriberclsid">SubscriberCLSID</a> property must be empty.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-get_subscriberinterface
     */
    get_SubscriberInterface() {
        result := ComCall(19, this, "ptr*", &ppSubscriberInterface := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IUnknown(ppSubscriberInterface)
    }

    /**
     * A marshaled pointer to the event interface on the subscriber (for a transient subscription). (Put)
     * @remarks
     * If not <b>NULL</b>, the subscription is transient and the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsubscription-get_subscriberclsid">SubscriberCLSID</a> property must be empty.
     * @param {IUnknown} pSubscriberInterface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-put_subscriberinterface
     */
    put_SubscriberInterface(pSubscriberInterface) {
        result := ComCall(20, this, "ptr", pSubscriberInterface, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Indicates whether the subscription receives the event only if the owner of the subscription is logged on to the same computer as the publisher. (Get)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-get_peruser
     */
    get_PerUser() {
        result := ComCall(21, this, "int*", &pfPerUser := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfPerUser
    }

    /**
     * Indicates whether the subscription receives the event only if the owner of the subscription is logged on to the same computer as the publisher. (Put)
     * @param {BOOL} fPerUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-put_peruser
     */
    put_PerUser(fPerUser) {
        result := ComCall(22, this, "int", fPerUser, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The security ID of the subscription's creator. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-get_ownersid
     */
    get_OwnerSID() {
        pbstrOwnerSID := BSTR()
        result := ComCall(23, this, "ptr", pbstrOwnerSID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrOwnerSID
    }

    /**
     * The security ID of the subscription's creator. (Put)
     * @param {BSTR} bstrOwnerSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-put_ownersid
     */
    put_OwnerSID(bstrOwnerSID) {
        if(bstrOwnerSID is String) {
            pin := BSTR.Alloc(bstrOwnerSID)
            bstrOwnerSID := pin.Value
        }

        result := ComCall(24, this, "ptr", bstrOwnerSID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Indicates whether the subscription is enabled. (Get)
     * @remarks
     * If a subscription is not enabled, it still appears in collections and can be queried, but events fired by the publisher do not reach the subscriber.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-get_enabled
     */
    get_Enabled() {
        result := ComCall(25, this, "int*", &pfEnabled := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pfEnabled
    }

    /**
     * Indicates whether the subscription is enabled. (Put)
     * @remarks
     * If a subscription is not enabled, it still appears in collections and can be queried, but events fired by the publisher do not reach the subscriber.
     * @param {BOOL} fEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-put_enabled
     */
    put_Enabled(fEnabled) {
        result := ComCall(26, this, "int", fEnabled, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * A displayable text description of the subscription. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-get_description
     */
    get_Description() {
        pbstrDescription := BSTR()
        result := ComCall(27, this, "ptr", pbstrDescription, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrDescription
    }

    /**
     * A displayable text description of the subscription. (Put)
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-put_description
     */
    put_Description(bstrDescription) {
        if(bstrDescription is String) {
            pin := BSTR.Alloc(bstrDescription)
            bstrDescription := pin.Value
        }

        result := ComCall(28, this, "ptr", bstrDescription, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The name of the computer on which the subscriber should be activated (for a persistent subscription). (Get)
     * @remarks
     * This information is only meaningful if the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsubscription-get_subscriberclsid">SubscriberCLSID</a> property is not empty. This property has no effect on transient subscriptions.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-get_machinename
     */
    get_MachineName() {
        pbstrMachineName := BSTR()
        result := ComCall(29, this, "ptr", pbstrMachineName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrMachineName
    }

    /**
     * The name of the computer on which the subscriber should be activated (for a persistent subscription). (Put)
     * @remarks
     * This information is only meaningful if the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsubscription-get_subscriberclsid">SubscriberCLSID</a> property is not empty. This property has no effect on transient subscriptions.
     * @param {BSTR} bstrMachineName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-put_machinename
     */
    put_MachineName(bstrMachineName) {
        if(bstrMachineName is String) {
            pin := BSTR.Alloc(bstrMachineName)
            bstrMachineName := pin.Value
        }

        result := ComCall(30, this, "ptr", bstrMachineName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the value of a property stored in the property bag to define publisher context.
     * @remarks
     * Publisher filters should call this method to obtain filter properties stored by the subscription builder.
     * @param {BSTR} bstrPropertyName The name of the requested property.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-getpublisherproperty
     */
    GetPublisherProperty(bstrPropertyName) {
        if(bstrPropertyName is String) {
            pin := BSTR.Alloc(bstrPropertyName)
            bstrPropertyName := pin.Value
        }

        propertyValue_ := VARIANT()
        result := ComCall(31, this, "ptr", bstrPropertyName, "ptr", propertyValue_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return propertyValue_
    }

    /**
     * Writes a property and its value to the property bag to define publisher context.
     * @remarks
     * A property bag is used to store information about the events the subscriber needs to be notified about. For example, if a subscriber to a sports ticker is to obtain only baseball scores, it could use the property bag in the subscription object to specify this restriction.
     * @param {BSTR} bstrPropertyName The name of the property whose value is to be written to the property bag. If the property is not in the property bag, this method adds it.
     * @param {Pointer<VARIANT>} propertyValue_ The value of the property to be written to the property bag. If the property is already in the property bag, this method overwrites the current value.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-putpublisherproperty
     */
    PutPublisherProperty(bstrPropertyName, propertyValue_) {
        if(bstrPropertyName is String) {
            pin := BSTR.Alloc(bstrPropertyName)
            bstrPropertyName := pin.Value
        }

        result := ComCall(32, this, "ptr", bstrPropertyName, "ptr", propertyValue_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes a property and its value from the property bag that defines publisher context.
     * @remarks
     * A property bag is used to store information about the events the subscriber needs to be notified about. For example, if a subscriber to a sports ticker is to obtain only baseball scores, it could use the property bag in the subscription object to specify this restriction.
     * @param {BSTR} bstrPropertyName The name of the property whose value is to be removed from the property bag.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-removepublisherproperty
     */
    RemovePublisherProperty(bstrPropertyName) {
        if(bstrPropertyName is String) {
            pin := BSTR.Alloc(bstrPropertyName)
            bstrPropertyName := pin.Value
        }

        result := ComCall(33, this, "ptr", bstrPropertyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a collection of properties and values stored in the publisher property bag.
     * @remarks
     * A property bag is used to store information about the events the subscriber needs to be notified about. For example, if a subscriber to a sports ticker is to obtain only baseball scores, it could use the property bag in the subscription object to specify this restriction.
     * @returns {IEventObjectCollection} Address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventobjectcollection">IEventObjectCollection</a> interface on an event object collection. This parameter cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-getpublisherpropertycollection
     */
    GetPublisherPropertyCollection() {
        result := ComCall(34, this, "ptr*", &collection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEventObjectCollection(collection)
    }

    /**
     * Retrieves the value of a property stored in the property bag to define subscriber context.
     * @param {BSTR} bstrPropertyName The name of the requested property.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-getsubscriberproperty
     */
    GetSubscriberProperty(bstrPropertyName) {
        if(bstrPropertyName is String) {
            pin := BSTR.Alloc(bstrPropertyName)
            bstrPropertyName := pin.Value
        }

        propertyValue_ := VARIANT()
        result := ComCall(35, this, "ptr", bstrPropertyName, "ptr", propertyValue_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return propertyValue_
    }

    /**
     * Writes a property and its value to the property bag to define subscriber context.
     * @remarks
     * A property bag is used to store information about the events the subscriber needs to be notified about. For example, if a subscriber to a sports ticker is to obtain only baseball scores, it could use the property bag in the subscription object to specify this restriction.
     * @param {BSTR} bstrPropertyName The name of the property whose value is to be written to the property bag. If the property is not in the property bag, this method adds it.
     * @param {Pointer<VARIANT>} propertyValue_ The value of the property to be written to the property bag. If the property is already in the property bag, this method overwrites the current value.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-putsubscriberproperty
     */
    PutSubscriberProperty(bstrPropertyName, propertyValue_) {
        if(bstrPropertyName is String) {
            pin := BSTR.Alloc(bstrPropertyName)
            bstrPropertyName := pin.Value
        }

        result := ComCall(36, this, "ptr", bstrPropertyName, "ptr", propertyValue_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes a property and its value from the property bag that defines subscriber context.
     * @param {BSTR} bstrPropertyName The name of the property whose value is to be removed from the property bag.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-removesubscriberproperty
     */
    RemoveSubscriberProperty(bstrPropertyName) {
        if(bstrPropertyName is String) {
            pin := BSTR.Alloc(bstrPropertyName)
            bstrPropertyName := pin.Value
        }

        result := ComCall(37, this, "ptr", bstrPropertyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a collection of properties and values stored in the subscriber property bag.
     * @remarks
     * A property bag is used to store information about the events the subscriber needs to be notified about. For example, if a subscriber to a sports ticker is to obtain only baseball scores, it could use the property bag in the subscription object to specify this restriction.
     * @returns {IEventObjectCollection} Address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventobjectcollection">IEventObjectCollection</a> interface on an event object collection. This parameter cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-getsubscriberpropertycollection
     */
    GetSubscriberPropertyCollection() {
        result := ComCall(38, this, "ptr*", &collection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEventObjectCollection(collection)
    }

    /**
     * The identifier for a particular interface for which the subscriber wants to receive events. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-get_interfaceid
     */
    get_InterfaceID() {
        pbstrInterfaceID := BSTR()
        result := ComCall(39, this, "ptr", pbstrInterfaceID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrInterfaceID
    }

    /**
     * The identifier for a particular interface for which the subscriber wants to receive events. (Put)
     * @param {BSTR} bstrInterfaceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventsubscription-put_interfaceid
     */
    put_InterfaceID(bstrInterfaceID) {
        if(bstrInterfaceID is String) {
            pin := BSTR.Alloc(bstrInterfaceID)
            bstrInterfaceID := pin.Value
        }

        result := ComCall(40, this, "ptr", bstrInterfaceID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
