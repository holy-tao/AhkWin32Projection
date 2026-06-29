#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\WDSTRANSPORT_NETWORK_PROFILE_TYPE.ahk" { WDSTRANSPORT_NETWORK_PROFILE_TYPE }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IWdsTransportCacheable.ahk" { IWdsTransportCacheable }
#Import ".\WDSTRANSPORT_IP_ADDRESS_TYPE.ahk" { WDSTRANSPORT_IP_ADDRESS_TYPE }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE.ahk" { WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE }

/**
 * Represents the service policy part of the WDS transport server's configuration.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportservicepolicy
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportServicePolicy extends IWdsTransportCacheable {
    /**
     * The interface identifier for IWdsTransportServicePolicy
     * @type {Guid}
     */
    static IID := Guid("{b9468578-9f2b-48cc-b27a-a60799c2750c}")

    /**
     * The class identifier for WdsTransportServicePolicy
     * @type {Guid}
     */
    static CLSID := Guid("{65aceadc-2f0b-4f43-9f4d-811865d8cead}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportServicePolicy interfaces
    */
    struct Vtbl extends IWdsTransportCacheable.Vtbl {
        get_IpAddressSource : IntPtr
        put_IpAddressSource : IntPtr
        get_StartIpAddress  : IntPtr
        put_StartIpAddress  : IntPtr
        get_EndIpAddress    : IntPtr
        put_EndIpAddress    : IntPtr
        get_StartPort       : IntPtr
        put_StartPort       : IntPtr
        get_EndPort         : IntPtr
        put_EndPort         : IntPtr
        get_NetworkProfile  : IntPtr
        put_NetworkProfile  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportServicePolicy.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @type {WDSTRANSPORT_NETWORK_PROFILE_TYPE} 
     */
    NetworkProfile {
        get => this.get_NetworkProfile()
        set => this.put_NetworkProfile(value)
    }

    /**
     * Enables a WDS client computer to configure, for a specified type of IP address, the IP address source from which the WDS transport server obtains a multicast address. (Get)
     * @param {WDSTRANSPORT_IP_ADDRESS_TYPE} AddressType 
     * @returns {WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-get_ipaddresssource
     */
    get_IpAddressSource(AddressType) {
        result := ComCall(11, this, WDSTRANSPORT_IP_ADDRESS_TYPE, AddressType, "int*", &pSourceType := 0, "HRESULT")
        return pSourceType
    }

    /**
     * Enables a WDS client computer to configure, for a specified type of IP address, the IP address source from which the WDS transport server obtains a multicast address. (Put)
     * @param {WDSTRANSPORT_IP_ADDRESS_TYPE} AddressType 
     * @param {WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE} SourceType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-put_ipaddresssource
     */
    put_IpAddressSource(AddressType, SourceType) {
        result := ComCall(12, this, WDSTRANSPORT_IP_ADDRESS_TYPE, AddressType, WDSTRANSPORT_IP_ADDRESS_SOURCE_TYPE, SourceType, "HRESULT")
        return result
    }

    /**
     * Enables a WDS client computer to configure the start of a multicast IP address range for a specified type of IP address. (Get)
     * @remarks
     * When setting the start IP address, this property validates that it is a valid multicast IP address for the specified type of IP address.
     * @param {WDSTRANSPORT_IP_ADDRESS_TYPE} AddressType 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-get_startipaddress
     */
    get_StartIpAddress(AddressType) {
        pbszStartIpAddress := BSTR.Owned()
        result := ComCall(13, this, WDSTRANSPORT_IP_ADDRESS_TYPE, AddressType, BSTR.Ptr, pbszStartIpAddress, "HRESULT")
        return pbszStartIpAddress
    }

    /**
     * Enables a WDS client computer to configure the start of a multicast IP address range for a specified type of IP address. (Put)
     * @remarks
     * When setting the start IP address, this property validates that it is a valid multicast IP address for the specified type of IP address.
     * @param {WDSTRANSPORT_IP_ADDRESS_TYPE} AddressType 
     * @param {BSTR} bszStartIpAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-put_startipaddress
     */
    put_StartIpAddress(AddressType, bszStartIpAddress) {
        bszStartIpAddress := bszStartIpAddress is String ? BSTR.Alloc(bszStartIpAddress).Value : bszStartIpAddress

        result := ComCall(14, this, WDSTRANSPORT_IP_ADDRESS_TYPE, AddressType, BSTR, bszStartIpAddress, "HRESULT")
        return result
    }

    /**
     * Enables a WDS client computer to configure the end of a multicast IP address range for a specified type of IP address. (Get)
     * @remarks
     * When setting the end IP address, this property validates that it is a valid multicast IP address for the specified type of IP address.
     * @param {WDSTRANSPORT_IP_ADDRESS_TYPE} AddressType 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-get_endipaddress
     */
    get_EndIpAddress(AddressType) {
        pbszEndIpAddress := BSTR.Owned()
        result := ComCall(15, this, WDSTRANSPORT_IP_ADDRESS_TYPE, AddressType, BSTR.Ptr, pbszEndIpAddress, "HRESULT")
        return pbszEndIpAddress
    }

    /**
     * Enables a WDS client computer to configure the end of a multicast IP address range for a specified type of IP address. (Put)
     * @remarks
     * When setting the end IP address, this property validates that it is a valid multicast IP address for the specified type of IP address.
     * @param {WDSTRANSPORT_IP_ADDRESS_TYPE} AddressType 
     * @param {BSTR} bszEndIpAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-put_endipaddress
     */
    put_EndIpAddress(AddressType, bszEndIpAddress) {
        bszEndIpAddress := bszEndIpAddress is String ? BSTR.Alloc(bszEndIpAddress).Value : bszEndIpAddress

        result := ComCall(16, this, WDSTRANSPORT_IP_ADDRESS_TYPE, AddressType, BSTR, bszEndIpAddress, "HRESULT")
        return result
    }

    /**
     * Enables a WDS client computer to configure the start of a UDP port range that is used by WDS transport services. (Get)
     * @remarks
     * When setting the UDP start port, this property validates that it is a valid value.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-get_startport
     */
    get_StartPort() {
        result := ComCall(17, this, "uint*", &pulStartPort := 0, "HRESULT")
        return pulStartPort
    }

    /**
     * Enables a WDS client computer to configure the start of a UDP port range that is used by WDS transport services. (Put)
     * @remarks
     * When setting the UDP start port, this property validates that it is a valid value.
     * @param {Integer} ulStartPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-put_startport
     */
    put_StartPort(ulStartPort) {
        result := ComCall(18, this, "uint", ulStartPort, "HRESULT")
        return result
    }

    /**
     * Enables a WDS client computer to configure the end of a UDP port range that is used by WDS transport services. (Get)
     * @remarks
     * When setting the UDP end port, this property validates that it is a valid value.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-get_endport
     */
    get_EndPort() {
        result := ComCall(19, this, "uint*", &pulEndPort := 0, "HRESULT")
        return pulEndPort
    }

    /**
     * Enables a WDS client computer to configure the end of a UDP port range that is used by WDS transport services. (Put)
     * @remarks
     * When setting the UDP end port, this property validates that it is a valid value.
     * @param {Integer} ulEndPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-put_endport
     */
    put_EndPort(ulEndPort) {
        result := ComCall(20, this, "uint", ulEndPort, "HRESULT")
        return result
    }

    /**
     * Enables a client computer to configure the network profile that is used by the WDS Transport Server. (Get)
     * @returns {WDSTRANSPORT_NETWORK_PROFILE_TYPE} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-get_networkprofile
     */
    get_NetworkProfile() {
        result := ComCall(21, this, "int*", &pProfileType := 0, "HRESULT")
        return pProfileType
    }

    /**
     * Enables a client computer to configure the network profile that is used by the WDS Transport Server. (Put)
     * @param {WDSTRANSPORT_NETWORK_PROFILE_TYPE} ProfileType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-put_networkprofile
     */
    put_NetworkProfile(ProfileType) {
        result := ComCall(22, this, WDSTRANSPORT_NETWORK_PROFILE_TYPE, ProfileType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWdsTransportServicePolicy.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_IpAddressSource := CallbackCreate(GetMethod(implObj, "get_IpAddressSource"), flags, 3)
        this.vtbl.put_IpAddressSource := CallbackCreate(GetMethod(implObj, "put_IpAddressSource"), flags, 3)
        this.vtbl.get_StartIpAddress := CallbackCreate(GetMethod(implObj, "get_StartIpAddress"), flags, 3)
        this.vtbl.put_StartIpAddress := CallbackCreate(GetMethod(implObj, "put_StartIpAddress"), flags, 3)
        this.vtbl.get_EndIpAddress := CallbackCreate(GetMethod(implObj, "get_EndIpAddress"), flags, 3)
        this.vtbl.put_EndIpAddress := CallbackCreate(GetMethod(implObj, "put_EndIpAddress"), flags, 3)
        this.vtbl.get_StartPort := CallbackCreate(GetMethod(implObj, "get_StartPort"), flags, 2)
        this.vtbl.put_StartPort := CallbackCreate(GetMethod(implObj, "put_StartPort"), flags, 2)
        this.vtbl.get_EndPort := CallbackCreate(GetMethod(implObj, "get_EndPort"), flags, 2)
        this.vtbl.put_EndPort := CallbackCreate(GetMethod(implObj, "put_EndPort"), flags, 2)
        this.vtbl.get_NetworkProfile := CallbackCreate(GetMethod(implObj, "get_NetworkProfile"), flags, 2)
        this.vtbl.put_NetworkProfile := CallbackCreate(GetMethod(implObj, "put_NetworkProfile"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_IpAddressSource)
        CallbackFree(this.vtbl.put_IpAddressSource)
        CallbackFree(this.vtbl.get_StartIpAddress)
        CallbackFree(this.vtbl.put_StartIpAddress)
        CallbackFree(this.vtbl.get_EndIpAddress)
        CallbackFree(this.vtbl.put_EndIpAddress)
        CallbackFree(this.vtbl.get_StartPort)
        CallbackFree(this.vtbl.put_StartPort)
        CallbackFree(this.vtbl.get_EndPort)
        CallbackFree(this.vtbl.put_EndPort)
        CallbackFree(this.vtbl.get_NetworkProfile)
        CallbackFree(this.vtbl.put_NetworkProfile)
    }
}
