#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\IDispatch.ahk" { IDispatch }
#Import ".\IEventObjectCollection.ahk" { IEventObjectCollection }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\IUnknown.ahk" { IUnknown }
#Import "..\..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Specifies information about the relationship between an event subscriber and an event to which it is subscribing. It is used by publisher filters.
 * @see https://learn.microsoft.com/windows/win32/api/eventsys/nn-eventsys-ieventsubscription
 * @namespace Windows.Win32.System.Com.Events
 */
export default struct IEventSubscription extends IDispatch {
    /**
     * The interface identifier for IEventSubscription
     * @type {Guid}
     */
    static IID := Guid("{4a6b0e15-2e38-11d1-9965-00c04fbbb345}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEventSubscription interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_SubscriptionID              : IntPtr
        put_SubscriptionID              : IntPtr
        get_SubscriptionName            : IntPtr
        put_SubscriptionName            : IntPtr
        get_PublisherID                 : IntPtr
        put_PublisherID                 : IntPtr
        get_EventClassID                : IntPtr
        put_EventClassID                : IntPtr
        get_MethodName                  : IntPtr
        put_MethodName                  : IntPtr
        get_SubscriberCLSID             : IntPtr
        put_SubscriberCLSID             : IntPtr
        get_SubscriberInterface         : IntPtr
        put_SubscriberInterface         : IntPtr
        get_PerUser                     : IntPtr
        put_PerUser                     : IntPtr
        get_OwnerSID                    : IntPtr
        put_OwnerSID                    : IntPtr
        get_Enabled                     : IntPtr
        put_Enabled                     : IntPtr
        get_Description                 : IntPtr
        put_Description                 : IntPtr
        get_MachineName                 : IntPtr
        put_MachineName                 : IntPtr
        GetPublisherProperty            : IntPtr
        PutPublisherProperty            : IntPtr
        RemovePublisherProperty         : IntPtr
        GetPublisherPropertyCollection  : IntPtr
        GetSubscriberProperty           : IntPtr
        PutSubscriberProperty           : IntPtr
        RemoveSubscriberProperty        : IntPtr
        GetSubscriberPropertyCollection : IntPtr
        get_InterfaceID                 : IntPtr
        put_InterfaceID                 : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEventSubscription.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_subscriptionid
     */
    get_SubscriptionID() {
        pbstrSubscriptionID := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrSubscriptionID, "HRESULT")
        return pbstrSubscriptionID
    }

    /**
     * The unique ID for the subscription object. (Put)
     * @param {BSTR} bstrSubscriptionID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_subscriptionid
     */
    put_SubscriptionID(bstrSubscriptionID) {
        bstrSubscriptionID := bstrSubscriptionID is String ? BSTR.Alloc(bstrSubscriptionID).Value : bstrSubscriptionID

        result := ComCall(8, this, BSTR, bstrSubscriptionID, "HRESULT")
        return result
    }

