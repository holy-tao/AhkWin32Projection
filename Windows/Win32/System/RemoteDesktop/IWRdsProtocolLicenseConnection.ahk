#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<WTS_LICENSE_CAPABILITIES>} ppLicenseCapabilities 
     * @param {Pointer<UInt32>} pcbLicenseCapabilities 
     * @returns {HRESULT} 
     */
    RequestLicensingCapabilities(ppLicenseCapabilities, pcbLicenseCapabilities) {
        result := ComCall(3, this, "ptr", ppLicenseCapabilities, "uint*", pcbLicenseCapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} pClientLicense 
     * @param {Integer} cbClientLicense 
     * @returns {HRESULT} 
     */
    SendClientLicense(pClientLicense, cbClientLicense) {
        result := ComCall(4, this, "char*", pClientLicense, "uint", cbClientLicense, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} Reserve1 
     * @param {Integer} Reserve2 
     * @param {Pointer<Byte>} ppClientLicense 
     * @param {Pointer<UInt32>} pcbClientLicense 
     * @returns {HRESULT} 
     */
    RequestClientLicense(Reserve1, Reserve2, ppClientLicense, pcbClientLicense) {
        result := ComCall(5, this, "char*", Reserve1, "uint", Reserve2, "char*", ppClientLicense, "uint*", pcbClientLicense, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulComplete 
     * @returns {HRESULT} 
     */
    ProtocolComplete(ulComplete) {
        result := ComCall(6, this, "uint", ulComplete, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
