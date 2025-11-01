#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDispatch.ahk

/**
 * The INetSharingPortMappingProps interface provides methods that retrieve and set the properties of a network connection port mapping.
 * @see https://docs.microsoft.com/windows/win32/api//netcon/nn-netcon-inetsharingportmappingprops
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 * @version v4.0.30319
 */
class INetSharingPortMappingProps extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for INetSharingPortMappingProps
     * @type {Guid}
     */
    static IID => Guid("{24b7e9b5-e38f-4685-851b-00892cf5f940}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Name", "get_IPProtocol", "get_ExternalPort", "get_InternalPort", "get_Options", "get_TargetName", "get_TargetIPAddress", "get_Enabled"]

    /**
     * 
     * @param {Pointer<BSTR>} pbstrName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmappingprops-get_name
     */
    get_Name(pbstrName) {
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pucIPProt 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmappingprops-get_ipprotocol
     */
    get_IPProtocol(pucIPProt) {
        result := ComCall(8, this, "char*", pucIPProt, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pusPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmappingprops-get_externalport
     */
    get_ExternalPort(pusPort) {
        result := ComCall(9, this, "int*", pusPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pusPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmappingprops-get_internalport
     */
    get_InternalPort(pusPort) {
        result := ComCall(10, this, "int*", pusPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwOptions 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmappingprops-get_options
     */
    get_Options(pdwOptions) {
        result := ComCall(11, this, "int*", pdwOptions, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTargetName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmappingprops-get_targetname
     */
    get_TargetName(pbstrTargetName) {
        result := ComCall(12, this, "ptr", pbstrTargetName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrTargetIPAddress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmappingprops-get_targetipaddress
     */
    get_TargetIPAddress(pbstrTargetIPAddress) {
        result := ComCall(13, this, "ptr", pbstrTargetIPAddress, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbool 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmappingprops-get_enabled
     */
    get_Enabled(pbool) {
        result := ComCall(14, this, "ptr", pbool, "HRESULT")
        return result
    }
}
