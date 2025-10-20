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
     * 
     * @param {Integer} AddressType 
     * @param {Pointer<Int32>} pSourceType 
     * @returns {HRESULT} 
     */
    get_IpAddressSource(AddressType, pSourceType) {
        result := ComCall(11, this, "int", AddressType, "int*", pSourceType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AddressType 
     * @param {Integer} SourceType 
     * @returns {HRESULT} 
     */
    put_IpAddressSource(AddressType, SourceType) {
        result := ComCall(12, this, "int", AddressType, "int", SourceType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AddressType 
     * @param {Pointer<BSTR>} pbszStartIpAddress 
     * @returns {HRESULT} 
     */
    get_StartIpAddress(AddressType, pbszStartIpAddress) {
        result := ComCall(13, this, "int", AddressType, "ptr", pbszStartIpAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AddressType 
     * @param {BSTR} bszStartIpAddress 
     * @returns {HRESULT} 
     */
    put_StartIpAddress(AddressType, bszStartIpAddress) {
        bszStartIpAddress := bszStartIpAddress is String ? BSTR.Alloc(bszStartIpAddress).Value : bszStartIpAddress

        result := ComCall(14, this, "int", AddressType, "ptr", bszStartIpAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AddressType 
     * @param {Pointer<BSTR>} pbszEndIpAddress 
     * @returns {HRESULT} 
     */
    get_EndIpAddress(AddressType, pbszEndIpAddress) {
        result := ComCall(15, this, "int", AddressType, "ptr", pbszEndIpAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} AddressType 
     * @param {BSTR} bszEndIpAddress 
     * @returns {HRESULT} 
     */
    put_EndIpAddress(AddressType, bszEndIpAddress) {
        bszEndIpAddress := bszEndIpAddress is String ? BSTR.Alloc(bszEndIpAddress).Value : bszEndIpAddress

        result := ComCall(16, this, "int", AddressType, "ptr", bszEndIpAddress, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulStartPort 
     * @returns {HRESULT} 
     */
    get_StartPort(pulStartPort) {
        result := ComCall(17, this, "uint*", pulStartPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulStartPort 
     * @returns {HRESULT} 
     */
    put_StartPort(ulStartPort) {
        result := ComCall(18, this, "uint", ulStartPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulEndPort 
     * @returns {HRESULT} 
     */
    get_EndPort(pulEndPort) {
        result := ComCall(19, this, "uint*", pulEndPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulEndPort 
     * @returns {HRESULT} 
     */
    put_EndPort(ulEndPort) {
        result := ComCall(20, this, "uint", ulEndPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pProfileType 
     * @returns {HRESULT} 
     */
    get_NetworkProfile(pProfileType) {
        result := ComCall(21, this, "int*", pProfileType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ProfileType 
     * @returns {HRESULT} 
     */
    put_NetworkProfile(ProfileType) {
        result := ComCall(22, this, "int", ProfileType, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
