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
     * 
     * @param {Integer} AddressType 
     * @param {Pointer<Integer>} pSourceType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-get_ipaddresssource
     */
    get_IpAddressSource(AddressType, pSourceType) {
        result := ComCall(11, this, "int", AddressType, "int*", pSourceType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AddressType 
     * @param {Integer} SourceType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-put_ipaddresssource
     */
    put_IpAddressSource(AddressType, SourceType) {
        result := ComCall(12, this, "int", AddressType, "int", SourceType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AddressType 
     * @param {Pointer<BSTR>} pbszStartIpAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-get_startipaddress
     */
    get_StartIpAddress(AddressType, pbszStartIpAddress) {
        result := ComCall(13, this, "int", AddressType, "ptr", pbszStartIpAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AddressType 
     * @param {BSTR} bszStartIpAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-put_startipaddress
     */
    put_StartIpAddress(AddressType, bszStartIpAddress) {
        bszStartIpAddress := bszStartIpAddress is String ? BSTR.Alloc(bszStartIpAddress).Value : bszStartIpAddress

        result := ComCall(14, this, "int", AddressType, "ptr", bszStartIpAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AddressType 
     * @param {Pointer<BSTR>} pbszEndIpAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-get_endipaddress
     */
    get_EndIpAddress(AddressType, pbszEndIpAddress) {
        result := ComCall(15, this, "int", AddressType, "ptr", pbszEndIpAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} AddressType 
     * @param {BSTR} bszEndIpAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-put_endipaddress
     */
    put_EndIpAddress(AddressType, bszEndIpAddress) {
        bszEndIpAddress := bszEndIpAddress is String ? BSTR.Alloc(bszEndIpAddress).Value : bszEndIpAddress

        result := ComCall(16, this, "int", AddressType, "ptr", bszEndIpAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulStartPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-get_startport
     */
    get_StartPort(pulStartPort) {
        result := ComCall(17, this, "uint*", pulStartPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulStartPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-put_startport
     */
    put_StartPort(ulStartPort) {
        result := ComCall(18, this, "uint", ulStartPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pulEndPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-get_endport
     */
    get_EndPort(pulEndPort) {
        result := ComCall(19, this, "uint*", pulEndPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulEndPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-put_endport
     */
    put_EndPort(ulEndPort) {
        result := ComCall(20, this, "uint", ulEndPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pProfileType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-get_networkprofile
     */
    get_NetworkProfile(pProfileType) {
        result := ComCall(21, this, "int*", pProfileType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ProfileType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy-put_networkprofile
     */
    put_NetworkProfile(ProfileType) {
        result := ComCall(22, this, "int", ProfileType, "HRESULT")
        return result
    }
}
