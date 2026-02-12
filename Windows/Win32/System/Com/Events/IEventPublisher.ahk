#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\Variant\VARIANT.ahk
#Include .\IEventObjectCollection.ahk
#Include ..\IDispatch.ahk

/**
 * Registers, modifies, removes, and provides information about an event publisher.
 * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nn-eventsys-ieventpublisher
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
        result := ComCall(7, this, "ptr", pbstrPublisherID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrPublisherID
    }

    /**
     * The identifier for the event publisher.
     * @param {BSTR} bstrPublisherID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventpublisher-put_publisherid
     */
    put_PublisherID(bstrPublisherID) {
        if(bstrPublisherID is String) {
            pin := BSTR.Alloc(bstrPublisherID)
            bstrPublisherID := pin.Value
        }

        result := ComCall(8, this, "ptr", bstrPublisherID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The display name for the event publisher. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventpublisher-get_publishername
     */
    get_PublisherName() {
        pbstrPublisherName := BSTR()
        result := ComCall(9, this, "ptr", pbstrPublisherName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrPublisherName
    }

    /**
     * The display name for the event publisher. (Put)
     * @param {BSTR} bstrPublisherName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventpublisher-put_publishername
     */
    put_PublisherName(bstrPublisherName) {
        if(bstrPublisherName is String) {
            pin := BSTR.Alloc(bstrPublisherName)
            bstrPublisherName := pin.Value
        }

        result := ComCall(10, this, "ptr", bstrPublisherName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The optional administrative group for the event publisher. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventpublisher-get_publishertype
     */
    get_PublisherType() {
        pbstrPublisherType := BSTR()
        result := ComCall(11, this, "ptr", pbstrPublisherType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrPublisherType
    }

    /**
     * The optional administrative group for the event publisher. (Put)
     * @param {BSTR} bstrPublisherType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventpublisher-put_publishertype
     */
    put_PublisherType(bstrPublisherType) {
        if(bstrPublisherType is String) {
            pin := BSTR.Alloc(bstrPublisherType)
            bstrPublisherType := pin.Value
        }

        result := ComCall(12, this, "ptr", bstrPublisherType, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The security identifier of the creator of the event publisher. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventpublisher-get_ownersid
     */
    get_OwnerSID() {
        pbstrOwnerSID := BSTR()
        result := ComCall(13, this, "ptr", pbstrOwnerSID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrOwnerSID
    }

    /**
     * The security identifier of the creator of the event publisher. (Put)
     * @param {BSTR} bstrOwnerSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventpublisher-put_ownersid
     */
    put_OwnerSID(bstrOwnerSID) {
        if(bstrOwnerSID is String) {
            pin := BSTR.Alloc(bstrOwnerSID)
            bstrOwnerSID := pin.Value
        }

        result := ComCall(14, this, "ptr", bstrOwnerSID, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The display text for the event publisher. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventpublisher-get_description
     */
    get_Description() {
        pbstrDescription := BSTR()
        result := ComCall(15, this, "ptr", pbstrDescription, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return pbstrDescription
    }

    /**
     * The display text for the event publisher. (Put)
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventpublisher-put_description
     */
    put_Description(bstrDescription) {
        if(bstrDescription is String) {
            pin := BSTR.Alloc(bstrDescription)
            bstrDescription := pin.Value
        }

        result := ComCall(16, this, "ptr", bstrDescription, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a named property and its value from the property bag associated with the event publisher.
     * @remarks
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventpublisher">EventPublisher</a> object includes a property bag that can contain name and value pairs. Objects in the event system, including subscribers, can add, modify, and read these properties.
     * @param {BSTR} bstrPropertyName The name of the property whose value is to be retrieved.
     * @returns {VARIANT} 
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventpublisher-getdefaultproperty
     */
    GetDefaultProperty(bstrPropertyName) {
        if(bstrPropertyName is String) {
            pin := BSTR.Alloc(bstrPropertyName)
            bstrPropertyName := pin.Value
        }

        propertyValue_ := VARIANT()
        result := ComCall(17, this, "ptr", bstrPropertyName, "ptr", propertyValue_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return propertyValue_
    }

    /**
     * Writes a named property and its value to the property bag associated with the event publisher.
     * @remarks
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventpublisher">EventPublisher</a> object includes a property bag that can contain name and value pairs. Objects in the event system, including subscribers, can add, modify, and read these properties.
     * @param {BSTR} bstrPropertyName The name of the property whose value is to be set.
     * @param {Pointer<VARIANT>} propertyValue_ The new value for the property.
     * @returns {HRESULT} The possible return values include E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventpublisher-putdefaultproperty
     */
    PutDefaultProperty(bstrPropertyName, propertyValue_) {
        if(bstrPropertyName is String) {
            pin := BSTR.Alloc(bstrPropertyName)
            bstrPropertyName := pin.Value
        }

        result := ComCall(18, this, "ptr", bstrPropertyName, "ptr", propertyValue_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes a named property and its value from the property bag associated with the event publisher object.
     * @remarks
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventpublisher">EventPublisher</a> object includes a property bag that can contain name and value pairs. Objects in the event system, including subscribers, can add, modify, and read these properties.
     * @param {BSTR} bstrPropertyName The name of the property to be removed.
     * @returns {HRESULT} The possible return values include E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventpublisher-removedefaultproperty
     */
    RemoveDefaultProperty(bstrPropertyName) {
        if(bstrPropertyName is String) {
            pin := BSTR.Alloc(bstrPropertyName)
            bstrPropertyName := pin.Value
        }

        result := ComCall(19, this, "ptr", bstrPropertyName, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates a collection object that enumerates the properties contained in the property bag associated with the event publisher object.
     * @remarks
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventpublisher">EventPublisher</a> object includes a property bag that can contain name and value pairs. Objects in the event system, including subscribers, can add, modify, and read these properties.
     * @returns {IEventObjectCollection} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventobjectcollection">IEventObjectCollection</a> interface pointer on an event object collection. This parameter cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/eventsys/nf-eventsys-ieventpublisher-getdefaultpropertycollection
     */
    GetDefaultPropertyCollection() {
        result := ComCall(20, this, "ptr*", &collection := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IEventObjectCollection(collection)
    }
}
