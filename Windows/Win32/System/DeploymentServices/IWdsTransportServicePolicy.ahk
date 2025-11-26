#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IWdsTransportCacheable.ahk

/**
 * Represents the service policy part of the WDS transport server's configuration.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportservicepolicy
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportServicePolicy extends IWdsTransportCacheable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportServicePolicy
     * @type {Guid}
     */
    static IID => Guid("{b9468578-9f2b-48cc-b27a-a60799c2750c}")

    /**
     * The class identifier for WdsTransportServicePolicy
     * @type {Guid}
     */
    static CLSID => Guid("{65aceadc-2f0b-4f43-9f4d-811865d8cead}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IpAddressSource", "put_IpAddressSource", "get_StartIpAddress", "put_StartIpAddress", "get_EndIpAddress", "put_EndIpAddress", "get_StartPort", "put_StartPort", "get_EndPort", "put_EndPort", "get_NetworkProfile", "put_NetworkProfile"]

    /**
     * @type {Integer} 
     */
    StartPort {
        get => this.get_StartPort()
        set => this.put_StartPort(value)
    }

    /**
     * @type {Integer} 
     */
    EndPort {
        get => this.get_EndPort()
        set => this.put_EndPort(value)
    }

    /**
     * @type {Integer} 
     */
    NetworkProfile {
        get => this.get_NetworkProfile()
        set => this.put_NetworkProfile(value)
    }

    /**
     * Enables a WDS client computer to configure, for a specified type of IP address, the IP address source from which the WDS transport server obtains a multicast address.
     * @param {Integer} AddressType 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-get_ipaddresssource
     */
    get_IpAddressSource(AddressType) {
        result := ComCall(11, this, "int", AddressType, "int*", &pSourceType := 0, "HRESULT")
        return pSourceType
    }

    /**
     * Enables a WDS client computer to configure, for a specified type of IP address, the IP address source from which the WDS transport server obtains a multicast address.
     * @param {Integer} AddressType 
     * @param {Integer} SourceType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-put_ipaddresssource
     */
    put_IpAddressSource(AddressType, SourceType) {
        result := ComCall(12, this, "int", AddressType, "int", SourceType, "HRESULT")
        return result
    }

    /**
     * Enables a WDS client computer to configure the start of a multicast IP address range for a specified type of IP address.
     * @remarks
     * 
     * When setting the start IP address, this property validates that it is a valid multicast IP address for the specified type of IP address.
     * 
     * 
     * @param {Integer} AddressType 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-get_startipaddress
     */
    get_StartIpAddress(AddressType) {
        pbszStartIpAddress := BSTR()
        result := ComCall(13, this, "int", AddressType, "ptr", pbszStartIpAddress, "HRESULT")
        return pbszStartIpAddress
    }

    /**
     * Enables a WDS client computer to configure the start of a multicast IP address range for a specified type of IP address.
     * @remarks
     * 
     * When setting the start IP address, this property validates that it is a valid multicast IP address for the specified type of IP address.
     * 
     * 
     * @param {Integer} AddressType 
     * @param {BSTR} bszStartIpAddress 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-put_startipaddress
     */
    put_StartIpAddress(AddressType, bszStartIpAddress) {
        bszStartIpAddress := bszStartIpAddress is String ? BSTR.Alloc(bszStartIpAddress).Value : bszStartIpAddress

        result := ComCall(14, this, "int", AddressType, "ptr", bszStartIpAddress, "HRESULT")
        return result
    }

    /**
     * Enables a WDS client computer to configure the end of a multicast IP address range for a specified type of IP address.
     * @remarks
     * 
     * When setting the end IP address, this property validates that it is a valid multicast IP address for the specified type of IP address.
     * 
     * 
     * @param {Integer} AddressType 
     * @returns {BSTR} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-get_endipaddress
     */
    get_EndIpAddress(AddressType) {
        pbszEndIpAddress := BSTR()
        result := ComCall(15, this, "int", AddressType, "ptr", pbszEndIpAddress, "HRESULT")
        return pbszEndIpAddress
    }

    /**
     * Enables a WDS client computer to configure the end of a multicast IP address range for a specified type of IP address.
     * @remarks
     * 
     * When setting the end IP address, this property validates that it is a valid multicast IP address for the specified type of IP address.
     * 
     * 
     * @param {Integer} AddressType 
     * @param {BSTR} bszEndIpAddress 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-put_endipaddress
     */
    put_EndIpAddress(AddressType, bszEndIpAddress) {
        bszEndIpAddress := bszEndIpAddress is String ? BSTR.Alloc(bszEndIpAddress).Value : bszEndIpAddress

        result := ComCall(16, this, "int", AddressType, "ptr", bszEndIpAddress, "HRESULT")
        return result
    }

    /**
     * Enables a WDS client computer to configure the start of a UDP port range that is used by WDS transport services.
     * @remarks
     * 
     * When setting the UDP start port, this property validates that it is a valid value.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-get_startport
     */
    get_StartPort() {
        result := ComCall(17, this, "uint*", &pulStartPort := 0, "HRESULT")
        return pulStartPort
    }

    /**
     * Enables a WDS client computer to configure the start of a UDP port range that is used by WDS transport services.
     * @remarks
     * 
     * When setting the UDP start port, this property validates that it is a valid value.
     * 
     * 
     * @param {Integer} ulStartPort 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-put_startport
     */
    put_StartPort(ulStartPort) {
        result := ComCall(18, this, "uint", ulStartPort, "HRESULT")
        return result
    }

    /**
     * Enables a WDS client computer to configure the end of a UDP port range that is used by WDS transport services.
     * @remarks
     * 
     * When setting the UDP end port, this property validates that it is a valid value.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-get_endport
     */
    get_EndPort() {
        result := ComCall(19, this, "uint*", &pulEndPort := 0, "HRESULT")
        return pulEndPort
    }

    /**
     * Enables a WDS client computer to configure the end of a UDP port range that is used by WDS transport services.
     * @remarks
     * 
     * When setting the UDP end port, this property validates that it is a valid value.
     * 
     * 
     * @param {Integer} ulEndPort 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-put_endport
     */
    put_EndPort(ulEndPort) {
        result := ComCall(20, this, "uint", ulEndPort, "HRESULT")
        return result
    }

    /**
     * Enables a client computer to configure the network profile that is used by the WDS Transport Server.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-get_networkprofile
     */
    get_NetworkProfile() {
        result := ComCall(21, this, "int*", &pProfileType := 0, "HRESULT")
        return pProfileType
    }

    /**
     * Enables a client computer to configure the network profile that is used by the WDS Transport Server.
     * @param {Integer} ProfileType 
     * @returns {HRESULT} 
     * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-put_networkprofile
     */
    put_NetworkProfile(ProfileType) {
        result := ComCall(22, this, "int", ProfileType, "HRESULT")
        return result
    }
}
