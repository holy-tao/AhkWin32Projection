#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import ".\IEventClass.ahk" { IEventClass }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Used to set and obtain data on event class objects. This interface extends the IEventClass interface.
 * @see https://learn.microsoft.com/windows/win32/api/eventsys/nn-eventsys-ieventclass2
 * @namespace Windows.Win32.System.Com.Events
 */
export default struct IEventClass2 extends IEventClass {
    /**
     * The interface identifier for IEventClass2
     * @type {Guid}
     */
    static IID := Guid("{fb2b72a1-7a68-11d1-88f9-0080c7d771bf}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IEventClass2 interfaces
    */
    struct Vtbl extends IEventClass.Vtbl {
        get_PublisherID                        : IntPtr
        put_PublisherID                        : IntPtr
        get_MultiInterfacePublisherFilterCLSID : IntPtr
        put_MultiInterfacePublisherFilterCLSID : IntPtr
        get_AllowInprocActivation              : IntPtr
        put_AllowInprocActivation              : IntPtr
        get_FireInParallel                     : IntPtr
        put_FireInParallel                     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IEventClass2.Vtbl()
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
    MultiInterfacePublisherFilterCLSID {
        get => this.get_MultiInterfacePublisherFilterCLSID()
        set => this.put_MultiInterfacePublisherFilterCLSID(value)
    }

    /**
     * @type {BOOL} 
     */
    AllowInprocActivation {
        get => this.get_AllowInprocActivation()
        set => this.put_AllowInprocActivation(value)
    }

    /**
     * @type {BOOL} 
     */
    FireInParallel {
        get => this.get_FireInParallel()
        set => this.put_FireInParallel(value)
    }

    /**
     * The CLSID for the event publisher. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass2-get_publisherid
     */
    get_PublisherID() {
        pbstrPublisherID := BSTR.Owned()
        result := ComCall(21, this, BSTR.Ptr, pbstrPublisherID, "HRESULT")
        return pbstrPublisherID
    }

    /**
     * The CLSID for the event publisher. (Put)
     * @param {BSTR} bstrPublisherID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass2-put_publisherid
     */
    put_PublisherID(bstrPublisherID) {
        bstrPublisherID := bstrPublisherID is String ? BSTR.Alloc(bstrPublisherID).Value : bstrPublisherID

        result := ComCall(22, this, BSTR, bstrPublisherID, "HRESULT")
        return result
    }

    /**
     * The CLSID of the object implementing IMultiInterfacePublisherFilter. (Get)
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass2-get_multiinterfacepublisherfilterclsid
     */
    get_MultiInterfacePublisherFilterCLSID() {
        pbstrPubFilCLSID := BSTR.Owned()
        result := ComCall(23, this, BSTR.Ptr, pbstrPubFilCLSID, "HRESULT")
        return pbstrPubFilCLSID
    }

    /**
     * The CLSID of the object implementing IMultiInterfacePublisherFilter. (Put)
     * @param {BSTR} bstrPubFilCLSID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass2-put_multiinterfacepublisherfilterclsid
     */
    put_MultiInterfacePublisherFilterCLSID(bstrPubFilCLSID) {
        bstrPubFilCLSID := bstrPubFilCLSID is String ? BSTR.Alloc(bstrPubFilCLSID).Value : bstrPubFilCLSID

        result := ComCall(24, this, BSTR, bstrPubFilCLSID, "HRESULT")
        return result
    }

    /**
     * Indicates whether the event class can be activated in-process. (Get)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass2-get_allowinprocactivation
     */
    get_AllowInprocActivation() {
        result := ComCall(25, this, BOOL.Ptr, &pfAllowInprocActivation := 0, "HRESULT")
        return pfAllowInprocActivation
    }

    /**
     * Indicates whether the event class can be activated in-process. (Put)
     * @param {BOOL} fAllowInprocActivation 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass2-put_allowinprocactivation
     */
    put_AllowInprocActivation(fAllowInprocActivation) {
        result := ComCall(26, this, BOOL, fAllowInprocActivation, "HRESULT")
        return result
    }

    /**
     * Indicates whether events of this class can be fired in parallel. (Get)
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass2-get_fireinparallel
     */
    get_FireInParallel() {
        result := ComCall(27, this, BOOL.Ptr, &pfFireInParallel := 0, "HRESULT")
        return pfFireInParallel
    }

    /**
     * Indicates whether events of this class can be fired in parallel. (Put)
     * @param {BOOL} fFireInParallel 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/eventsys/nf-eventsys-ieventclass2-put_fireinparallel
     */
    put_FireInParallel(fFireInParallel) {
        result := ComCall(28, this, BOOL, fFireInParallel, "HRESULT")
        return result
    }

    Query(iid) {
        if (IEventClass2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_PublisherID := CallbackCreate(GetMethod(implObj, "get_PublisherID"), flags, 2)
        this.vtbl.put_PublisherID := CallbackCreate(GetMethod(implObj, "put_PublisherID"), flags, 2)
        this.vtbl.get_MultiInterfacePublisherFilterCLSID := CallbackCreate(GetMethod(implObj, "get_MultiInterfacePublisherFilterCLSID"), flags, 2)
        this.vtbl.put_MultiInterfacePublisherFilterCLSID := CallbackCreate(GetMethod(implObj, "put_MultiInterfacePublisherFilterCLSID"), flags, 2)
        this.vtbl.get_AllowInprocActivation := CallbackCreate(GetMethod(implObj, "get_AllowInprocActivation"), flags, 2)
        this.vtbl.put_AllowInprocActivation := CallbackCreate(GetMethod(implObj, "put_AllowInprocActivation"), flags, 2)
        this.vtbl.get_FireInParallel := CallbackCreate(GetMethod(implObj, "get_FireInParallel"), flags, 2)
        this.vtbl.put_FireInParallel := CallbackCreate(GetMethod(implObj, "put_FireInParallel"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_PublisherID)
        CallbackFree(this.vtbl.put_PublisherID)
        CallbackFree(this.vtbl.get_MultiInterfacePublisherFilterCLSID)
        CallbackFree(this.vtbl.put_MultiInterfacePublisherFilterCLSID)
        CallbackFree(this.vtbl.get_AllowInprocActivation)
        CallbackFree(this.vtbl.put_AllowInprocActivation)
        CallbackFree(this.vtbl.get_FireInParallel)
        CallbackFree(this.vtbl.put_FireInParallel)
    }
}
