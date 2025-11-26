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
     * The GetClientInfo method retrieves information about a client attached to a writer network sink.
     * @param {Integer} dwClientNum <b>DWORD</b> containing the client number.
     * @param {PWSTR} pwszNetworkAddress Pointer to a wide-character <b>null</b>-terminated string containing the network address of the client. Pass <b>NULL</b> to retrieve the size of the string, which is returned in <i>pcchNetworkAddress</i>.
     * @param {Pointer<Integer>} pcchNetworkAddress Pointer to a <b>DWORD</b> containing the size of <i>pwszNetworkAddress</i>, in wide characters. This size includes the terminating <b>null</b> character.
     * @param {PWSTR} pwszPort Pointer to a wide-character <b>null</b>-terminated string containing the network port of the client. Pass <b>NULL</b> to retrieve the size of the string, which is returned in <i>pcchPort</i>.
     * @param {Pointer<Integer>} pcchPort Pointer to a <b>DWORD</b> containing the size of <i>pwszPort</i>, in wide characters. This size includes the terminating <b>null</b> character.
     * @param {PWSTR} pwszDNSName Pointer to a wide-character <b>null</b>-terminated string containing the name of the domain name server supporting the client. Pass <b>NULL</b> to retrieve the size of the string, which is returned in <i>pcchDNSName</i>.
     * @param {Pointer<Integer>} pcchDNSName Pointer to a <b>DWORD</b> containing the size of <i>pwszDNSName</i>, in wide characters. This size includes the terminating <b>null</b> character.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmclientconnections2-getclientinfo
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
