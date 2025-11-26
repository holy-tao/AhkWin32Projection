#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class IDynamicPortMapping extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDynamicPortMapping
     * @type {Guid}
     */
    static IID => Guid("{4fc80282-23b6-4378-9a27-cd8f17c9400c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ExternalIPAddress", "get_RemoteHost", "get_ExternalPort", "get_Protocol", "get_InternalPort", "get_InternalClient", "get_Enabled", "get_Description", "get_LeaseDuration", "RenewLease", "EditInternalClient", "Enable", "EditDescription", "EditInternalPort"]

    /**
     * @type {BSTR} 
     */
    ExternalIPAddress {
        get => this.get_ExternalIPAddress()
    }

    /**
     * @type {BSTR} 
     */
    RemoteHost {
        get => this.get_RemoteHost()
    }

    /**
     * @type {Integer} 
     */
    ExternalPort {
        get => this.get_ExternalPort()
    }

    /**
     * @type {BSTR} 
     */
    Protocol {
        get => this.get_Protocol()
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
     * @type {Integer} 
     */
    LeaseDuration {
        get => this.get_LeaseDuration()
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ExternalIPAddress() {
        pVal := BSTR()
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_RemoteHost() {
        pVal := BSTR()
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ExternalPort() {
        result := ComCall(9, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Protocol() {
        pVal := BSTR()
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InternalPort() {
        result := ComCall(11, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_InternalClient() {
        pVal := BSTR()
        result := ComCall(12, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_Enabled() {
        result := ComCall(13, this, "short*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_Description() {
        pVal := BSTR()
        result := ComCall(14, this, "ptr", pVal, "HRESULT")
        return pVal
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_LeaseDuration() {
        result := ComCall(15, this, "int*", &pVal := 0, "HRESULT")
        return pVal
    }

    /**
     * 
     * @param {Integer} lLeaseDurationDesired 
     * @returns {Integer} 
     */
    RenewLease(lLeaseDurationDesired) {
        result := ComCall(16, this, "int", lLeaseDurationDesired, "int*", &pLeaseDurationReturned := 0, "HRESULT")
        return pLeaseDurationReturned
    }

    /**
     * 
     * @param {BSTR} bstrInternalClient 
     * @returns {HRESULT} 
     */
    EditInternalClient(bstrInternalClient) {
        bstrInternalClient := bstrInternalClient is String ? BSTR.Alloc(bstrInternalClient).Value : bstrInternalClient

        result := ComCall(17, this, "ptr", bstrInternalClient, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} vb 
     * @returns {HRESULT} 
     */
    Enable(vb) {
        result := ComCall(18, this, "short", vb, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDescription 
     * @returns {HRESULT} 
     */
    EditDescription(bstrDescription) {
        bstrDescription := bstrDescription is String ? BSTR.Alloc(bstrDescription).Value : bstrDescription

        result := ComCall(19, this, "ptr", bstrDescription, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lInternalPort 
     * @returns {HRESULT} 
     */
    EditInternalPort(lInternalPort) {
        result := ComCall(20, this, "int", lInternalPort, "HRESULT")
        return result
    }
}
