#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IStaticPortMapping interface provides methods to retrieve and change the information for a particular port mapping.
 * @remarks
 * The NAT API with UPnP technology uses the combination of the external port and the protocol to identify the port mapping.
 * @see https://learn.microsoft.com/windows/win32/api/natupnp/nn-natupnp-istaticportmapping
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct IStaticPortMapping extends IDispatch {
    /**
     * The interface identifier for IStaticPortMapping
     * @type {Guid}
     */
    static IID := Guid("{6f10711f-729b-41e5-93b8-f21d0f818df1}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IStaticPortMapping interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_ExternalIPAddress : IntPtr
        get_ExternalPort      : IntPtr
        get_InternalPort      : IntPtr
        get_Protocol          : IntPtr
        get_InternalClient    : IntPtr
        get_Enabled           : IntPtr
        get_Description       : IntPtr
        EditInternalClient    : IntPtr
        Enable                : IntPtr
        EditDescription       : IntPtr
        EditInternalPort      : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IStaticPortMapping.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    ExternalIPAddress {
        get => this.get_ExternalIPAddress()
    }

    /**
     * @type {Integer} 
     */
    ExternalPort {
        get => this.get_ExternalPort()
    }

    /**
     * @type {Integer} 
     */
    InternalPort {
        get => this.get_InternalPort()
    }

    /**
     * @type {BSTR} 
     */
    Protocol {
        get => this.get_Protocol()
    }

    /**
     * @type {BSTR} 
     */
    InternalClient {
        get => this.get_InternalClient()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
    }

    /**
     * @type {BSTR} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * The get_ExternalIPAddress method retrieves the external IP address for this port mapping on the NAT computer.
     * @returns {BSTR} Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> variable that receives the external IP address for this port mapping on the NAT computer.
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-get_externalipaddress
     */
    get_ExternalIPAddress() {
        pVal := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * The get_ExternalPort method retrieves the external port on the NAT computer for this port mapping.
     * @returns {Integer} Pointer to a <b>long</b> variable that receives the external port on the NAT computer for this port mapping.
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-get_externalport
     */
    get_ExternalPort() {
        result := ComCall(8, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The get_InternalPort method retrieves the internal port on the client computer for this port mapping.
     * @returns {Integer} Pointer to a <b>long</b> variable that receives the internal port on the client computer for this port mapping.
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-get_internalport
     */
    get_InternalPort() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The get_Protocol method retrieves the protocol associated with this port mapping.
     * @returns {BSTR} Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> variable that, receives the protocol for this port mapping. The protocol is either "UDP" or "TCP".
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-get_protocol
     */
    get_Protocol() {
        pVal := BSTR.Owned()
        result := ComCall(10, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * The get_InternalClient method retrieves the name of the internal client for this port mapping.
     * @returns {BSTR} Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> variable that receives the name of the internal client for this port mapping.
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-get_internalclient
     */
    get_InternalClient() {
        pVal := BSTR.Owned()
        result := ComCall(11, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * The get_Enabled method retrieves whether the port mapping is enabled.
     * @returns {VARIANT_BOOL} Pointer to a <b>VARIANT_BOOL</b> that receives a value that indicates whether the port mapping is enabled. The value is VARIANT_TRUE if the port mapping is enabled, VARIANT_FALSE otherwise.
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-get_enabled
     */
    get_Enabled() {
        result := ComCall(12, this, VARIANT_BOOL.Ptr, &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The get_Description method retrieves the description associated with this port mapping.
     * @returns {BSTR} Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> variable that, on successful return, receives the description associated with this port mapping.
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-get_description
     */
    get_Description() {
        pVal := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pVal, "HRESULT")
        return pVal
    }

    /**
     * The EditInternalClient method sets the internal client property of this port mapping to the specified value.
     * @param {BSTR} bstrInternalClient Specifies the new value for the internal client property of this port mapping.
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
     *  
     * 
     * 
     * <div> </div>
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-editinternalclient
     */
    EditInternalClient(bstrInternalClient) {
        bstrInternalClient := bstrInternalClient is String ? BSTR.Alloc(bstrInternalClient).Value : bstrInternalClient

        result := ComCall(14, this, BSTR, bstrInternalClient, "HRESULT")
        return result
    }

    /**
     * The Enable method enables or disables this port mapping.
     * @param {VARIANT_BOOL} vb Specifies a value that indicates whether the port mapping should be enabled or disabled. To enable the port mapping specify VARIANT_TRUE. To disable the port mapping specify VARIANT_FALSE.
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
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-enable
     */
    Enable(vb) {
        result := ComCall(15, this, VARIANT_BOOL, vb, "HRESULT")
        return result
    }

    /**
     * The EditDescription method sets the description property of this port mapping to the specified value.
     * @param {BSTR} bstrDescription Specifies the new value for the description property of this port mapping.
     * @returns {HRESULT} If the method succeeds the return value is <b>S_OK</b>.
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
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-editdescription
     */
    EditDescription(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(16, this, BSTR, bstrDescription, "HRESULT")
        return result
    }

    /**
     * The EditInternalPort method sets the internal port for this port mapping.
     * @param {Integer} lInternalPort Specifies the new internal port for this port mapping.
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
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-editinternalport
     */
    EditInternalPort(lInternalPort) {
        result := ComCall(17, this, "int", lInternalPort, "HRESULT")
        return result
    }

    Query(iid) {
        if (IStaticPortMapping.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_ExternalIPAddress := CallbackCreate(GetMethod(implObj, "get_ExternalIPAddress"), flags, 2)
        this.vtbl.get_ExternalPort := CallbackCreate(GetMethod(implObj, "get_ExternalPort"), flags, 2)
        this.vtbl.get_InternalPort := CallbackCreate(GetMethod(implObj, "get_InternalPort"), flags, 2)
        this.vtbl.get_Protocol := CallbackCreate(GetMethod(implObj, "get_Protocol"), flags, 2)
        this.vtbl.get_InternalClient := CallbackCreate(GetMethod(implObj, "get_InternalClient"), flags, 2)
        this.vtbl.get_Enabled := CallbackCreate(GetMethod(implObj, "get_Enabled"), flags, 2)
        this.vtbl.get_Description := CallbackCreate(GetMethod(implObj, "get_Description"), flags, 2)
        this.vtbl.EditInternalClient := CallbackCreate(GetMethod(implObj, "EditInternalClient"), flags, 2)
        this.vtbl.Enable := CallbackCreate(GetMethod(implObj, "Enable"), flags, 2)
        this.vtbl.EditDescription := CallbackCreate(GetMethod(implObj, "EditDescription"), flags, 2)
        this.vtbl.EditInternalPort := CallbackCreate(GetMethod(implObj, "EditInternalPort"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_ExternalIPAddress)
        CallbackFree(this.vtbl.get_ExternalPort)
        CallbackFree(this.vtbl.get_InternalPort)
        CallbackFree(this.vtbl.get_Protocol)
        CallbackFree(this.vtbl.get_InternalClient)
        CallbackFree(this.vtbl.get_Enabled)
        CallbackFree(this.vtbl.get_Description)
        CallbackFree(this.vtbl.EditInternalClient)
        CallbackFree(this.vtbl.Enable)
        CallbackFree(this.vtbl.EditDescription)
        CallbackFree(this.vtbl.EditInternalPort)
    }
}
