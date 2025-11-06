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
     * 
     * @param {Integer} dwMaxClients 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriternetworksink-setmaximumclients
     */
    SetMaximumClients(dwMaxClients) {
        result := ComCall(8, this, "uint", dwMaxClients, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriternetworksink-getmaximumclients
     */
    GetMaximumClients() {
        result := ComCall(9, this, "uint*", &pdwMaxClients := 0, "HRESULT")
        return pdwMaxClients
    }

    /**
     * 
     * @param {Integer} protocol 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriternetworksink-setnetworkprotocol
     */
    SetNetworkProtocol(protocol) {
        result := ComCall(10, this, "int", protocol, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriternetworksink-getnetworkprotocol
     */
    GetNetworkProtocol() {
        result := ComCall(11, this, "int*", &pProtocol := 0, "HRESULT")
        return pProtocol
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {Pointer<Integer>} pcchURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriternetworksink-gethosturl
     */
    GetHostURL(pwszURL, pcchURL) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        pcchURLMarshal := pcchURL is VarRef ? "uint*" : "ptr"

        result := ComCall(12, this, "ptr", pwszURL, pcchURLMarshal, pcchURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwPortNum 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriternetworksink-open
     */
    Open(pdwPortNum) {
        pdwPortNumMarshal := pdwPortNum is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pdwPortNumMarshal, pdwPortNum, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriternetworksink-disconnect
     */
    Disconnect() {
        result := ComCall(14, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmwriternetworksink-close
     */
    Close() {
        result := ComCall(15, this, "HRESULT")
        return result
    }
}
