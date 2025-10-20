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
     * 
     * @param {Pointer<BSTR>} pbstrSubscriptionID 
     * @returns {HRESULT} 
     */
    get_SubscriptionID(pbstrSubscriptionID) {
        result := ComCall(7, this, "ptr", pbstrSubscriptionID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSubscriptionID 
     * @returns {HRESULT} 
     */
    put_SubscriptionID(bstrSubscriptionID) {
        bstrSubscriptionID := bstrSubscriptionID is String ? BSTR.Alloc(bstrSubscriptionID).Value : bstrSubscriptionID

        result := ComCall(8, this, "ptr", bstrSubscriptionID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSubscriptionName 
     * @returns {HRESULT} 
     */
    get_SubscriptionName(pbstrSubscriptionName) {
        result := ComCall(9, this, "ptr", pbstrSubscriptionName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSubscriptionName 
     * @returns {HRESULT} 
     */
    put_SubscriptionName(bstrSubscriptionName) {
        bstrSubscriptionName := bstrSubscriptionName is String ? BSTR.Alloc(bstrSubscriptionName).Value : bstrSubscriptionName

        result := ComCall(10, this, "ptr", bstrSubscriptionName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrPublisherID 
     * @returns {HRESULT} 
     */
    get_PublisherID(pbstrPublisherID) {
        result := ComCall(11, this, "ptr", pbstrPublisherID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPublisherID 
     * @returns {HRESULT} 
     */
    put_PublisherID(bstrPublisherID) {
        bstrPublisherID := bstrPublisherID is String ? BSTR.Alloc(bstrPublisherID).Value : bstrPublisherID

        result := ComCall(12, this, "ptr", bstrPublisherID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrEventClassID 
     * @returns {HRESULT} 
     */
    get_EventClassID(pbstrEventClassID) {
        result := ComCall(13, this, "ptr", pbstrEventClassID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrEventClassID 
     * @returns {HRESULT} 
     */
    put_EventClassID(bstrEventClassID) {
        bstrEventClassID := bstrEventClassID is String ? BSTR.Alloc(bstrEventClassID).Value : bstrEventClassID

        result := ComCall(14, this, "ptr", bstrEventClassID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMethodName 
     * @returns {HRESULT} 
     */
    get_MethodName(pbstrMethodName) {
        result := ComCall(15, this, "ptr", pbstrMethodName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrMethodName 
     * @returns {HRESULT} 
     */
    put_MethodName(bstrMethodName) {
        bstrMethodName := bstrMethodName is String ? BSTR.Alloc(bstrMethodName).Value : bstrMethodName

        result := ComCall(16, this, "ptr", bstrMethodName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrSubscriberCLSID 
     * @returns {HRESULT} 
     */
    get_SubscriberCLSID(pbstrSubscriberCLSID) {
        result := ComCall(17, this, "ptr", pbstrSubscriberCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrSubscriberCLSID 
     * @returns {HRESULT} 
     */
    put_SubscriberCLSID(bstrSubscriberCLSID) {
        bstrSubscriberCLSID := bstrSubscriberCLSID is String ? BSTR.Alloc(bstrSubscriberCLSID).Value : bstrSubscriberCLSID

        result := ComCall(18, this, "ptr", bstrSubscriberCLSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} ppSubscriberInterface 
     * @returns {HRESULT} 
     */
    get_SubscriberInterface(ppSubscriberInterface) {
        result := ComCall(19, this, "ptr", ppSubscriberInterface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IUnknown>} pSubscriberInterface 
     * @returns {HRESULT} 
     */
    put_SubscriberInterface(pSubscriberInterface) {
        result := ComCall(20, this, "ptr", pSubscriberInterface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfPerUser 
     * @returns {HRESULT} 
     */
    get_PerUser(pfPerUser) {
        result := ComCall(21, this, "ptr", pfPerUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fPerUser 
     * @returns {HRESULT} 
     */
    put_PerUser(fPerUser) {
        result := ComCall(22, this, "int", fPerUser, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrOwnerSID 
     * @returns {HRESULT} 
     */
    get_OwnerSID(pbstrOwnerSID) {
        result := ComCall(23, this, "ptr", pbstrOwnerSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrOwnerSID 
     * @returns {HRESULT} 
     */
    put_OwnerSID(bstrOwnerSID) {
        bstrOwnerSID := bstrOwnerSID is String ? BSTR.Alloc(bstrOwnerSID).Value : bstrOwnerSID

        result := ComCall(24, this, "ptr", bstrOwnerSID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEnabled 
     * @returns {HRESULT} 
     */
    get_Enabled(pfEnabled) {
        result := ComCall(25, this, "ptr", pfEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnabled 
     * @returns {HRESULT} 
     */
    put_Enabled(fEnabled) {
        result := ComCall(26, this, "int", fEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrDescription 
     * @returns {HRESULT} 
     */
    get_Description(pbstrDescription) {
        result := ComCall(27, this, "ptr", pbstrDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(28, this, "ptr", bstrDescription, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrMachineName 
     * @returns {HRESULT} 
     */
    get_MachineName(pbstrMachineName) {
        result := ComCall(29, this, "ptr", pbstrMachineName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrMachineName 
     * @returns {HRESULT} 
     */
    put_MachineName(bstrMachineName) {
        bstrMachineName := bstrMachineName is String ? BSTR.Alloc(bstrMachineName).Value : bstrMachineName

        result := ComCall(30, this, "ptr", bstrMachineName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @param {Pointer<VARIANT>} propertyValue 
     * @returns {HRESULT} 
     */
    GetPublisherProperty(bstrPropertyName, propertyValue) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(31, this, "ptr", bstrPropertyName, "ptr", propertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @param {Pointer<VARIANT>} propertyValue 
     * @returns {HRESULT} 
     */
    PutPublisherProperty(bstrPropertyName, propertyValue) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(32, this, "ptr", bstrPropertyName, "ptr", propertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @returns {HRESULT} 
     */
    RemovePublisherProperty(bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(33, this, "ptr", bstrPropertyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEventObjectCollection>} collection 
     * @returns {HRESULT} 
     */
    GetPublisherPropertyCollection(collection) {
        result := ComCall(34, this, "ptr", collection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @param {Pointer<VARIANT>} propertyValue 
     * @returns {HRESULT} 
     */
    GetSubscriberProperty(bstrPropertyName, propertyValue) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(35, this, "ptr", bstrPropertyName, "ptr", propertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @param {Pointer<VARIANT>} propertyValue 
     * @returns {HRESULT} 
     */
    PutSubscriberProperty(bstrPropertyName, propertyValue) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(36, this, "ptr", bstrPropertyName, "ptr", propertyValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @returns {HRESULT} 
     */
    RemoveSubscriberProperty(bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(37, this, "ptr", bstrPropertyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IEventObjectCollection>} collection 
     * @returns {HRESULT} 
     */
    GetSubscriberPropertyCollection(collection) {
        result := ComCall(38, this, "ptr", collection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrInterfaceID 
     * @returns {HRESULT} 
     */
    get_InterfaceID(pbstrInterfaceID) {
        result := ComCall(39, this, "ptr", pbstrInterfaceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} bstrInterfaceID 
     * @returns {HRESULT} 
     */
    put_InterfaceID(bstrInterfaceID) {
        bstrInterfaceID := bstrInterfaceID is String ? BSTR.Alloc(bstrInterfaceID).Value : bstrInterfaceID

        result := ComCall(40, this, "ptr", bstrInterfaceID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
