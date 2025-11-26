#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WTS_LICENSE_CAPABILITIES.ahk
#Include ..\Com\IUnknown.ahk

/**
 * IWTSProtocolLicenseConnection is no longer available. Instead, use IWRdsProtocolLicenseConnection.
 * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nn-wtsprotocol-iwtsprotocollicenseconnection
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 */
class IWTSProtocolLicenseConnection extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWTSProtocolLicenseConnection
     * @type {Guid}
     */
    static IID => Guid("{23083765-178c-4079-8e4a-fea6496a4d70}")

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
     * IWTSProtocolLicenseConnection::RequestLicensingCapabilities is no longer available. Instead, use IWRdsProtocolLicenseConnection::RequestLicensingCapabilities.
     * @param {Pointer<Integer>} pcbLicenseCapabilities A pointer to an integer that contains the size of the structure specified by the <i>ppLicensingCapabilities</i> parameter.
     * @returns {WTS_LICENSE_CAPABILITIES} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wtsdefs/ns-wtsdefs-wts_license_capabilities">WTS_LICENSE_CAPABILITIES</a> structure that contains information about the client license capabilities.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocollicenseconnection-requestlicensingcapabilities
     */
    RequestLicensingCapabilities(pcbLicenseCapabilities) {
        pcbLicenseCapabilitiesMarshal := pcbLicenseCapabilities is VarRef ? "uint*" : "ptr"

        ppLicenseCapabilities := WTS_LICENSE_CAPABILITIES()
        result := ComCall(3, this, "ptr", ppLicenseCapabilities, pcbLicenseCapabilitiesMarshal, pcbLicenseCapabilities, "HRESULT")
        return ppLicenseCapabilities
    }

    /**
     * IWTSProtocolLicenseConnection::SendClientLicense is no longer available. Instead, use IWRdsProtocolLicenseConnection::SendClientLicense.
     * @param {Pointer<Integer>} pClientLicense A pointer to a byte array that contains the license.
     * @param {Integer} cbClientLicense An integer that contains the size, in bytes, of the license.
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>. The remote connection manager logs any errors that you return.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocollicenseconnection-sendclientlicense
     */
    SendClientLicense(pClientLicense, cbClientLicense) {
        pClientLicenseMarshal := pClientLicense is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pClientLicenseMarshal, pClientLicense, "uint", cbClientLicense, "HRESULT")
        return result
    }

    /**
     * IWTSProtocolLicenseConnection::RequestClientLicense is no longer available. Instead, use IWRdsProtocolLicenseConnection::RequestClientLicense.
     * @param {Pointer<Integer>} Reserve1 A pointer to a byte array that contains additional data that can be acted upon by the client.
     * @param {Integer} Reserve2 An integer that contains the size, in bytes, of the data specified by the <i>Reserve1</i> parameter.
     * @param {Pointer<Integer>} pcbClientLicense An integer that contains the size, in bytes, of the request specified by the <i>ppClientLicense</i> parameter.
     * @returns {Integer} A pointer to a byte array that contains the license request.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocollicenseconnection-requestclientlicense
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
     * @returns {HRESULT} When you are implementing this method, return <b>S_OK</b> if the function succeeds. If it fails, return an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://docs.microsoft.com/windows/win32/api//wtsprotocol/nf-wtsprotocol-iwtsprotocollicenseconnection-protocolcomplete
     */
    ProtocolComplete(ulComplete) {
        result := ComCall(6, this, "uint", ulComplete, "HRESULT")
        return result
    }
}
