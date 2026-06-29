#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WTS_LICENSE_CAPABILITIES.ahk" { WTS_LICENSE_CAPABILITIES }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * IWTSProtocolLicenseConnection is no longer available. Instead, use IWRdsProtocolLicenseConnection.
 * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nn-wtsprotocol-iwtsprotocollicenseconnection
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWTSProtocolLicenseConnection extends IUnknown {
    /**
     * The interface identifier for IWTSProtocolLicenseConnection
     * @type {Guid}
     */
    static IID := Guid("{23083765-178c-4079-8e4a-fea6496a4d70}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWTSProtocolLicenseConnection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RequestLicensingCapabilities : IntPtr
        SendClientLicense            : IntPtr
        RequestClientLicense         : IntPtr
        ProtocolComplete             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWTSProtocolLicenseConnection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * IWTSProtocolLicenseConnection::RequestLicensingCapabilities is no longer available. Instead, use IWRdsProtocolLicenseConnection::RequestLicensingCapabilities.
     * @param {Pointer<Integer>} pcbLicenseCapabilities A pointer to an integer that contains the size of the structure specified by the <i>ppLicensingCapabilities</i> parameter.
     * @returns {WTS_LICENSE_CAPABILITIES} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_license_capabilities">WTS_LICENSE_CAPABILITIES</a> structure that contains information about the client license capabilities.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollicenseconnection-requestlicensingcapabilities
     */
    RequestLicensingCapabilities(pcbLicenseCapabilities) {
        pcbLicenseCapabilitiesMarshal := pcbLicenseCapabilities is VarRef ? "uint*" : "ptr"

        ppLicenseCapabilities := WTS_LICENSE_CAPABILITIES()
        result := ComCall(3, this, WTS_LICENSE_CAPABILITIES.Ptr, ppLicenseCapabilities, pcbLicenseCapabilitiesMarshal, pcbLicenseCapabilities, "HRESULT")
        return ppLicenseCapabilities
    }

    /**
     * IWTSProtocolLicenseConnection::SendClientLicense is no longer available. Instead, use IWRdsProtocolLicenseConnection::SendClientLicense.
     * @remarks
     * For more information about the byte arrays exchanged in this call, see <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-rdpele/3d3f160a-3ab3-4dfb-ba4e-47c27cd79409">[MS-RDPELE]: Remote Desktop Protocol: Licensing Extension</a>.
     * @param {Pointer<Integer>} pClientLicense A pointer to a byte array that contains the license.
     * @param {Integer} cbClientLicense An integer that contains the size, in bytes, of the license.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>. The remote connection manager logs any errors that you return.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollicenseconnection-sendclientlicense
     */
    SendClientLicense(pClientLicense, cbClientLicense) {
        pClientLicenseMarshal := pClientLicense is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pClientLicenseMarshal, pClientLicense, "uint", cbClientLicense, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolLicenseConnection::RequestClientLicense is no longer available. Instead, use IWRdsProtocolLicenseConnection::RequestClientLicense.
     * @remarks
     * For more information about the byte arrays exchanged in this call, see <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-rdpele/3d3f160a-3ab3-4dfb-ba4e-47c27cd79409">[MS-RDPELE]: Remote Desktop Protocol: Licensing Extension</a>.
     * @param {Pointer<Integer>} Reserve1 A pointer to a byte array that contains additional data that can be acted upon by the client.
     * @param {Integer} Reserve2 An integer that contains the size, in bytes, of the data specified by the <i>Reserve1</i> parameter.
     * @param {Pointer<Integer>} pcbClientLicense An integer that contains the size, in bytes, of the request specified by the <i>ppClientLicense</i> parameter.
     * @returns {Integer} A pointer to a byte array that contains the license request.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollicenseconnection-requestclientlicense
     */
    RequestClientLicense(Reserve1, Reserve2, pcbClientLicense) {
        Reserve1Marshal := Reserve1 is VarRef ? "char*" : "ptr"
        pcbClientLicenseMarshal := pcbClientLicense is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, Reserve1Marshal, Reserve1, "uint", Reserve2, "char*", &ppClientLicense := 0, pcbClientLicenseMarshal, pcbClientLicense, "HRESULT")
        return ppClientLicense
    }

    /**
     * IWTSProtocolLicenseConnection::ProtocolComplete is no longer available. Instead, use IWRdsProtocolLicenseConnection::ProtocolComplete.
     * @param {Integer} ulComplete An integer that specifies whether the licensing process ended successfully. A value of one (1) means success. All other values indicate failure.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollicenseconnection-protocolcomplete
     */
    ProtocolComplete(ulComplete) {
        result := ComCall(6, this, "uint", ulComplete, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWTSProtocolLicenseConnection.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.RequestLicensingCapabilities := CallbackCreate(GetMethod(implObj, "RequestLicensingCapabilities"), flags, 3)
        this.vtbl.SendClientLicense := CallbackCreate(GetMethod(implObj, "SendClientLicense"), flags, 3)
        this.vtbl.RequestClientLicense := CallbackCreate(GetMethod(implObj, "RequestClientLicense"), flags, 5)
        this.vtbl.ProtocolComplete := CallbackCreate(GetMethod(implObj, "ProtocolComplete"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.RequestLicensingCapabilities)
        CallbackFree(this.vtbl.SendClientLicense)
        CallbackFree(this.vtbl.RequestClientLicense)
        CallbackFree(this.vtbl.ProtocolComplete)
    }
}
