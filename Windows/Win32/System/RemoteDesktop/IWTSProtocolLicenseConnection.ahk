#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<WTS_LICENSE_CAPABILITIES>} ppLicenseCapabilities 
     * @param {Pointer<Integer>} pcbLicenseCapabilities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollicenseconnection-requestlicensingcapabilities
     */
    RequestLicensingCapabilities(ppLicenseCapabilities, pcbLicenseCapabilities) {
        pcbLicenseCapabilitiesMarshal := pcbLicenseCapabilities is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", ppLicenseCapabilities, pcbLicenseCapabilitiesMarshal, pcbLicenseCapabilities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pClientLicense 
     * @param {Integer} cbClientLicense 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollicenseconnection-sendclientlicense
     */
    SendClientLicense(pClientLicense, cbClientLicense) {
        pClientLicenseMarshal := pClientLicense is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, pClientLicenseMarshal, pClientLicense, "uint", cbClientLicense, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} Reserve1 
     * @param {Integer} Reserve2 
     * @param {Pointer<Integer>} ppClientLicense 
     * @param {Pointer<Integer>} pcbClientLicense 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollicenseconnection-requestclientlicense
     */
    RequestClientLicense(Reserve1, Reserve2, ppClientLicense, pcbClientLicense) {
        Reserve1Marshal := Reserve1 is VarRef ? "char*" : "ptr"
        ppClientLicenseMarshal := ppClientLicense is VarRef ? "char*" : "ptr"
        pcbClientLicenseMarshal := pcbClientLicense is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, Reserve1Marshal, Reserve1, "uint", Reserve2, ppClientLicenseMarshal, ppClientLicense, pcbClientLicenseMarshal, pcbClientLicense, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulComplete 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wtsprotocol/nf-wtsprotocol-iwtsprotocollicenseconnection-protocolcomplete
     */
    ProtocolComplete(ulComplete) {
        result := ComCall(6, this, "uint", ulComplete, "HRESULT")
        return result
    }
}
