#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\WDSTRANSPORT_UDP_PORT_POLICY.ahk" { WDSTRANSPORT_UDP_PORT_POLICY }
#Import "..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }
#Import ".\IWdsTransportServicePolicy.ahk" { IWdsTransportServicePolicy }

/**
 * This interface inherits from the IWdsTransportServicePolicy interface and extends it beginning with Windows Server 2012.
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nn-wdstptmgmt-iwdstransportservicepolicy2
 * @namespace Windows.Win32.System.DeploymentServices
 */
export default struct IWdsTransportServicePolicy2 extends IWdsTransportServicePolicy {
    /**
     * The interface identifier for IWdsTransportServicePolicy2
     * @type {Guid}
     */
    static IID := Guid("{65c19e5c-aa7e-4b91-8944-91e0e5572797}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IWdsTransportServicePolicy2 interfaces
    */
    struct Vtbl extends IWdsTransportServicePolicy.Vtbl {
        get_UdpPortPolicy                     : IntPtr
        put_UdpPortPolicy                     : IntPtr
        get_TftpMaximumBlockSize              : IntPtr
        put_TftpMaximumBlockSize              : IntPtr
        get_EnableTftpVariableWindowExtension : IntPtr
        put_EnableTftpVariableWindowExtension : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IWdsTransportServicePolicy2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {WDSTRANSPORT_UDP_PORT_POLICY} 
     */
    UdpPortPolicy {
        get => this.get_UdpPortPolicy()
        set => this.put_UdpPortPolicy(value)
    }

    /**
     * @type {Integer} 
     */
    TftpMaximumBlockSize {
        get => this.get_TftpMaximumBlockSize()
        set => this.put_TftpMaximumBlockSize(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    EnableTftpVariableWindowExtension {
        get => this.get_EnableTftpVariableWindowExtension()
        set => this.put_EnableTftpVariableWindowExtension(value)
    }

    /**
     * Recieves the WDSTRANSPORT_UDP_PORT_POLICY value that specifies the UDP port allocation policy to be used by WDS transport services. The value enables a WDS client computer to configure the UDP port allocation policy. (Get)
     * @returns {WDSTRANSPORT_UDP_PORT_POLICY} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy2-get_udpportpolicy
     */
    get_UdpPortPolicy() {
        result := ComCall(23, this, "int*", &pUdpPortPolicy := 0, "HRESULT")
        return pUdpPortPolicy
    }

    /**
     * Recieves the WDSTRANSPORT_UDP_PORT_POLICY value that specifies the UDP port allocation policy to be used by WDS transport services. The value enables a WDS client computer to configure the UDP port allocation policy. (Put)
     * @param {WDSTRANSPORT_UDP_PORT_POLICY} UdpPortPolicy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy2-put_udpportpolicy
     */
    put_UdpPortPolicy(UdpPortPolicy) {
        result := ComCall(24, this, WDSTRANSPORT_UDP_PORT_POLICY, UdpPortPolicy, "HRESULT")
        return result
    }

    /**
     * Receives a value for the maximum block size used by the TFTP server. The value enables a WDS client computer to configure the maximum block size. (Get)
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy2-get_tftpmaximumblocksize
     */
    get_TftpMaximumBlockSize() {
        result := ComCall(25, this, "uint*", &pulTftpMaximumBlockSize := 0, "HRESULT")
        return pulTftpMaximumBlockSize
    }

    /**
     * Receives a value for the maximum block size used by the TFTP server. The value enables a WDS client computer to configure the maximum block size. (Put)
     * @param {Integer} ulTftpMaximumBlockSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy2-put_tftpmaximumblocksize
     */
    put_TftpMaximumBlockSize(ulTftpMaximumBlockSize) {
        result := ComCall(26, this, "uint", ulTftpMaximumBlockSize, "HRESULT")
        return result
    }

    /**
     * Receives a WDSTRANSPORT_TFTP_CAPABILITY value that specifies whether variable-window extension is enabled on the TFTP server. The value enables a WDS client computer to configure the WDS TFTP server to use variable-window extensions. (Get)
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy2-get_enabletftpvariablewindowextension
     */
    get_EnableTftpVariableWindowExtension() {
        result := ComCall(27, this, VARIANT_BOOL.Ptr, &pbEnableTftpVariableWindowExtension := 0, "HRESULT")
        return pbEnableTftpVariableWindowExtension
    }

    /**
     * Receives a WDSTRANSPORT_TFTP_CAPABILITY value that specifies whether variable-window extension is enabled on the TFTP server. The value enables a WDS client computer to configure the WDS TFTP server to use variable-window extensions. (Put)
     * @param {VARIANT_BOOL} bEnableTftpVariableWindowExtension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy2-put_enabletftpvariablewindowextension
     */
    put_EnableTftpVariableWindowExtension(bEnableTftpVariableWindowExtension) {
        result := ComCall(28, this, VARIANT_BOOL, bEnableTftpVariableWindowExtension, "HRESULT")
        return result
    }

    Query(iid) {
        if (IWdsTransportServicePolicy2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_UdpPortPolicy := CallbackCreate(GetMethod(implObj, "get_UdpPortPolicy"), flags, 2)
        this.vtbl.put_UdpPortPolicy := CallbackCreate(GetMethod(implObj, "put_UdpPortPolicy"), flags, 2)
        this.vtbl.get_TftpMaximumBlockSize := CallbackCreate(GetMethod(implObj, "get_TftpMaximumBlockSize"), flags, 2)
        this.vtbl.put_TftpMaximumBlockSize := CallbackCreate(GetMethod(implObj, "put_TftpMaximumBlockSize"), flags, 2)
        this.vtbl.get_EnableTftpVariableWindowExtension := CallbackCreate(GetMethod(implObj, "get_EnableTftpVariableWindowExtension"), flags, 2)
        this.vtbl.put_EnableTftpVariableWindowExtension := CallbackCreate(GetMethod(implObj, "put_EnableTftpVariableWindowExtension"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_UdpPortPolicy)
        CallbackFree(this.vtbl.put_UdpPortPolicy)
        CallbackFree(this.vtbl.get_TftpMaximumBlockSize)
        CallbackFree(this.vtbl.put_TftpMaximumBlockSize)
        CallbackFree(this.vtbl.get_EnableTftpVariableWindowExtension)
        CallbackFree(this.vtbl.put_EnableTftpVariableWindowExtension)
    }
}