    /**
     * A displayable name for the subscription object. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_subscriptionname
     */
    get_SubscriptionName() {
        pbstrSubscriptionName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrSubscriptionName, "HRESULT")
        return pbstrSubscriptionName
    }

    /**
     * A displayable name for the subscription object. (Put)
     * @param {BSTR} bstrSubscriptionName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_subscriptionname
     */
    put_SubscriptionName(bstrSubscriptionName) {
        bstrSubscriptionName := bstrSubscriptionName is String ? BSTR.Alloc(bstrSubscriptionName).Value : bstrSubscriptionName

        result := ComCall(10, this, BSTR, bstrSubscriptionName, "HRESULT")
        return result
    }

    /**
     * The unique ID of the event publisher. (Get)
     * @remarks
     * Specifying a <b>PublisherID</b> property does not guarantee that a subscriber will not receive events fired by other publishers.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_publisherid
     */
    get_PublisherID() {
        pbstrPublisherID := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrPublisherID, "HRESULT")
        return pbstrPublisherID
    }

    /**
     * The unique ID of the event publisher. (Put)
     * @remarks
     * Specifying a <b>PublisherID</b> property does not guarantee that a subscriber will not receive events fired by other publishers.
     * @param {BSTR} bstrPublisherID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_publisherid
     */
    put_PublisherID(bstrPublisherID) {
        bstrPublisherID := bstrPublisherID is String ? BSTR.Alloc(bstrPublisherID).Value : bstrPublisherID

        result := ComCall(12, this, BSTR, bstrPublisherID, "HRESULT")
        return result
    }

    /**
     * The unique ID of the event class associated with the subscription. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_eventclassid
     */
    get_EventClassID() {
        pbstrEventClassID := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pbstrEventClassID, "HRESULT")
        return pbstrEventClassID
    }

    /**
     * The unique ID of the event class associated with the subscription. (Put)
     * @param {BSTR} bstrEventClassID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_eventclassid
     */
    put_EventClassID(bstrEventClassID) {
        bstrEventClassID := bstrEventClassID is String ? BSTR.Alloc(bstrEventClassID).Value : bstrEventClassID

        result := ComCall(14, this, BSTR, bstrEventClassID, "HRESULT")
        return result
    }

    /**
     * The name of the event method. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_methodname
     */
    get_MethodName() {
        pbstrMethodName := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, pbstrMethodName, "HRESULT")
        return pbstrMethodName
    }

    /**
     * The name of the event method. (Put)
     * @param {BSTR} bstrMethodName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_methodname
     */
    put_MethodName(bstrMethodName) {
        bstrMethodName := bstrMethodName is String ? BSTR.Alloc(bstrMethodName).Value : bstrMethodName

        result := ComCall(16, this, BSTR, bstrMethodName, "HRESULT")
        return result
    }

    /**
     * The CLSID of the subscriber component (for a persistent subscription). (Get)
     * @remarks
     * If not empty, the subscription is persistent and the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsubscription-get_subscriberinterface">SubscriberInterface</a> property must be <b>NULL</b>. This property works in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsubscription-get_machinename">MachineName</a> property in a persistent subscription.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_subscriberclsid
     */
    get_SubscriberCLSID() {
        pbstrSubscriberCLSID := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, pbstrSubscriberCLSID, "HRESULT")
        return pbstrSubscriberCLSID
    }

    /**
     * The CLSID of the subscriber component (for a persistent subscription). (Put)
     * @remarks
     * If not empty, the subscription is persistent and the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsubscription-get_subscriberinterface">SubscriberInterface</a> property must be <b>NULL</b>. This property works in conjunction with the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsubscription-get_machinename">MachineName</a> property in a persistent subscription.
     * @param {BSTR} bstrSubscriberCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_subscriberclsid
     */
    put_SubscriberCLSID(bstrSubscriberCLSID) {
        bstrSubscriberCLSID := bstrSubscriberCLSID is String ? BSTR.Alloc(bstrSubscriberCLSID).Value : bstrSubscriberCLSID

        result := ComCall(18, this, BSTR, bstrSubscriberCLSID, "HRESULT")
        return result
    }

    /**
     * A marshaled pointer to the event interface on the subscriber (for a transient subscription). (Get)
     * @remarks
     * If not <b>NULL</b>, the subscription is transient and the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsubscription-get_subscriberclsid">SubscriberCLSID</a> property must be empty.
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_subscriberinterface
     */
    get_SubscriberInterface() {
        result := ComCall(19, this, "ptr*", &ppSubscriberInterface := 0, "HRESULT")
        return IUnknown(ppSubscriberInterface)
    }

    /**
     * A marshaled pointer to the event interface on the subscriber (for a transient subscription). (Put)
     * @remarks
     * If not <b>NULL</b>, the subscription is transient and the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsubscription-get_subscriberclsid">SubscriberCLSID</a> property must be empty.
     * @param {IUnknown} pSubscriberInterface 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_subscriberinterface
     */
    put_SubscriberInterface(pSubscriberInterface) {
        result := ComCall(20, this, "ptr", pSubscriberInterface, "HRESULT")
        return result
    }

    /**
     * Indicates whether the subscription receives the event only if the owner of the subscription is logged on to the same computer as the publisher. (Get)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_peruser
     */
    get_PerUser() {
        result := ComCall(21, this, BOOL.Ptr, &pfPerUser := 0, "HRESULT")
        return pfPerUser
    }

    /**
     * Indicates whether the subscription receives the event only if the owner of the subscription is logged on to the same computer as the publisher. (Put)
     * @param {BOOL} fPerUser 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_peruser
     */
    put_PerUser(fPerUser) {
        result := ComCall(22, this, BOOL, fPerUser, "HRESULT")
        return result
    }

    /**
     * The security ID of the subscription's creator. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_ownersid
     */
    get_OwnerSID() {
        pbstrOwnerSID := BSTR.Owned()
        result := ComCall(23, this, BSTR.Ptr, pbstrOwnerSID, "HRESULT")
        return pbstrOwnerSID
    }

    /**
     * The security ID of the subscription's creator. (Put)
     * @param {BSTR} bstrOwnerSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_ownersid
     */
    put_OwnerSID(bstrOwnerSID) {
        bstrOwnerSID := bstrOwnerSID is String ? BSTR.Alloc(bstrOwnerSID).Value : bstrOwnerSID

        result := ComCall(24, this, BSTR, bstrOwnerSID, "HRESULT")
        return result
    }

    /**
     * Indicates whether the subscription is enabled. (Get)
     * @remarks
     * If a subscription is not enabled, it still appears in collections and can be queried, but events fired by the publisher do not reach the subscriber.
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_enabled
     */
    get_Enabled() {
        result := ComCall(25, this, BOOL.Ptr, &pfEnabled := 0, "HRESULT")
        return pfEnabled
    }

    /**
     * Indicates whether the subscription is enabled. (Put)
     * @remarks
     * If a subscription is not enabled, it still appears in collections and can be queried, but events fired by the publisher do not reach the subscriber.
     * @param {BOOL} fEnabled 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_enabled
     */
    put_Enabled(fEnabled) {
        result := ComCall(26, this, BOOL, fEnabled, "HRESULT")
        return result
    }

    /**
     * A displayable text description of the subscription. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_description
     */
    get_Description() {
        pbstrDescription := BSTR.Owned()
        result := ComCall(27, this, BSTR.Ptr, pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * A displayable text description of the subscription. (Put)
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(28, this, BSTR, bstrDescription, "HRESULT")
        return result
    }

    /**
     * The name of the computer on which the subscriber should be activated (for a persistent subscription). (Get)
     * @remarks
     * This information is only meaningful if the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsubscription-get_subscriberclsid">SubscriberCLSID</a> property is not empty. This property has no effect on transient subscriptions.
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_machinename
     */
    get_MachineName() {
        pbstrMachineName := BSTR.Owned()
        result := ComCall(29, this, BSTR.Ptr, pbstrMachineName, "HRESULT")
        return pbstrMachineName
    }

    /**
     * The name of the computer on which the subscriber should be activated (for a persistent subscription). (Put)
     * @remarks
     * This information is only meaningful if the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsubscription-get_subscriberclsid">SubscriberCLSID</a> property is not empty. This property has no effect on transient subscriptions.
     * @param {BSTR} bstrMachineName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_machinename
     */
    put_MachineName(bstrMachineName) {
        bstrMachineName := bstrMachineName is String ? BSTR.Alloc(bstrMachineName).Value : bstrMachineName

        result := ComCall(30, this, BSTR, bstrMachineName, "HRESULT")
        return result
    }

    /**
     * Retrieves the value of a property stored in the property bag to define publisher context.
     * @remarks
     * Publisher filters should call this method to obtain filter properties stored by the subscription builder.
     * @param {BSTR} bstrPropertyName The name of the requested property.
     * @returns {VARIANT} The value of the requested property.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-getpublisherproperty
     */
    GetPublisherProperty(bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        _propertyValue := VARIANT()
        result := ComCall(31, this, BSTR, bstrPropertyName, VARIANT.Ptr, _propertyValue, "HRESULT")
        return _propertyValue
    }

    /**
     * Writes a property and its value to the property bag to define publisher context.
     * @remarks
     * A property bag is used to store information about the events the subscriber needs to be notified about. For example, if a subscriber to a sports ticker is to obtain only baseball scores, it could use the property bag in the subscription object to specify this restriction.
     * @param {BSTR} bstrPropertyName The name of the property whose value is to be written to the property bag. If the property is not in the property bag, this method adds it.
     * @param {Pointer<VARIANT>} _propertyValue The value of the property to be written to the property bag. If the property is already in the property bag, this method overwrites the current value.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-putpublisherproperty
     */
    PutPublisherProperty(bstrPropertyName, _propertyValue) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(32, this, BSTR, bstrPropertyName, VARIANT.Ptr, _propertyValue, "HRESULT")
        return result
    }

    /**
     * Removes a property and its value from the property bag that defines publisher context.
     * @remarks
     * A property bag is used to store information about the events the subscriber needs to be notified about. For example, if a subscriber to a sports ticker is to obtain only baseball scores, it could use the property bag in the subscription object to specify this restriction.
     * @param {BSTR} bstrPropertyName The name of the property whose value is to be removed from the property bag.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-removepublisherproperty
     */
    RemovePublisherProperty(bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(33, this, BSTR, bstrPropertyName, "HRESULT")
        return result
    }

    /**
     * Retrieves a collection of properties and values stored in the publisher property bag.
     * @remarks
     * A property bag is used to store information about the events the subscriber needs to be notified about. For example, if a subscriber to a sports ticker is to obtain only baseball scores, it could use the property bag in the subscription object to specify this restriction.
     * @returns {IEventObjectCollection} Address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventobjectcollection">IEventObjectCollection</a> interface on an event object collection. This parameter cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-getpublisherpropertycollection
     */
    GetPublisherPropertyCollection() {
        result := ComCall(34, this, "ptr*", &collection := 0, "HRESULT")
        return IEventObjectCollection(collection)
    }

    /**
     * Retrieves the value of a property stored in the property bag to define subscriber context.
     * @param {BSTR} bstrPropertyName The name of the requested property.
     * @returns {VARIANT} The value of the requested property.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-getsubscriberproperty
     */
    GetSubscriberProperty(bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        _propertyValue := VARIANT()
        result := ComCall(35, this, BSTR, bstrPropertyName, VARIANT.Ptr, _propertyValue, "HRESULT")
        return _propertyValue
    }

    /**
     * Writes a property and its value to the property bag to define subscriber context.
     * @remarks
     * A property bag is used to store information about the events the subscriber needs to be notified about. For example, if a subscriber to a sports ticker is to obtain only baseball scores, it could use the property bag in the subscription object to specify this restriction.
     * @param {BSTR} bstrPropertyName The name of the property whose value is to be written to the property bag. If the property is not in the property bag, this method adds it.
     * @param {Pointer<VARIANT>} _propertyValue The value of the property to be written to the property bag. If the property is already in the property bag, this method overwrites the current value.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-putsubscriberproperty
     */
    PutSubscriberProperty(bstrPropertyName, _propertyValue) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(36, this, BSTR, bstrPropertyName, VARIANT.Ptr, _propertyValue, "HRESULT")
        return result
    }

    /**
     * Removes a property and its value from the property bag that defines subscriber context.
     * @param {BSTR} bstrPropertyName The name of the property whose value is to be removed from the property bag.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-removesubscriberproperty
     */
    RemoveSubscriberProperty(bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(37, this, BSTR, bstrPropertyName, "HRESULT")
        return result
    }

    /**
     * Retrieves a collection of properties and values stored in the subscriber property bag.
     * @remarks
     * A property bag is used to store information about the events the subscriber needs to be notified about. For example, if a subscriber to a sports ticker is to obtain only baseball scores, it could use the property bag in the subscription object to specify this restriction.
     * @returns {IEventObjectCollection} Address of a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventobjectcollection">IEventObjectCollection</a> interface on an event object collection. This parameter cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-getsubscriberpropertycollection
     */
    GetSubscriberPropertyCollection() {
        result := ComCall(38, this, "ptr*", &collection := 0, "HRESULT")
        return IEventObjectCollection(collection)
    }

    /**
     * The identifier for a particular interface for which the subscriber wants to receive events. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-get_interfaceid
     */
    get_InterfaceID() {
        pbstrInterfaceID := BSTR.Owned()
        result := ComCall(39, this, BSTR.Ptr, pbstrInterfaceID, "HRESULT")
        return pbstrInterfaceID
    }

    /**
     * The identifier for a particular interface for which the subscriber wants to receive events. (Put)
     * @param {BSTR} bstrInterfaceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventsubscription-put_interfaceid
     */
    put_InterfaceID(bstrInterfaceID) {
        bstrInterfaceID := bstrInterfaceID is String ? BSTR.Alloc(bstrInterfaceID).Value : bstrInterfaceID

        result := ComCall(40, this, BSTR, bstrInterfaceID, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEventSubscription.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_SubscriptionID := CallbackCreate(GetMethod(implObj, "get_SubscriptionID"), flags, 2)
        this.vtbl.put_SubscriptionID := CallbackCreate(GetMethod(implObj, "put_SubscriptionID"), flags, 2)
        this.vtbl.get_SubscriptionName := CallbackCreate(GetMethod(implObj, "get_SubscriptionName"), flags, 2)
        this.vtbl.put_SubscriptionName := CallbackCreate(GetMethod(implObj, "put_SubscriptionName"), flags, 2)
        this.vtbl.get_PublisherID := CallbackCreate(GetMethod(implObj, "get_PublisherID"), flags, 2)
        this.vtbl.put_PublisherID := CallbackCreate(GetMethod(implObj, "put_PublisherID"), flags, 2)
        this.vtbl.get_EventClassID := CallbackCreate(GetMethod(implObj, "get_EventClassID"), flags, 2)
        this.vtbl.put_EventClassID := CallbackCreate(GetMethod(implObj, "put_EventClassID"), flags, 2)
        this.vtbl.get_MethodName := CallbackCreate(GetMethod(implObj, "get_MethodName"), flags, 2)
        this.vtbl.put_MethodName := CallbackCreate(GetMethod(implObj, "put_MethodName"), flags, 2)
        this.vtbl.get_SubscriberCLSID := CallbackCreate(GetMethod(implObj, "get_SubscriberCLSID"), flags, 2)
        this.vtbl.put_SubscriberCLSID := CallbackCreate(GetMethod(implObj, "put_SubscriberCLSID"), flags, 2)
        this.vtbl.get_SubscriberInterface := CallbackCreate(GetMethod(implObj, "get_SubscriberInterface"), flags, 2)
        this.vtbl.put_SubscriberInterface := CallbackCreate(GetMethod(implObj, "put_SubscriberInterface"), flags, 2)
        this.vtbl.get_PerUser := CallbackCreate(GetMethod(implObj, "get_PerUser"), flags, 2)
        this.vtbl.put_PerUser := CallbackCreate(GetMethod(implObj, "put_PerUser"), flags, 2)
        this.vtbl.get_OwnerSID := CallbackCreate(GetMethod(implObj, "get_OwnerSID"), flags, 2)
        this.vtbl.put_OwnerSID := CallbackCreate(GetMethod(implObj, "put_OwnerSID"), flags, 2)
        this.vtbl.get_Enabled := CallbackCreate(GetMethod(implObj, "get_Enabled"), flags, 2)
        this.vtbl.put_Enabled := CallbackCreate(GetMethod(implObj, "put_Enabled"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_MachineName := CallbackCreate(GetMethod(implObj, "get_MachineName"), flags, 2)
        this.vtbl.put_MachineName := CallbackCreate(GetMethod(implObj, "put_MachineName"), flags, 2)
        this.vtbl.GetPublisherProperty := CallbackCreate(GetMethod(implObj, "GetPublisherProperty"), flags, 3)
        this.vtbl.PutPublisherProperty := CallbackCreate(GetMethod(implObj, "PutPublisherProperty"), flags, 3)
        this.vtbl.RemovePublisherProperty := CallbackCreate(GetMethod(implObj, "RemovePublisherProperty"), flags, 2)
        this.vtbl.GetPublisherPropertyCollection := CallbackCreate(GetMethod(implObj, "GetPublisherPropertyCollection"), flags, 2)
        this.vtbl.GetSubscriberProperty := CallbackCreate(GetMethod(implObj, "GetSubscriberProperty"), flags, 3)
        this.vtbl.PutSubscriberProperty := CallbackCreate(GetMethod(implObj, "PutSubscriberProperty"), flags, 3)
        this.vtbl.RemoveSubscriberProperty := CallbackCreate(GetMethod(implObj, "RemoveSubscriberProperty"), flags, 2)
        this.vtbl.GetSubscriberPropertyCollection := CallbackCreate(GetMethod(implObj, "GetSubscriberPropertyCollection"), flags, 2)
        this.vtbl.get_InterfaceID := CallbackCreate(GetMethod(implObj, "get_InterfaceID"), flags, 2)
        this.vtbl.put_InterfaceID := CallbackCreate(GetMethod(implObj, "put_InterfaceID"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_SubscriptionID)
        CallbackFree(this.vtbl.put_SubscriptionID)
        CallbackFree(this.vtbl.get_SubscriptionName)
        CallbackFree(this.vtbl.put_SubscriptionName)
        CallbackFree(this.vtbl.get_PublisherID)
        CallbackFree(this.vtbl.put_PublisherID)
        CallbackFree(this.vtbl.get_EventClassID)
        CallbackFree(this.vtbl.put_EventClassID)
        CallbackFree(this.vtbl.get_MethodName)
        CallbackFree(this.vtbl.put_MethodName)
        CallbackFree(this.vtbl.get_SubscriberCLSID)
        CallbackFree(this.vtbl.put_SubscriberCLSID)
        CallbackFree(this.vtbl.get_SubscriberInterface)
        CallbackFree(this.vtbl.put_SubscriberInterface)
        CallbackFree(this.vtbl.get_PerUser)
        CallbackFree(this.vtbl.put_PerUser)
        CallbackFree(this.vtbl.get_OwnerSID)
        CallbackFree(this.vtbl.put_OwnerSID)
        CallbackFree(this.vtbl.get_Enabled)
        CallbackFree(this.vtbl.put_Enabled)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_MachineName)
        CallbackFree(this.vtbl.put_MachineName)
        CallbackFree(this.vtbl.GetPublisherProperty)
        CallbackFree(this.vtbl.PutPublisherProperty)
        CallbackFree(this.vtbl.RemovePublisherProperty)
        CallbackFree(this.vtbl.GetPublisherPropertyCollection)
        CallbackFree(this.vtbl.GetSubscriberProperty)
        CallbackFree(this.vtbl.PutSubscriberProperty)
        CallbackFree(this.vtbl.RemoveSubscriberProperty)
        CallbackFree(this.vtbl.GetSubscriberPropertyCollection)
        CallbackFree(this.vtbl.get_InterfaceID)
        CallbackFree(this.vtbl.put_InterfaceID)
    }
}
