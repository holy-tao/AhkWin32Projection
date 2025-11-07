#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWdsTransportServicePolicy.ahk

/**
 * This interface inherits from the IWdsTransportServicePolicy interface and extends it beginning with Windows Server 2012.
 * @see https://docs.microsoft.com/windows/win32/api//wdstptmgmt/nn-wdstptmgmt-iwdstransportservicepolicy2
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class IWdsTransportServicePolicy2 extends IWdsTransportServicePolicy{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWdsTransportServicePolicy2
     * @type {Guid}
     */
    static IID => Guid("{65c19e5c-aa7e-4b91-8944-91e0e5572797}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 23

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_UdpPortPolicy", "put_UdpPortPolicy", "get_TftpMaximumBlockSize", "put_TftpMaximumBlockSize", "get_EnableTftpVariableWindowExtension", "put_EnableTftpVariableWindowExtension"]

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy2-get_udpportpolicy
     */
    get_UdpPortPolicy() {
        result := ComCall(23, this, "int*", &pUdpPortPolicy := 0, "HRESULT")
        return pUdpPortPolicy
    }

    /**
     * 
     * @param {Integer} UdpPortPolicy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy2-put_udpportpolicy
     */
    put_UdpPortPolicy(UdpPortPolicy) {
        result := ComCall(24, this, "int", UdpPortPolicy, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy2-get_tftpmaximumblocksize
     */
    get_TftpMaximumBlockSize() {
        result := ComCall(25, this, "uint*", &pulTftpMaximumBlockSize := 0, "HRESULT")
        return pulTftpMaximumBlockSize
    }

    /**
     * 
     * @param {Integer} ulTftpMaximumBlockSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy2-put_tftpmaximumblocksize
     */
    put_TftpMaximumBlockSize(ulTftpMaximumBlockSize) {
        result := ComCall(26, this, "uint", ulTftpMaximumBlockSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy2-get_enabletftpvariablewindowextension
     */
    get_EnableTftpVariableWindowExtension() {
        result := ComCall(27, this, "short*", &pbEnableTftpVariableWindowExtension := 0, "HRESULT")
        return pbEnableTftpVariableWindowExtension
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnableTftpVariableWindowExtension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy2-put_enabletftpvariablewindowextension
     */
    put_EnableTftpVariableWindowExtension(bEnableTftpVariableWindowExtension) {
        result := ComCall(28, this, "short", bEnableTftpVariableWindowExtension, "HRESULT")
        return result
    }
}
