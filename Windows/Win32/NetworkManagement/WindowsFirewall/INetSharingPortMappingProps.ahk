#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The INetSharingPortMappingProps interface provides methods that retrieve and set the properties of a network connection port mapping.
 * @see https://learn.microsoft.com/windows/win32/api/netcon/nn-netcon-inetsharingportmappingprops
 * @namespace Windows.Win32.NetworkManagement.WindowsFirewall
 */
export default struct INetSharingPortMappingProps extends IDispatch {
    /**
     * The interface identifier for INetSharingPortMappingProps
     * @type {Guid}
     */
    static IID := Guid("{24b7e9b5-e38f-4685-851b-00892cf5f940}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for INetSharingPortMappingProps interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        get_Name            : IntPtr
        get_IPProtocol      : IntPtr
        get_ExternalPort    : IntPtr
        get_InternalPort    : IntPtr
        get_Options         : IntPtr
        get_TargetName      : IntPtr
        get_TargetIPAddress : IntPtr
        get_Enabled         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := INetSharingPortMappingProps.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmappingprops-get_name
     */
    get_Name() {
        pbstrName := BSTR.Owned()
        result := ComCall(7, this, BSTR.Ptr, pbstrName, "HRESULT")
        return pbstrName
    }

    /**
     * The get_IPProtocol method retrieves the IP Protocol associated with this port mapping.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmappingprops-get_ipprotocol
     */
    get_IPProtocol() {
        result := ComCall(8, this, "char*", &pucIPProt := 0, "HRESULT")
        return pucIPProt
    }

    /**
     * The get_ExternalPort method retrieves the external port associated with this port mapping.
     * @returns {Integer} Pointer to a <b>LONG</b> variable that receives the external port for this port mapping.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmappingprops-get_externalport
     */
    get_ExternalPort() {
        result := ComCall(9, this, "int*", &pusPort := 0, "HRESULT")
        return pusPort
    }

    /**
     * The get_InternalPort method retrieves the internal port associated with this port mapping.
     * @returns {Integer} Pointer to a <b>LONG</b> variable that receives the internal port for this port mapping.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmappingprops-get_internalport
     */
    get_InternalPort() {
        result := ComCall(10, this, "int*", &pusPort := 0, "HRESULT")
        return pusPort
    }

    /**
     * The get_Options method retrieves the options associated with this port mapping.
     * @returns {Integer} Pointer to a <b>DWORD</b> variable that receives the options associated with this port mapping.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmappingprops-get_options
     */
    get_Options() {
        result := ComCall(11, this, "int*", &pdwOptions := 0, "HRESULT")
        return pdwOptions
    }

    /**
     * The get_TargetName method retrieves the name of the target computer for this port mapping.
     * @returns {BSTR} Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> variable that receives the name of the target computer for this port mapping.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmappingprops-get_targetname
     */
    get_TargetName() {
        pbstrTargetName := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pbstrTargetName, "HRESULT")
        return pbstrTargetName
    }

    /**
     * The get_TargetIPAddress method retrieves the IP address of the target computer for this port mapping.
     * @returns {BSTR} Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">BSTR</a> variable that receives the IP address of the target computer for this port mapping.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmappingprops-get_targetipaddress
     */
    get_TargetIPAddress() {
        pbstrTargetIPAddress := BSTR.Owned()
        result := ComCall(13, this, BSTR.Ptr, pbstrTargetIPAddress, "HRESULT")
        return pbstrTargetIPAddress
    }

    /**
     * The get_Enabled method retrieves the status for this port mapping.
     * @returns {VARIANT_BOOL} Pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/automat/bstr">VARIANT_BOOL</a> variable that receives the status of the port mapping.
     * @see https://learn.microsoft.com/windows/win32/api/netcon/nf-netcon-inetsharingportmappingprops-get_enabled
     */
    get_Enabled() {
        result := ComCall(14, this, VARIANT_BOOL.Ptr, &pbool := 0, "HRESULT")
        return pbool
    }

    Query(iid) {
        if (INetSharingPortMappingProps.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Name := CallbackCreate(GetMethod(implObj, "get_Name"), flags, 2)
        this.vtbl.get_IPProtocol := CallbackCreate(GetMethod(implObj, "get_IPProtocol"), flags, 2)
        this.vtbl.get_ExternalPort := CallbackCreate(GetMethod(implObj, "get_ExternalPort"), flags, 2)
        this.vtbl.get_InternalPort := CallbackCreate(GetMethod(implObj, "get_InternalPort"), flags, 2)
        this.vtbl.get_Options := CallbackCreate(GetMethod(implObj, "get_Options"), flags, 2)
        this.vtbl.get_TargetName := CallbackCreate(GetMethod(implObj, "get_TargetName"), flags, 2)
        this.vtbl.get_TargetIPAddress := CallbackCreate(GetMethod(implObj, "get_TargetIPAddress"), flags, 2)
        this.vtbl.get_Enabled := CallbackCreate(GetMethod(implObj, "get_Enabled"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Name)
        CallbackFree(this.vtbl.get_IPProtocol)
        CallbackFree(this.vtbl.get_ExternalPort)
        CallbackFree(this.vtbl.get_InternalPort)
        CallbackFree(this.vtbl.get_Options)
        CallbackFree(this.vtbl.get_TargetName)
        CallbackFree(this.vtbl.get_TargetIPAddress)
        CallbackFree(this.vtbl.get_Enabled)
    }
}
