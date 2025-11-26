#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\Variant\VARIANT.ahk
#Include .\IEventObjectCollection.ahk
#Include ..\IDispatch.ahk

/**
 * Registers, modifies, removes, and provides information about an event publisher.
 * @see https://docs.microsoft.com/windows/win32/api//eventsys/nn-eventsys-ieventpublisher
 * @namespace Windows.Win32.System.Com.Events
 * @version v4.0.30319
 */
class IEventPublisher extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEventPublisher
     * @type {Guid}
     */
    static IID => Guid("{e341516b-2e32-11d1-9964-00c04fbbb345}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PublisherID", "put_PublisherID", "get_PublisherName", "put_PublisherName", "get_PublisherType", "put_PublisherType", "get_OwnerSID", "put_OwnerSID", "get_Description", "put_Description", "GetDefaultProperty", "PutDefaultProperty", "RemoveDefaultProperty", "GetDefaultPropertyCollection"]

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
    PublisherName {
        get => this.get_PublisherName()
        set => this.put_PublisherName(value)
    }

    /**
     * @type {BSTR} 
     */
    PublisherType {
        get => this.get_PublisherType()
        set => this.put_PublisherType(value)
    }

    /**
     * @type {BSTR} 
     */
    OwnerSID {
        get => this.get_OwnerSID()
        set => this.put_OwnerSID(value)
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
        set => this.put_Description(value)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_PublisherID() {
        pbstrPublisherID := BSTR()
        result := ComCall(7, this, "ptr", pbstrPublisherID, "HRESULT")
        return pbstrPublisherID
    }

    /**
     * 
     * @param {BSTR} bstrPublisherID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-put_publisherid
     */
    put_PublisherID(bstrPublisherID) {
        bstrPublisherID := bstrPublisherID is String ? BSTR.Alloc(bstrPublisherID).Value : bstrPublisherID

        result := ComCall(8, this, "ptr", bstrPublisherID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-get_publishername
     */
    get_PublisherName() {
        pbstrPublisherName := BSTR()
        result := ComCall(9, this, "ptr", pbstrPublisherName, "HRESULT")
        return pbstrPublisherName
    }

    /**
     * 
     * @param {BSTR} bstrPublisherName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-put_publishername
     */
    put_PublisherName(bstrPublisherName) {
        bstrPublisherName := bstrPublisherName is String ? BSTR.Alloc(bstrPublisherName).Value : bstrPublisherName

        result := ComCall(10, this, "ptr", bstrPublisherName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-get_publishertype
     */
    get_PublisherType() {
        pbstrPublisherType := BSTR()
        result := ComCall(11, this, "ptr", pbstrPublisherType, "HRESULT")
        return pbstrPublisherType
    }

    /**
     * 
     * @param {BSTR} bstrPublisherType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-put_publishertype
     */
    put_PublisherType(bstrPublisherType) {
        bstrPublisherType := bstrPublisherType is String ? BSTR.Alloc(bstrPublisherType).Value : bstrPublisherType

        result := ComCall(12, this, "ptr", bstrPublisherType, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-get_ownersid
     */
    get_OwnerSID() {
        pbstrOwnerSID := BSTR()
        result := ComCall(13, this, "ptr", pbstrOwnerSID, "HRESULT")
        return pbstrOwnerSID
    }

    /**
     * 
     * @param {BSTR} bstrOwnerSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-put_ownersid
     */
    put_OwnerSID(bstrOwnerSID) {
        bstrOwnerSID := bstrOwnerSID is String ? BSTR.Alloc(bstrOwnerSID).Value : bstrOwnerSID

        result := ComCall(14, this, "ptr", bstrOwnerSID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-get_description
     */
    get_Description() {
        pbstrDescription := BSTR()
        result := ComCall(15, this, "ptr", pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(16, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-getdefaultproperty
     */
    GetDefaultProperty(bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        propertyValue := VARIANT()
        result := ComCall(17, this, "ptr", bstrPropertyName, "ptr", propertyValue, "HRESULT")
        return propertyValue
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @param {Pointer<VARIANT>} propertyValue 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-putdefaultproperty
     */
    PutDefaultProperty(bstrPropertyName, propertyValue) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(18, this, "ptr", bstrPropertyName, "ptr", propertyValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrPropertyName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-removedefaultproperty
     */
    RemoveDefaultProperty(bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(19, this, "ptr", bstrPropertyName, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IEventObjectCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-getdefaultpropertycollection
     */
    GetDefaultPropertyCollection() {
        result := ComCall(20, this, "ptr*", &collection := 0, "HRESULT")
        return IEventObjectCollection(collection)
    }
}
