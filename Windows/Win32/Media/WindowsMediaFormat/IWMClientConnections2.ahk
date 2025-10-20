#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMClientConnections.ahk

/**
 * The IWMClientConnections2 interface retrieves advanced client information.The writer network sink object exposes this interface.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmclientconnections2
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMClientConnections2 extends IWMClientConnections{
    /**
     * The interface identifier for IWMClientConnections2
     * @type {Guid}
     */
    static IID => Guid("{4091571e-4701-4593-bb3d-d5f5f0c74246}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * 
     * @param {Integer} dwClientNum 
     * @param {PWSTR} pwszNetworkAddress 
     * @param {Pointer<UInt32>} pcchNetworkAddress 
     * @param {PWSTR} pwszPort 
     * @param {Pointer<UInt32>} pcchPort 
     * @param {PWSTR} pwszDNSName 
     * @param {Pointer<UInt32>} pcchDNSName 
     * @returns {HRESULT} 
     */
    GetClientInfo(dwClientNum, pwszNetworkAddress, pcchNetworkAddress, pwszPort, pcchPort, pwszDNSName, pcchDNSName) {
        pwszNetworkAddress := pwszNetworkAddress is String ? StrPtr(pwszNetworkAddress) : pwszNetworkAddress
        pwszPort := pwszPort is String ? StrPtr(pwszPort) : pwszPort
        pwszDNSName := pwszDNSName is String ? StrPtr(pwszDNSName) : pwszDNSName

        result := ComCall(5, this, "uint", dwClientNum, "ptr", pwszNetworkAddress, "uint*", pcchNetworkAddress, "ptr", pwszPort, "uint*", pcchPort, "ptr", pwszDNSName, "uint*", pcchDNSName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
