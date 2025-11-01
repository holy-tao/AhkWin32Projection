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
     * @param {Pointer<Integer>} pUdpPortPolicy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy2-get_udpportpolicy
     */
    get_UdpPortPolicy(pUdpPortPolicy) {
        pUdpPortPolicyMarshal := pUdpPortPolicy is VarRef ? "int*" : "ptr"

        result := ComCall(23, this, pUdpPortPolicyMarshal, pUdpPortPolicy, "HRESULT")
        return result
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
     * @param {Pointer<Integer>} pulTftpMaximumBlockSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy2-get_tftpmaximumblocksize
     */
    get_TftpMaximumBlockSize(pulTftpMaximumBlockSize) {
        pulTftpMaximumBlockSizeMarshal := pulTftpMaximumBlockSize is VarRef ? "uint*" : "ptr"

        result := ComCall(25, this, pulTftpMaximumBlockSizeMarshal, pulTftpMaximumBlockSize, "HRESULT")
        return result
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
     * @param {Pointer<VARIANT_BOOL>} pbEnableTftpVariableWindowExtension 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/nf-wdstptmgmt-iwdstransportservicepolicy2-get_enabletftpvariablewindowextension
     */
    get_EnableTftpVariableWindowExtension(pbEnableTftpVariableWindowExtension) {
        result := ComCall(27, this, "ptr", pbEnableTftpVariableWindowExtension, "HRESULT")
        return result
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
