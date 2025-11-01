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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetClientInfo"]

    /**
     * 
     * @param {Integer} dwClientNum 
     * @param {PWSTR} pwszNetworkAddress 
     * @param {Pointer<Integer>} pcchNetworkAddress 
     * @param {PWSTR} pwszPort 
     * @param {Pointer<Integer>} pcchPort 
     * @param {PWSTR} pwszDNSName 
     * @param {Pointer<Integer>} pcchDNSName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmclientconnections2-getclientinfo
     */
    GetClientInfo(dwClientNum, pwszNetworkAddress, pcchNetworkAddress, pwszPort, pcchPort, pwszDNSName, pcchDNSName) {
        pwszNetworkAddress := pwszNetworkAddress is String ? StrPtr(pwszNetworkAddress) : pwszNetworkAddress
        pwszPort := pwszPort is String ? StrPtr(pwszPort) : pwszPort
        pwszDNSName := pwszDNSName is String ? StrPtr(pwszDNSName) : pwszDNSName

        pcchNetworkAddressMarshal := pcchNetworkAddress is VarRef ? "uint*" : "ptr"
        pcchPortMarshal := pcchPort is VarRef ? "uint*" : "ptr"
        pcchDNSNameMarshal := pcchDNSName is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwClientNum, "ptr", pwszNetworkAddress, pcchNetworkAddressMarshal, pcchNetworkAddress, "ptr", pwszPort, pcchPortMarshal, pcchPort, "ptr", pwszDNSName, pcchDNSNameMarshal, pcchDNSName, "HRESULT")
        return result
    }
}
