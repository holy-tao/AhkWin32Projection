#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\IDispatch.ahk" { IDispatch }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Associates a class of event objects with the event interface those objects implement.
 * @see https://learn.microsoft.com/windows/win32/api/eventsys/nn-eventsys-ieventclass
 * @namespace Windows.Win32.System.Com.Events
 */
export default struct IEventClass extends IDispatch {
    /**
     * The interface identifier for IEventClass
     * @type {Guid}
     */
    static IID := Guid("{fb2b72a0-7a68-11d1-88f9-0080c7d771bf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEventClass interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_EventClassID      : IntPtr
        put_EventClassID      : IntPtr
        get_EventClassName    : IntPtr
        put_EventClassName    : IntPtr
        get_OwnerSID          : IntPtr
        put_OwnerSID          : IntPtr
        get_FiringInterfaceID : IntPtr
        put_FiringInterfaceID : IntPtr
        get_Description       : IntPtr
        put_Description       : IntPtr
        get_CustomConfigCLSID : IntPtr
        put_CustomConfigCLSID : IntPtr
        get_TypeLib           : IntPtr
        put_TypeLib           : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEventClass.Vtbl()
        }
        super.__New(implObj, flags)
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
    EventClassName {
        get => this.get_EventClassName()
        set => this.put_EventClassName(value)
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
    FiringInterfaceID {
        get => this.get_FiringInterfaceID()
        set => this.put_FiringInterfaceID(value)
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
    CustomConfigCLSID {
        get => this.get_CustomConfigCLSID()
        set => this.put_CustomConfigCLSID(value)
    }

    /**
     * @type {BSTR} 
     */
    TypeLib {
        get => this.get_TypeLib()
        set => this.put_TypeLib(value)
    }

    /**
     * The CLSID for the event class object. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-get_eventclassid
     */
    get_EventClassID() {
        pbstrEventClassID := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrEventClassID, "HRESULT")
        return pbstrEventClassID
    }

    /**
     * The CLSID for the event class object. (Put)
     * @param {BSTR} bstrEventClassID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-put_eventclassid
     */
    put_EventClassID(bstrEventClassID) {
        bstrEventClassID := bstrEventClassID is String ? BSTR.Alloc(bstrEventClassID).Value : bstrEventClassID

        result := ComCall(8, this, BSTR, bstrEventClassID, "HRESULT")
        return result
    }

    /**
     * The ProgID for the event class object. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-get_eventclassname
     */
    get_EventClassName() {
        pbstrEventClassName := BSTR.Owned()
        result := ComCall(9, this, BSTR.Ptr, pbstrEventClassName, "HRESULT")
        return pbstrEventClassName
    }

    /**
     * The ProgID for the event class object. (Put)
     * @param {BSTR} bstrEventClassName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-put_eventclassname
     */
    put_EventClassName(bstrEventClassName) {
        bstrEventClassName := bstrEventClassName is String ? BSTR.Alloc(bstrEventClassName).Value : bstrEventClassName

        result := ComCall(10, this, BSTR, bstrEventClassName, "HRESULT")
        return result
    }

    /**
     * The security ID of the event class object's creator. This property is supported only for backward compatibility. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-get_ownersid
     */
    get_OwnerSID() {
        pbstrOwnerSID := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pbstrOwnerSID, "HRESULT")
        return pbstrOwnerSID
    }

    /**
     * The security ID of the event class object's creator. This property is supported only for backward compatibility. (Put)
     * @param {BSTR} bstrOwnerSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-put_ownersid
     */
    put_OwnerSID(bstrOwnerSID) {
        bstrOwnerSID := bstrOwnerSID is String ? BSTR.Alloc(bstrOwnerSID).Value : bstrOwnerSID

        result := ComCall(12, this, BSTR, bstrOwnerSID, "HRESULT")
        return result
    }

