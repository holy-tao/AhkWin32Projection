#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WTS_LICENSE_CAPABILITIES.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Exposes methods used by the Remote Desktop Services service to perform the licensing handshake during a connection sequence.
 * @remarks
 * 
 * To avoid a possible deadlock when calling any of the methods on this interface, you should not make any function or method calls that will directly or indirectly result in a Remote Desktop Services API being called. If you need to make any outbound call, you should start a new thread and make the outbound call from the new thread.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwrdsprotocollicenseconnection
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWRdsProtocolLicenseConnection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWRdsProtocolLicenseConnection
     * @type {Guid}
     */
    static IID => Guid("{1d6a145f-d095-4424-957a-407fae822d84}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["RequestLicensingCapabilities", "SendClientLicense", "RequestClientLicense", "ProtocolComplete"]

    /**
     * Requests license capabilities from the client.
     * @param {Pointer<Integer>} pcbLicenseCapabilities A pointer to an integer that contains the size of the structure specified by the <i>ppLicensingCapabilities</i> parameter.
     * @returns {WTS_LICENSE_CAPABILITIES} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_license_capabilities">WRDS_LICENSE_CAPABILITIES</a> structure that contains information about the client license capabilities.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocollicenseconnection-requestlicensingcapabilities
     */
    RequestLicensingCapabilities(pcbLicenseCapabilities) {
        pcbLicenseCapabilitiesMarshal := pcbLicenseCapabilities is VarRef ? "uint*" : "ptr"

        ppLicenseCapabilities := WTS_LICENSE_CAPABILITIES()
        result := ComCall(3, this, "ptr", ppLicenseCapabilities, pcbLicenseCapabilitiesMarshal, pcbLicenseCapabilities, "HRESULT")
        return ppLicenseCapabilities
    }

    /**
     * Sends a license to the client.
     * @param {Pointer<Integer>} pClientLicense A pointer to a byte array that contains the license.
     * @param {Integer} cbClientLicense An integer that contains the size, in bytes, of the license.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>. The remote connection manager logs any errors that you return.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocollicenseconnection-sendclientlicense
     */
    SendClientLicense(pClientLicense, cbClientLicense) {
        pClientLicenseMarshal := pClientLicense is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pClientLicenseMarshal, pClientLicense, "uint", cbClientLicense, "HRESULT")
        return result
    }

    /**
     * Requests a license from the client.
     * @param {Pointer<Integer>} Reserve1 A pointer to a byte array that contains additional data that can be acted upon by the client.
     * @param {Integer} Reserve2 An integer that contains the size, in bytes, of the data specified by the <i>Reserve1</i> parameter.
     * @param {Pointer<Integer>} pcbClientLicense An integer that contains the size, in bytes, of the request specified by the <i>ppClientLicense</i> parameter.
     * @returns {Integer} A pointer to a byte array that contains the license request.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocollicenseconnection-requestclientlicense
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
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwrdsprotocollicenseconnection-protocolcomplete
     */
    ProtocolComplete(ulComplete) {
        result := ComCall(6, this, "uint", ulComplete, "HRESULT")
        return result
    }
}
