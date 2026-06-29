#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WTS_LICENSE_CAPABILITIES.ahk" { WTS_LICENSE_CAPABILITIES }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Exposes methods used by the Remote Desktop Services service to perform the licensing handshake during a connection sequence.
 * @remarks
 * To avoid a possible deadlock when calling any of the methods on this interface, you should not make any function or method calls that will directly or indirectly result in a Remote Desktop Services API being called. If you need to make any outbound call, you should start a new thread and make the outbound call from the new thread.
 * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nn-wtsprotocol-iwrdsprotocollicenseconnection
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IWRdsProtocolLicenseConnection extends IUnknown {
    /**
     * The interface identifier for IWRdsProtocolLicenseConnection
     * @type {Guid}
     */
    static IID := Guid("{1d6a145f-d095-4424-957a-407fae822d84}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWRdsProtocolLicenseConnection interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        RequestLicensingCapabilities : IntPtr
        SendClientLicense            : IntPtr
        RequestClientLicense         : IntPtr
        ProtocolComplete             : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWRdsProtocolLicenseConnection.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Requests license capabilities from the client.
     * @param {Pointer<Integer>} pcbLicenseCapabilities A pointer to an integer that contains the size of the structure specified by the <i>ppLicensingCapabilities</i> parameter.
     * @returns {WTS_LICENSE_CAPABILITIES} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_license_capabilities">WRDS_LICENSE_CAPABILITIES</a> structure that contains information about the client license capabilities.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocollicenseconnection-requestlicensingcapabilities
     */
    RequestLicensingCapabilities(pcbLicenseCapabilities) {
        pcbLicenseCapabilitiesMarshal := pcbLicenseCapabilities is VarRef ? "uint*" : "ptr"

        ppLicenseCapabilities := WTS_LICENSE_CAPABILITIES()
        result := ComCall(3, this, WTS_LICENSE_CAPABILITIES.Ptr, ppLicenseCapabilities, pcbLicenseCapabilitiesMarshal, pcbLicenseCapabilities, "HRESULT")
        return ppLicenseCapabilities
    }

    /**
     * Sends a license to the client.
     * @remarks
     * For more information about the byte arrays exchanged in this call (such as the <b>SERVER_NEW_LICENSE</b>, <b>SERVER_PLATFORM_CHALLENGE</b>, <b>SERVER_LICENSE_REQUEST</b>, and <b>SERVER_UPGRADE_LICENSE</b> packet structures), see <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-rdpele/3d3f160a-3ab3-4dfb-ba4e-47c27cd79409">[MS-RDPELE]: Remote Desktop Protocol: Licensing Extension</a>.
     * @param {Pointer<Integer>} pClientLicense A pointer to a byte array that contains the license.
     * @param {Integer} cbClientLicense An integer that contains the size, in bytes, of the license.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>. The remote connection manager logs any errors that you return.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocollicenseconnection-sendclientlicense
     */
    SendClientLicense(pClientLicense, cbClientLicense) {
        pClientLicenseMarshal := pClientLicense is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pClientLicenseMarshal, pClientLicense, "uint", cbClientLicense, "HRESULT")
        return result
    }

    /**
     * Requests a license from the client.
     * @remarks
     * For more information about the byte arrays exchanged in this call (such as the <b>CLIENT_LICENSE_INFO</b>, <b>CLIENT_NEW_LICENSE_REQUEST</b>, and <b>CLIENT_PLATFORM_CHALLENGE_RESPONSE</b> packet structures), see <a href="https://docs.microsoft.com/openspecs/windows_protocols/ms-rdpele/3d3f160a-3ab3-4dfb-ba4e-47c27cd79409">[MS-RDPELE]: Remote Desktop Protocol: Licensing Extension</a>.
     * @param {Pointer<Integer>} Reserve1 A pointer to a byte array that contains additional data that can be acted upon by the client.
     * @param {Integer} Reserve2 An integer that contains the size, in bytes, of the data specified by the <i>Reserve1</i> parameter.
     * @param {Pointer<Integer>} pcbClientLicense An integer that contains the size, in bytes, of the request specified by the <i>ppClientLicense</i> parameter.
     * @returns {Integer} A pointer to a byte array that contains the license request.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocollicenseconnection-requestclientlicense
     */
    RequestClientLicense(Reserve1, Reserve2, pcbClientLicense) {
        Reserve1Marshal := Reserve1 is VarRef ? "char*" : "ptr"
        pcbClientLicenseMarshal := pcbClientLicense is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, Reserve1Marshal, Reserve1, "uint", Reserve2, "char*", &ppClientLicense := 0, pcbClientLicenseMarshal, pcbClientLicense, "HRESULT")
        return ppClientLicense
    }

    /**
     * Notifies the protocol whether the licensing process completed successfully.
     * @param {Integer} ulComplete An integer that specifies whether the licensing process ended successfully. A value of 1 means success. All other values indicate failure.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwrdsprotocollicenseconnection-protocolcomplete
     */
    ProtocolComplete(ulComplete) {
        result := ComCall(6, this, "uint", ulComplete, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWRdsProtocolLicenseConnection.IID.Equals(iid)) {
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
