#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IDynamicPortMapping.ahk" { IDynamicPortMapping }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct IDynamicPortMappingCollection extends IDispatch {
    /**
     * The interface identifier for IDynamicPortMappingCollection
     * @type {Guid}
     */
    static IID := Guid("{b60de00f-156e-4e8d-9ec1-3a2342c10899}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDynamicPortMappingCollection interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get__NewEnum : IntPtr
        get_Item     : IntPtr
        get_Count    : IntPtr
        Remove       : IntPtr
        Add          : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDynamicPortMappingCollection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IUnknown} 
     */
    _NewEnum {
        get => this.get__NewEnum()
    }

    /**
     * @type {Integer} 
     */
    Count {
        get => this.get_Count()
    }

    /**
     * 
     * @returns {IUnknown} 
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * 
     * @param {BSTR} bstrRemoteHost 
     * @param {Integer} lExternalPort 
     * @param {BSTR} bstrProtocol 
     * @returns {IDynamicPortMapping} 
     */
    get_Item(bstrRemoteHost, lExternalPort, bstrProtocol) {
        bstrRemoteHost := bstrRemoteHost is String ? BSTR.Alloc(bstrRemoteHost).Value : bstrRemoteHost
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(8, this, BSTR, bstrRemoteHost, "int", lExternalPort, BSTR, bstrProtocol, "ptr*", &ppDPM := 0, "HRESULT")
        return IDynamicPortMapping(ppDPM)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Count() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {BSTR} bstrRemoteHost 
     * @param {Integer} lExternalPort 
     * @param {BSTR} bstrProtocol 
     * @returns {HRESULT} 
     */
    Remove(bstrRemoteHost, lExternalPort, bstrProtocol) {
        bstrRemoteHost := bstrRemoteHost is String ? BSTR.Alloc(bstrRemoteHost).Value : bstrRemoteHost
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(10, this, BSTR, bstrRemoteHost, "int", lExternalPort, BSTR, bstrProtocol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrRemoteHost 
     * @param {Integer} lExternalPort 
     * @param {BSTR} bstrProtocol 
     * @param {Integer} lInternalPort 
     * @param {BSTR} bstrInternalClient 
     * @param {VARIANT_BOOL} bEnabled 
     * @param {BSTR} bstrDescription 
     * @param {Integer} lLeaseDuration 
     * @returns {IDynamicPortMapping} 
     */
    Add(bstrRemoteHost, lExternalPort, bstrProtocol, lInternalPort, bstrInternalClient, bEnabled, bstrDescription, lLeaseDuration) {
        bstrRemoteHost := bstrRemoteHost is String ? BSTR.Alloc(bstrRemoteHost).Value : bstrRemoteHost
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol
        bstrInternalClient := bstrInternalClient is String ? BSTR.Alloc(bstrInternalClient).Value : bstrInternalClient
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(11, this, BSTR, bstrRemoteHost, "int", lExternalPort, BSTR, bstrProtocol, "int", lInternalPort, BSTR, bstrInternalClient, VARIANT_BOOL, bEnabled, BSTR, bstrDescription, "int", lLeaseDuration, "ptr*", &ppDPM := 0, "HRESULT")
        return IDynamicPortMapping(ppDPM)
    }

    Query(iid) {
        if (IDynamicPortMappingCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 5)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 4)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 10)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get__NewEnum)
        CallbackFree(this.vtbl.get_Item)
        CallbackFree(this.vtbl.get_Count)
        CallbackFree(this.vtbl.Remove)
        CallbackFree(this.vtbl.Add)
    }
}
