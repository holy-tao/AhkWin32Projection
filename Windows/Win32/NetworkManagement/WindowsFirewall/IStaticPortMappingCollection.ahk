#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\IStaticPortMapping.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IStaticPortMappingCollection interface provides methods to manage the collection of static port mappings.
 * @see https://docs.microsoft.com/windows/win32/api//natupnp/nn-natupnp-istaticportmappingcollection
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class IStaticPortMappingCollection extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStaticPortMappingCollection
     * @type {Guid}
     */
    static IID => Guid("{cd1f3e77-66d6-4664-82c7-36dbb641d0f1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get__NewEnum", "get_Item", "get_Count", "Remove", "Add"]

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
     * @see https://docs.microsoft.com/windows/win32/api//natupnp/nf-natupnp-istaticportmappingcollection-get__newenum
     */
    get__NewEnum() {
        result := ComCall(7, this, "ptr*", &pVal := 0, "HRESULT")
        return IUnknown(pVal)
    }

    /**
     * The get_Item method retrieves the specified port mapping from the collection.
     * @param {Integer} lExternalPort Specifies the external port for this port mapping.
     * @param {BSTR} bstrProtocol Specifies the protocol. This parameter should be either UDP or TCP.
     * @returns {IStaticPortMapping} Pointer to an interface pointer that points to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/natupnp/nn-natupnp-istaticportmapping">IStaticPortMapping</a> interface for this port mapping.
     * @see https://docs.microsoft.com/windows/win32/api//natupnp/nf-natupnp-istaticportmappingcollection-get_item
     */
    get_Item(lExternalPort, bstrProtocol) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(8, this, "int", lExternalPort, "ptr", bstrProtocol, "ptr*", &ppSPM := 0, "HRESULT")
        return IStaticPortMapping(ppSPM)
    }

    /**
     * The get_Count method retrieves the number of port mappings in the collection.
     * @returns {Integer} Pointer to a <b>long</b> variable that receives the number of port mappings in the collection.
     * @see https://docs.microsoft.com/windows/win32/api//natupnp/nf-natupnp-istaticportmappingcollection-get_count
     */
    get_Count() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * The Remove method removes the specified port mapping from the collection.
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
     * @see https://docs.microsoft.com/windows/win32/api//natupnp/nf-natupnp-istaticportmappingcollection-remove
     */
    Remove(lExternalPort, bstrProtocol) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol

        result := ComCall(10, this, "int", lExternalPort, "ptr", bstrProtocol, "HRESULT")
        return result
    }

    /**
     * The Add method creates a new port mapping and adds it to the collection.
     * @param {Integer} lExternalPort Specifies the external port for this port mapping.
     * @param {BSTR} bstrProtocol Specifies the protocol. This parameter should be either UDP or TCP.
     * @param {Integer} lInternalPort Specifies the internal port for this port mapping.
     * @param {BSTR} bstrInternalClient Specifies the name of the client on the private network that uses this port mapping.
     * @param {VARIANT_BOOL} bEnabled Specifies whether the port is 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/natupnp/nf-natupnp-istaticportmapping-enable">enabled</a>.
     * @param {BSTR} bstrDescription Specifies a description for this port mapping.
     * @returns {IStaticPortMapping} Pointer to an interface pointer that, on successful return, receives a pointer to an 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/natupnp/nn-natupnp-istaticportmapping">IStaticPortMapping</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//natupnp/nf-natupnp-istaticportmappingcollection-add
     */
    Add(lExternalPort, bstrProtocol, lInternalPort, bstrInternalClient, bEnabled, bstrDescription) {
        bstrProtocol := bstrProtocol is String ? BSTR.Alloc(bstrProtocol).Value : bstrProtocol
        bstrInternalClient := bstrInternalClient is String ? BSTR.Alloc(bstrInternalClient).Value : bstrInternalClient
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(11, this, "int", lExternalPort, "ptr", bstrProtocol, "int", lInternalPort, "ptr", bstrInternalClient, "short", bEnabled, "ptr", bstrDescription, "ptr*", &ppSPM := 0, "HRESULT")
        return IStaticPortMapping(ppSPM)
    }
}
