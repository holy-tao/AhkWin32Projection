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
     * 
     * @param {Pointer<Int32>} pUdpPortPolicy 
     * @returns {HRESULT} 
     */
    get_UdpPortPolicy(pUdpPortPolicy) {
        result := ComCall(23, this, "int*", pUdpPortPolicy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} UdpPortPolicy 
     * @returns {HRESULT} 
     */
    put_UdpPortPolicy(UdpPortPolicy) {
        result := ComCall(24, this, "int", UdpPortPolicy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pulTftpMaximumBlockSize 
     * @returns {HRESULT} 
     */
    get_TftpMaximumBlockSize(pulTftpMaximumBlockSize) {
        result := ComCall(25, this, "uint*", pulTftpMaximumBlockSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulTftpMaximumBlockSize 
     * @returns {HRESULT} 
     */
    put_TftpMaximumBlockSize(ulTftpMaximumBlockSize) {
        result := ComCall(26, this, "uint", ulTftpMaximumBlockSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pbEnableTftpVariableWindowExtension 
     * @returns {HRESULT} 
     */
    get_EnableTftpVariableWindowExtension(pbEnableTftpVariableWindowExtension) {
        result := ComCall(27, this, "ptr", pbEnableTftpVariableWindowExtension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bEnableTftpVariableWindowExtension 
     * @returns {HRESULT} 
     */
    put_EnableTftpVariableWindowExtension(bEnableTftpVariableWindowExtension) {
        result := ComCall(28, this, "short", bEnableTftpVariableWindowExtension, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
