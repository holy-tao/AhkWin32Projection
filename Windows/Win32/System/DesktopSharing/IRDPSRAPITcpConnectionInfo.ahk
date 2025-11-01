#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IDispatch.ahk

/**
 * Supports the methods to retrieve the TCP connection information on the viewer and on the sharer side.
 * @see https://docs.microsoft.com/windows/win32/api//rdpencomapi/nn-rdpencomapi-irdpsrapitcpconnectioninfo
 * @namespace Windows.Win32.System.DesktopSharing
 * @version v4.0.30319
 */
class IRDPSRAPITcpConnectionInfo extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRDPSRAPITcpConnectionInfo
     * @type {Guid}
     */
    static IID => Guid("{f74049a4-3d06-4028-8193-0a8c29bc2452}")

    /**
     * The class identifier for RDPSRAPITcpConnectionInfo
     * @type {Guid}
     */
    static CLSID => Guid("{be49db3f-ebb6-4278-8ce0-d5455833eaee}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Protocol", "get_LocalPort", "get_LocalIP", "get_PeerPort", "get_PeerIP"]

    /**
     * 
     * @param {Pointer<Integer>} plProtocol 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitcpconnectioninfo-get_protocol
     */
    get_Protocol(plProtocol) {
        plProtocolMarshal := plProtocol is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, plProtocolMarshal, plProtocol, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitcpconnectioninfo-get_localport
     */
    get_LocalPort(plPort) {
        plPortMarshal := plPort is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, plPortMarshal, plPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbsrLocalIP 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitcpconnectioninfo-get_localip
     */
    get_LocalIP(pbsrLocalIP) {
        result := ComCall(9, this, "ptr", pbsrLocalIP, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} plPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitcpconnectioninfo-get_peerport
     */
    get_PeerPort(plPort) {
        plPortMarshal := plPort is VarRef ? "int*" : "ptr"

        result := ComCall(10, this, plPortMarshal, plPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pbstrIP 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/rdpencomapi/nf-rdpencomapi-irdpsrapitcpconnectioninfo-get_peerip
     */
    get_PeerIP(pbstrIP) {
        result := ComCall(11, this, "ptr", pbstrIP, "HRESULT")
        return result
    }
}
