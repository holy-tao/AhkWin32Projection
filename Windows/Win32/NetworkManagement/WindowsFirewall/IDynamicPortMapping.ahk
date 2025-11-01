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
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_ExternalIPAddress(pVal) {
        result := ComCall(7, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_RemoteHost(pVal) {
        result := ComCall(8, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_ExternalPort(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(9, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Protocol(pVal) {
        result := ComCall(10, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_InternalPort(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_InternalClient(pVal) {
        result := ComCall(12, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pVal 
     * @returns {HRESULT} 
     */
    get_Enabled(pVal) {
        result := ComCall(13, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pVal 
     * @returns {HRESULT} 
     */
    get_Description(pVal) {
        result := ComCall(14, this, "ptr", pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pVal 
     * @returns {HRESULT} 
     */
    get_LeaseDuration(pVal) {
        pValMarshal := pVal is VarRef ? "int*" : "ptr"

        result := ComCall(15, this, pValMarshal, pVal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} lLeaseDurationDesired 
     * @param {Pointer<Integer>} pLeaseDurationReturned 
     * @returns {HRESULT} 
     */
    RenewLease(lLeaseDurationDesired, pLeaseDurationReturned) {
        pLeaseDurationReturnedMarshal := pLeaseDurationReturned is VarRef ? "int*" : "ptr"

        result := ComCall(16, this, "int", lLeaseDurationDesired, pLeaseDurationReturnedMarshal, pLeaseDurationReturned, "HRESULT")
        return result
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
