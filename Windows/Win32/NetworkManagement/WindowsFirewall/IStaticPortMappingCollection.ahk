#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IStaticPortMapping.ahk" { IStaticPortMapping }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IStaticPortMappingCollection interface provides methods to manage the collection of static port mappings.
 * @see https://learn.microsoft.com/windows/win32/api/natupnp/nn-natupnp-istaticportmappingcollection
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct IStaticPortMappingCollection extends IDispatch {
    /**
     * The interface identifier for IStaticPortMappingCollection
     * @type {Guid}
     */
    static IID := Guid("{cd1f3e77-66d6-4664-82c7-36dbb641d0f1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStaticPortMappingCollection interfaces
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
            this.vtbl := IStaticPortMappingCollection.Vtbl()
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
     * The get__NewEnum method retrieves an enumerator for the static port mappings collection.
     * @returns {IUnknown} Pointer to an interface pointer that receives a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a> interface for the collection.
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmappingcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * The get_Item method retrieves the specified port mapping from the collection.
     * @remarks
     * The NAT API with UPnP technology uses the combination of the external port and the protocol to identify the port mapping.
     * @param {Integer} lExternalPort Specifies the external port for this port mapping.
     * @param {BSTR} bstrProtocol Specifies the protocol. This parameter should be either UDP or TCP.
     * @returns {IStaticPortMapping} Pointer to an interface pointer that points to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/natupnp/nn-natupnp-istaticportmapping">IStaticPortMapping</a> interface for this port mapping.
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmappingcollection-get_item
     */
    get_Item(lExternalPort, bstrProtocol) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(8, this, "int", lExternalPort, BSTR, bstrProtocol, "ptr*", &ppSPM := 0, "HRESULT")
        return IStaticPortMapping(ppSPM)
    }

    /**
     * The get_Count method retrieves the number of port mappings in the collection.
     * @returns {Integer} Pointer to a <b>long</b> variable that receives the number of port mappings in the collection.
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmappingcollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The Remove method removes the specified port mapping from the collection.
     * @remarks
     * The NAT API with UPnP technology uses the combination of the external port and the protocol to identify the port mapping.
     * @param {Integer} lExternalPort Specifies the external port for this port mapping.
     * @param {BSTR} bstrProtocol Specifies the protocol. This parameter should be either UDP or TCP.
     * @returns {HRESULT} If the method succeeds the return value is S_OK.
     * 
     * If the method fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_ABORT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The operation was aborted.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An unspecified error occurred.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOINTERFACE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified interface is not supported.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A specified method is not implemented.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method was unable to allocate required memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer passed as a parameter is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed for unknown reasons.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmappingcollection-remove
     */
    Remove(lExternalPort, bstrProtocol) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(10, this, "int", lExternalPort, BSTR, bstrProtocol, "HRESULT")
        return result
    }

    /**
     * The Add method creates a new port mapping and adds it to the collection.
     * @remarks
     * The NAT API with UPnP technology uses the combination of the external port and the protocol to identify the port mapping.
     * @param {Integer} lExternalPort Specifies the external port for this port mapping.
     * @param {BSTR} bstrProtocol Specifies the protocol. This parameter should be either UDP or TCP.
     * @param {Integer} lInternalPort Specifies the internal port for this port mapping.
     * @param {BSTR} bstrInternalClient Specifies the name of the client on the private network that uses this port mapping.
     * @param {VARIANT_BOOL} bEnabled Specifies whether the port is 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/natupnp/nf-natupnp-istaticportmapping-enable">enabled</a>.
     * @param {BSTR} bstrDescription Specifies a description for this port mapping.
     * @returns {IStaticPortMapping} Pointer to an interface pointer that, on successful return, receives a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/natupnp/nn-natupnp-istaticportmapping">IStaticPortMapping</a> interface.
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmappingcollection-add
     */
    Add(lExternalPort, bstrProtocol, lInternalPort, bstrInternalClient, bEnabled, bstrDescription) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol
        bstrInternalClient := bstrInternalClient is String ? BSTR.Alloc(bstrInternalClient).Value : bstrInternalClient
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(11, this, "int", lExternalPort, BSTR, bstrProtocol, "int", lInternalPort, BSTR, bstrInternalClient, VARIANT_BOOL, bEnabled, BSTR, bstrDescription, "ptr*", &ppSPM := 0, "HRESULT")
        return IStaticPortMapping(ppSPM)
    }

    Query(iid) {
        if (IStaticPortMappingCollection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get__NewEnum := CallbackCreate(GetMethod(implObj, "get__NewEnum"), flags, 2)
        this.vtbl.get_Item := CallbackCreate(GetMethod(implObj, "get_Item"), flags, 4)
        this.vtbl.get_Count := CallbackCreate(GetMethod(implObj, "get_Count"), flags, 2)
        this.vtbl.Remove := CallbackCreate(GetMethod(implObj, "Remove"), flags, 3)
        this.vtbl.Add := CallbackCreate(GetMethod(implObj, "Add"), flags, 8)
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
