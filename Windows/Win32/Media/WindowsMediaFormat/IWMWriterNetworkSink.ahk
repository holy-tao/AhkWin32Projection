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
     * 
     * @param {Integer} dwMaxClients 
     * @returns {HRESULT} 
     */
    SetMaximumClients(dwMaxClients) {
        result := ComCall(8, this, "uint", dwMaxClients, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwMaxClients 
     * @returns {HRESULT} 
     */
    GetMaximumClients(pdwMaxClients) {
        result := ComCall(9, this, "uint*", pdwMaxClients, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} protocol 
     * @returns {HRESULT} 
     */
    SetNetworkProtocol(protocol) {
        result := ComCall(10, this, "int", protocol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pProtocol 
     * @returns {HRESULT} 
     */
    GetNetworkProtocol(pProtocol) {
        result := ComCall(11, this, "int*", pProtocol, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszURL 
     * @param {Pointer<UInt32>} pcchURL 
     * @returns {HRESULT} 
     */
    GetHostURL(pwszURL, pcchURL) {
        pwszURL := pwszURL is String ? StrPtr(pwszURL) : pwszURL

        result := ComCall(12, this, "ptr", pwszURL, "uint*", pcchURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwPortNum 
     * @returns {HRESULT} 
     */
    Open(pdwPortNum) {
        result := ComCall(13, this, "uint*", pdwPortNum, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Disconnect() {
        result := ComCall(14, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(15, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
