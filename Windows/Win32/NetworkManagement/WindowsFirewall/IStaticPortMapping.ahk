#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The IStaticPortMapping interface provides methods to retrieve and change the information for a particular port mapping.
 * @remarks
 * 
  * The NAT API with UPnP technology uses the combination of the external port and the protocol to identify the port mapping.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//natupnp/nn-natupnp-istaticportmapping
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class IStaticPortMapping extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IStaticPortMapping
     * @type {Guid}
     */
    static IID => Guid("{6f10711f-729b-41e5-93b8-f21d0f818df1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExternalIPAddress", "get_ExternalPort", "get_InternalPort", "get_Protocol", "get_InternalClient", "get_Enabled", "get_Description", "EditInternalClient", "Enable", "EditDescription", "EditInternalPort"]

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-get_externalipaddress
     */
    get_ExternalIPAddress(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-get_externalport
     */
    get_ExternalPort(pVal) {
        result := ComCall(8, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-get_internalport
     */
    get_InternalPort(pVal) {
        result := ComCall(9, this, "int*", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-get_protocol
     */
    get_Protocol(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-get_internalclient
     */
    get_InternalClient(pVal) {
        result := ComCall(11, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-get_enabled
     */
    get_Enabled(pVal) {
        result := ComCall(12, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-get_description
     */
    get_Description(pVal) {
        result := ComCall(13, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrInternalClient 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-editinternalclient
     */
    EditInternalClient(bstrInternalClient) {
        bstrInternalClient := bstrInternalClient is String ? BSTR.Alloc(bstrInternalClient).Value : bstrInternalClient

        result := ComCall(14, this, "ptr", bstrInternalClient, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-enable
     */
    Enable(vb) {
        result := ComCall(15, this, "short", vb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-editdescription
     */
    EditDescription(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(16, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lInternalPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/natupnp/nf-natupnp-istaticportmapping-editinternalport
     */
    EditInternalPort(lInternalPort) {
        result := ComCall(17, this, "int", lInternalPort, "HRESULT")
        return result
    }
}
