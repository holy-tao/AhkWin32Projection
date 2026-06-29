#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\IDispatch.ahk" { IDispatch }
#Import ".\IEventObjectCollection.ahk" { IEventObjectCollection }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Variant\VARIANT.ahk" { VARIANT }

/**
 * Registers, modifies, removes, and provides information about an event publisher.
 * @see https://learn.microsoft.com/windows/win32/api/eventsys/nn-eventsys-ieventpublisher
 * @namespace Windows.Win32.System.Com.Events
 */
export default struct IEventPublisher extends IDispatch {
    /**
     * The interface identifier for IEventPublisher
     * @type {Guid}
     */
    static IID := Guid("{e341516b-2e32-11d1-9964-00c04fbbb345}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEventPublisher interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_PublisherID              : IntPtr
        put_PublisherID              : IntPtr
        get_PublisherName            : IntPtr
        put_PublisherName            : IntPtr
        get_PublisherType            : IntPtr
        put_PublisherType            : IntPtr
        get_OwnerSID                 : IntPtr
        put_OwnerSID                 : IntPtr
        get_Description              : IntPtr
        put_Description              : IntPtr
        GetDefaultProperty           : IntPtr
        PutDefaultProperty           : IntPtr
        RemoveDefaultProperty        : IntPtr
        GetDefaultPropertyCollection : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEventPublisher.Vtbl()
        }
        super.__New(implObj, flags)
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
        pbstrPublisherID := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrPublisherID, "HRESULT")
        return pbstrPublisherID
    }

    /**
     * The identifier for the event publisher.
     * @param {BSTR} bstrPublisherID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-put_publisherid
     */
    put_PublisherID(bstrPublisherID) {
        bstrPublisherID := bstrPublisherID is String ? BSTR.Alloc(bstrPublisherID).Value : bstrPublisherID

        result := ComCall(8, this, BSTR, bstrPublisherID, "HRESULT")
        return result
    }

    /**
     * The display name for the event publisher. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-get_publishername
     */
    get_PublisherName() {
        pbstrPublisherName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrPublisherName, "HRESULT")
        return pbstrPublisherName
    }

    /**
     * The display name for the event publisher. (Put)
     * @param {BSTR} bstrPublisherName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-put_publishername
     */
    put_PublisherName(bstrPublisherName) {
        bstrPublisherName := bstrPublisherName is String ? BSTR.Alloc(bstrPublisherName).Value : bstrPublisherName

        result := ComCall(10, this, BSTR, bstrPublisherName, "HRESULT")
        return result
    }

    /**
     * The optional administrative group for the event publisher. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-get_publishertype
     */
    get_PublisherType() {
        pbstrPublisherType := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrPublisherType, "HRESULT")
        return pbstrPublisherType
    }

    /**
     * The optional administrative group for the event publisher. (Put)
     * @param {BSTR} bstrPublisherType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-put_publishertype
     */
    put_PublisherType(bstrPublisherType) {
        bstrPublisherType := bstrPublisherType is String ? BSTR.Alloc(bstrPublisherType).Value : bstrPublisherType

        result := ComCall(12, this, BSTR, bstrPublisherType, "HRESULT")
        return result
    }

    /**
     * The security identifier of the creator of the event publisher. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-get_ownersid
     */
    get_OwnerSID() {
        pbstrOwnerSID := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pbstrOwnerSID, "HRESULT")
        return pbstrOwnerSID
    }

    /**
     * The security identifier of the creator of the event publisher. (Put)
     * @param {BSTR} bstrOwnerSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-put_ownersid
     */
    put_OwnerSID(bstrOwnerSID) {
        bstrOwnerSID := bstrOwnerSID is String ? BSTR.Alloc(bstrOwnerSID).Value : bstrOwnerSID

        result := ComCall(14, this, BSTR, bstrOwnerSID, "HRESULT")
        return result
    }

    /**
     * The display text for the event publisher. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-get_description
     */
    get_Description() {
        pbstrDescription := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * The display text for the event publisher. (Put)
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(16, this, BSTR, bstrDescription, "HRESULT")
        return result
    }

    /**
     * Retrieves a named property and its value from the property bag associated with the event publisher.
     * @remarks
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventpublisher">EventPublisher</a> object includes a property bag that can contain name and value pairs. Objects in the event system, including subscribers, can add, modify, and read these properties.
     * @param {BSTR} bstrPropertyName The name of the property whose value is to be retrieved.
     * @returns {VARIANT} A pointer to the variable that receives the property.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-getdefaultproperty
     */
    GetDefaultProperty(bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        _propertyValue := VARIANT()
        result := ComCall(17, this, BSTR, bstrPropertyName, VARIANT.Ptr, _propertyValue, "HRESULT")
        return _propertyValue
    }

    /**
     * Writes a named property and its value to the property bag associated with the event publisher.
     * @remarks
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventpublisher">EventPublisher</a> object includes a property bag that can contain name and value pairs. Objects in the event system, including subscribers, can add, modify, and read these properties.
     * @param {BSTR} bstrPropertyName The name of the property whose value is to be set.
     * @param {Pointer<VARIANT>} _propertyValue The new value for the property.
     * @returns {HRESULT} The possible return values include E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-putdefaultproperty
     */
    PutDefaultProperty(bstrPropertyName, _propertyValue) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(18, this, BSTR, bstrPropertyName, VARIANT.Ptr, _propertyValue, "HRESULT")
        return result
    }

    /**
     * Removes a named property and its value from the property bag associated with the event publisher object.
     * @remarks
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventpublisher">EventPublisher</a> object includes a property bag that can contain name and value pairs. Objects in the event system, including subscribers, can add, modify, and read these properties.
     * @param {BSTR} bstrPropertyName The name of the property to be removed.
     * @returns {HRESULT} The possible return values include E_INVALIDARG, E_OUTOFMEMORY, E_UNEXPECTED, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-removedefaultproperty
     */
    RemoveDefaultProperty(bstrPropertyName) {
        bstrPropertyName := bstrPropertyName is String ? BSTR.Alloc(bstrPropertyName).Value : bstrPropertyName

        result := ComCall(19, this, BSTR, bstrPropertyName, "HRESULT")
        return result
    }

    /**
     * Creates a collection object that enumerates the properties contained in the property bag associated with the event publisher object.
     * @remarks
     * An <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventpublisher">EventPublisher</a> object includes a property bag that can contain name and value pairs. Objects in the event system, including subscribers, can add, modify, and read these properties.
     * @returns {IEventObjectCollection} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nn-eventsys-ieventobjectcollection">IEventObjectCollection</a> interface pointer on an event object collection. This parameter cannot be <b>NULL</b>.
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventpublisher-getdefaultpropertycollection
     */
    GetDefaultPropertyCollection() {
        result := ComCall(20, this, "ptr*", &collection := 0, "HRESULT")
        return IEventObjectCollection(collection)
    }

    Query(iid) {
        if (IEventPublisher.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PublisherID := CallbackCreate(GetMethod(implObj, "get_PublisherID"), flags, 2)
        this.vtbl.put_PublisherID := CallbackCreate(GetMethod(implObj, "put_PublisherID"), flags, 2)
        this.vtbl.get_PublisherName := CallbackCreate(GetMethod(implObj, "get_PublisherName"), flags, 2)
        this.vtbl.put_PublisherName := CallbackCreate(GetMethod(implObj, "put_PublisherName"), flags, 2)
        this.vtbl.get_PublisherType := CallbackCreate(GetMethod(implObj, "get_PublisherType"), flags, 2)
        this.vtbl.put_PublisherType := CallbackCreate(GetMethod(implObj, "put_PublisherType"), flags, 2)
        this.vtbl.get_OwnerSID := CallbackCreate(GetMethod(implObj, "get_OwnerSID"), flags, 2)
        this.vtbl.put_OwnerSID := CallbackCreate(GetMethod(implObj, "put_OwnerSID"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.GetDefaultProperty := CallbackCreate(GetMethod(implObj, "GetDefaultProperty"), flags, 3)
        this.vtbl.PutDefaultProperty := CallbackCreate(GetMethod(implObj, "PutDefaultProperty"), flags, 3)
        this.vtbl.RemoveDefaultProperty := CallbackCreate(GetMethod(implObj, "RemoveDefaultProperty"), flags, 2)
        this.vtbl.GetDefaultPropertyCollection := CallbackCreate(GetMethod(implObj, "GetDefaultPropertyCollection"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PublisherID)
        CallbackFree(this.vtbl.put_PublisherID)
        CallbackFree(this.vtbl.get_PublisherName)
        CallbackFree(this.vtbl.put_PublisherName)
        CallbackFree(this.vtbl.get_PublisherType)
        CallbackFree(this.vtbl.put_PublisherType)
        CallbackFree(this.vtbl.get_OwnerSID)
        CallbackFree(this.vtbl.put_OwnerSID)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.GetDefaultProperty)
        CallbackFree(this.vtbl.PutDefaultProperty)
        CallbackFree(this.vtbl.RemoveDefaultProperty)
        CallbackFree(this.vtbl.GetDefaultPropertyCollection)
    }
}