    /**
     * The ID of the event interface on the event class object. This property is supported only for backward compatibility. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-get_firinginterfaceid
     */
    get_FiringInterfaceID() {
        pbstrFiringInterfaceID := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pbstrFiringInterfaceID, "HRESULT")
        return pbstrFiringInterfaceID
    }

    /**
     * The ID of the event interface on the event class object. This property is supported only for backward compatibility. (Put)
     * @param {BSTR} bstrFiringInterfaceID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-put_firinginterfaceid
     */
    put_FiringInterfaceID(bstrFiringInterfaceID) {
        bstrFiringInterfaceID := bstrFiringInterfaceID is String ? BSTR.Alloc(bstrFiringInterfaceID).Value : bstrFiringInterfaceID

        result := ComCall(14, this, BSTR, bstrFiringInterfaceID, "HRESULT")
        return result
    }

    /**
     * A displayable text description of the event class object. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-get_description
     */
    get_Description() {
        pbstrDescription := BSTR.Owned()
        result := ComCall(15, this, BSTR.Ptr, pbstrDescription, "HRESULT")
        return pbstrDescription
    }

    /**
     * A displayable text description of the event class object. (Put)
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-put_description
     */
    put_Description(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(16, this, BSTR, bstrDescription, "HRESULT")
        return result
    }

    /**
     * The CLSID of a component that can assist in adding properties into the property bag of a subscription object. This property is supported only for backward compatibility. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-get_customconfigclsid
     */
    get_CustomConfigCLSID() {
        pbstrCustomConfigCLSID := BSTR.Owned()
        result := ComCall(17, this, BSTR.Ptr, pbstrCustomConfigCLSID, "HRESULT")
        return pbstrCustomConfigCLSID
    }

    /**
     * The CLSID of a component that can assist in adding properties into the property bag of a subscription object. This property is supported only for backward compatibility. (Put)
     * @param {BSTR} bstrCustomConfigCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-put_customconfigclsid
     */
    put_CustomConfigCLSID(bstrCustomConfigCLSID) {
        bstrCustomConfigCLSID := bstrCustomConfigCLSID is String ? BSTR.Alloc(bstrCustomConfigCLSID).Value : bstrCustomConfigCLSID

        result := ComCall(18, this, BSTR, bstrCustomConfigCLSID, "HRESULT")
        return result
    }

    /**
     * The path of the type library that contains the description of the event interface. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-get_typelib
     */
    get_TypeLib() {
        pbstrTypeLib := BSTR.Owned()
        result := ComCall(19, this, BSTR.Ptr, pbstrTypeLib, "HRESULT")
        return pbstrTypeLib
    }

    /**
     * The path of the type library that contains the description of the event interface. (Put)
     * @param {BSTR} bstrTypeLib 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass-put_typelib
     */
    put_TypeLib(bstrTypeLib) {
        bstrTypeLib := bstrTypeLib is String ? BSTR.Alloc(bstrTypeLib).Value : bstrTypeLib

        result := ComCall(20, this, BSTR, bstrTypeLib, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEventClass.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_EventClassID := CallbackCreate(GetMethod(implObj, "get_EventClassID"), flags, 2)
        this.vtbl.put_EventClassID := CallbackCreate(GetMethod(implObj, "put_EventClassID"), flags, 2)
        this.vtbl.get_EventClassName := CallbackCreate(GetMethod(implObj, "get_EventClassName"), flags, 2)
        this.vtbl.put_EventClassName := CallbackCreate(GetMethod(implObj, "put_EventClassName"), flags, 2)
        this.vtbl.get_OwnerSID := CallbackCreate(GetMethod(implObj, "get_OwnerSID"), flags, 2)
        this.vtbl.put_OwnerSID := CallbackCreate(GetMethod(implObj, "put_OwnerSID"), flags, 2)
        this.vtbl.get_FiringInterfaceID := CallbackCreate(GetMethod(implObj, "get_FiringInterfaceID"), flags, 2)
        this.vtbl.put_FiringInterfaceID := CallbackCreate(GetMethod(implObj, "put_FiringInterfaceID"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.put_Description := CallbackCreate(GetMethod(implObj, "put_Description"), flags, 2)
        this.vtbl.get_CustomConfigCLSID := CallbackCreate(GetMethod(implObj, "get_CustomConfigCLSID"), flags, 2)
        this.vtbl.put_CustomConfigCLSID := CallbackCreate(GetMethod(implObj, "put_CustomConfigCLSID"), flags, 2)
        this.vtbl.get_TypeLib := CallbackCreate(GetMethod(implObj, "get_TypeLib"), flags, 2)
        this.vtbl.put_TypeLib := CallbackCreate(GetMethod(implObj, "put_TypeLib"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_EventClassID)
        CallbackFree(this.vtbl.put_EventClassID)
        CallbackFree(this.vtbl.get_EventClassName)
        CallbackFree(this.vtbl.put_EventClassName)
        CallbackFree(this.vtbl.get_OwnerSID)
        CallbackFree(this.vtbl.put_OwnerSID)
        CallbackFree(this.vtbl.get_FiringInterfaceID)
        CallbackFree(this.vtbl.put_FiringInterfaceID)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.put_Description)
        CallbackFree(this.vtbl.get_CustomConfigCLSID)
        CallbackFree(this.vtbl.put_CustomConfigCLSID)
        CallbackFree(this.vtbl.get_TypeLib)
        CallbackFree(this.vtbl.put_TypeLib)
    }
}
