#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
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
     * @type {BSTR} 
     */
    Name {
        get => this.get_Name()
    }

    /**
     * @type {Integer} 
     */
    IPProtocol {
        get => this.get_IPProtocol()
    }

    /**
     * @type {Integer} 
     */
    ExternalPort {
        get => this.get_ExternalPort()
    }

    /**
     * @type {Integer} 
     */
    InternalPort {
        get => this.get_InternalPort()
    }

    /**
     * @type {Integer} 
     */
    Options {
        get => this.get_Options()
    }

    /**
     * @type {BSTR} 
     */
    TargetName {
        get => this.get_TargetName()
    }

    /**
     * @type {BSTR} 
     */
    TargetIPAddress {
        get => this.get_TargetIPAddress()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    Enabled {
        get => this.get_Enabled()
    }

    /**
     * The get_Name method retrieves the name for this port mapping.
     * @returns {BSTR} Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> variable that receives the name of the port mapping.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetsharingportmappingprops-get_name
     */
    get_Name() {
        pbstrName := BSTR()
        result := ComCall(7, this, "ptr", pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * The get_IPProtocol method retrieves the IP Protocol associated with this port mapping.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetsharingportmappingprops-get_ipprotocol
     */
    get_IPProtocol() {
        result := ComCall(8, this, "char*", &pucIPProt := 0, "HRESULT")
        return pucIPProt
    }

    /**
     * The get_ExternalPort method retrieves the external port associated with this port mapping.
     * @returns {Integer} Pointer to a <b>LONG</b> variable that receives the external port for this port mapping.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetsharingportmappingprops-get_externalport
     */
    get_ExternalPort() {
        result := ComCall(9, this, "int*", &pusPort := 0, "HRESULT")
        return pusPort
    }

    /**
     * The get_InternalPort method retrieves the internal port associated with this port mapping.
     * @returns {Integer} Pointer to a <b>LONG</b> variable that receives the internal port for this port mapping.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetsharingportmappingprops-get_internalport
     */
    get_InternalPort() {
        result := ComCall(10, this, "int*", &pusPort := 0, "HRESULT")
        return pusPort
    }

    /**
     * The get_Options method retrieves the options associated with this port mapping.
     * @returns {Integer} Pointer to a <b>DWORD</b> variable that receives the options associated with this port mapping.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetsharingportmappingprops-get_options
     */
    get_Options() {
        result := ComCall(11, this, "int*", &pdwOptions := 0, "HRESULT")
        return pdwOptions
    }

    /**
     * The get_TargetName method retrieves the name of the target computer for this port mapping.
     * @returns {BSTR} Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> variable that receives the name of the target computer for this port mapping.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetsharingportmappingprops-get_targetname
     */
    get_TargetName() {
        pbstrTargetName := BSTR()
        result := ComCall(12, this, "ptr", pbstrTargetName, "HRESULT")
        return pbstrTargetName
    }

    /**
     * The get_TargetIPAddress method retrieves the IP address of the target computer for this port mapping.
     * @returns {BSTR} Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> variable that receives the IP address of the target computer for this port mapping.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetsharingportmappingprops-get_targetipaddress
     */
    get_TargetIPAddress() {
        pbstrTargetIPAddress := BSTR()
        result := ComCall(13, this, "ptr", pbstrTargetIPAddress, "HRESULT")
        return pbstrTargetIPAddress
    }

    /**
     * The get_Enabled method retrieves the status for this port mapping.
     * @returns {VARIANT_BOOL} Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">VARIANT_BOOL</a> variable that receives the status of the port mapping.
     * @see https://docs.microsoft.com/windows/win32/api//netcon/nf-netcon-inetsharingportmappingprops-get_enabled
     */
    get_Enabled() {
        result := ComCall(14, this, "short*", &pbool := 0, "HRESULT")
        return pbool
    }
}
