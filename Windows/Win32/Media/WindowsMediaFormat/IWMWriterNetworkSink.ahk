#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IWMWriterSink.ahk

/**
 * The IWMWriterNetworkSink interface is used to deliver streams to the network.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmwriternetworksink
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMWriterNetworkSink extends IWMWriterSink{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWMWriterNetworkSink
     * @type {Guid}
     */
    static IID => Guid("{96406be7-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetMaximumClients", "GetMaximumClients", "SetNetworkProtocol", "GetNetworkProtocol", "GetHostURL", "Open", "Disconnect", "Close"]

    /**
     * The SetMaximumClients method sets the maximum number of clients that can connect to this sink. Call this method before streaming begins.
     * @param {Integer} dwMaxClients Specifies the maximum number of clients. The value must be from 0 to 50, inclusive. The default value is 5.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Streaming has already begun, or the value of <i>dwMaxClients</i> is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriternetworksink-setmaximumclients
     */
    SetMaximumClients(dwMaxClients) {
        result := ComCall(8, this, "uint", dwMaxClients, "HRESULT")
        return result
    }

    /**
     * The GetMaximumClients method retrieves the maximum number of clients that can connect to this sink.
     * @returns {Integer} Pointer to a variable that receives the maximum number of clients. The default value is 5.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriternetworksink-getmaximumclients
     */
    GetMaximumClients() {
        result := ComCall(9, this, "uint*", &pdwMaxClients := 0, "HRESULT")
        return pdwMaxClients
    }

    /**
     * The SetNetworkProtocol method sets the network protocol that the network sink uses. Currently, HTTP is the only protocol supported by the network sink.
     * @param {Integer} protocol Specifies the procotcol, as a value from the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_net_protocol">WMT_NET_PROTOCOL</a> enumeration type.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriternetworksink-setnetworkprotocol
     */
    SetNetworkProtocol(protocol) {
        result := ComCall(10, this, "int", protocol, "HRESULT")
        return result
    }

    /**
     * The GetNetworkProtocol method retrieves the network protocol that the network sink uses. Currently, HTTP is the only protocol the network sink supports.
     * @returns {Integer} Pointer to a variable that receives a member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_net_protocol">WMT_NET_PROTOCOL</a> enumeration type.
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriternetworksink-getnetworkprotocol
     */
    GetNetworkProtocol() {
        result := ComCall(11, this, "int*", &pProtocol := 0, "HRESULT")
        return pProtocol
    }

    /**
     * The GetHostURL method retrieves the URL from which the stream is broadcast. Clients will access the stream from this URL.
     * @param {PWSTR} pwszURL Pointer to buffer that receives a string containing the URL. To retrieve the length of the string, set this parameter to <b>NULL</b>.
     * @param {Pointer<Integer>} pcchURL On input, pointer to the size of <i>pwszURL</i>, in characters. On output, this parameter receives the length of the URL in characters, including the terminating <b>null</b> character.
     * @returns {HRESULT} The method returns an HRESULT. Possible values include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ASF_E_BUFFERTOOSMALL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Invalid argument; <i>pcchURL</i> cannot be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network sink is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriternetworksink-gethosturl
     */
    GetHostURL(pwszURL, pcchURL) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        pcchURLMarshal := pcchURL is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", pwszURL, pcchURLMarshal, pcchURL, "HRESULT")
        return result
    }

    /**
     * The Open method opens a network port, and starts listening for network connections.
     * @param {Pointer<Integer>} pdwPortNum On input, pointer to a variable that specifies the port number. Set this value to zero if you want the network sink to select a suitable port. On output, the variable receives the port number that was used.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>pdwPortNum</i> parameter is <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network sink is already open.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_NETWORK_RESOURCE_FAILURE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The port number specified is already in use.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriternetworksink-open
     */
    Open(pdwPortNum) {
        pdwPortNumMarshal := pdwPortNum is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pdwPortNumMarshal, pdwPortNum, "HRESULT")
        return result
    }

    /**
     * The Disconnect method disconnects all clients from the network sink.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriternetworksink-disconnect
     */
    Disconnect() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * The Close method disconnects all clients from the network sink, and releases the port.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, the values shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>NS_E_INVALID_REQUEST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The network sink is not connected.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nf-wmsdkidl-iwmwriternetworksink-close
     */
    Close() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}
