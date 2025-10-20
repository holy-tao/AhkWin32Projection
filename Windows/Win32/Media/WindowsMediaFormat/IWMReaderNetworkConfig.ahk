#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMReaderNetworkConfig interface is used to set and test network configuration settings.
 * @see https://docs.microsoft.com/windows/win32/api//wmsdkidl/nn-wmsdkidl-iwmreadernetworkconfig
 * @namespace Windows.Win32.Media.WindowsMediaFormat
 * @version v4.0.30319
 */
class IWMReaderNetworkConfig extends IUnknown{
    /**
     * The interface identifier for IWMReaderNetworkConfig
     * @type {Guid}
     */
    static IID => Guid("{96406bec-2b2b-11d3-b36b-00c04f6108ff}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<UInt64>} pcnsBufferingTime 
     * @returns {HRESULT} 
     */
    GetBufferingTime(pcnsBufferingTime) {
        result := ComCall(3, this, "uint*", pcnsBufferingTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} cnsBufferingTime 
     * @returns {HRESULT} 
     */
    SetBufferingTime(cnsBufferingTime) {
        result := ComCall(4, this, "uint", cnsBufferingTime, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WM_PORT_NUMBER_RANGE>} pRangeArray 
     * @param {Pointer<UInt32>} pcRanges 
     * @returns {HRESULT} 
     */
    GetUDPPortRanges(pRangeArray, pcRanges) {
        result := ComCall(5, this, "ptr", pRangeArray, "uint*", pcRanges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<WM_PORT_NUMBER_RANGE>} pRangeArray 
     * @param {Integer} cRanges 
     * @returns {HRESULT} 
     */
    SetUDPPortRanges(pRangeArray, cRanges) {
        result := ComCall(6, this, "ptr", pRangeArray, "uint", cRanges, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {Pointer<Int32>} pProxySetting 
     * @returns {HRESULT} 
     */
    GetProxySettings(pwszProtocol, pProxySetting) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(7, this, "ptr", pwszProtocol, "int*", pProxySetting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {Integer} ProxySetting 
     * @returns {HRESULT} 
     */
    SetProxySettings(pwszProtocol, ProxySetting) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(8, this, "ptr", pwszProtocol, "int", ProxySetting, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {PWSTR} pwszHostName 
     * @param {Pointer<UInt32>} pcchHostName 
     * @returns {HRESULT} 
     */
    GetProxyHostName(pwszProtocol, pwszHostName, pcchHostName) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol
        pwszHostName := pwszHostName is String ? StrPtr(pwszHostName) : pwszHostName

        result := ComCall(9, this, "ptr", pwszProtocol, "ptr", pwszHostName, "uint*", pcchHostName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {PWSTR} pwszHostName 
     * @returns {HRESULT} 
     */
    SetProxyHostName(pwszProtocol, pwszHostName) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol
        pwszHostName := pwszHostName is String ? StrPtr(pwszHostName) : pwszHostName

        result := ComCall(10, this, "ptr", pwszProtocol, "ptr", pwszHostName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {Pointer<UInt32>} pdwPort 
     * @returns {HRESULT} 
     */
    GetProxyPort(pwszProtocol, pdwPort) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(11, this, "ptr", pwszProtocol, "uint*", pdwPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {Integer} dwPort 
     * @returns {HRESULT} 
     */
    SetProxyPort(pwszProtocol, dwPort) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(12, this, "ptr", pwszProtocol, "uint", dwPort, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {PWSTR} pwszExceptionList 
     * @param {Pointer<UInt32>} pcchExceptionList 
     * @returns {HRESULT} 
     */
    GetProxyExceptionList(pwszProtocol, pwszExceptionList, pcchExceptionList) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol
        pwszExceptionList := pwszExceptionList is String ? StrPtr(pwszExceptionList) : pwszExceptionList

        result := ComCall(13, this, "ptr", pwszProtocol, "ptr", pwszExceptionList, "uint*", pcchExceptionList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {PWSTR} pwszExceptionList 
     * @returns {HRESULT} 
     */
    SetProxyExceptionList(pwszProtocol, pwszExceptionList) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol
        pwszExceptionList := pwszExceptionList is String ? StrPtr(pwszExceptionList) : pwszExceptionList

        result := ComCall(14, this, "ptr", pwszProtocol, "ptr", pwszExceptionList, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {Pointer<BOOL>} pfBypassForLocal 
     * @returns {HRESULT} 
     */
    GetProxyBypassForLocal(pwszProtocol, pfBypassForLocal) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(15, this, "ptr", pwszProtocol, "ptr", pfBypassForLocal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {BOOL} fBypassForLocal 
     * @returns {HRESULT} 
     */
    SetProxyBypassForLocal(pwszProtocol, fBypassForLocal) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(16, this, "ptr", pwszProtocol, "int", fBypassForLocal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfForceRerunDetection 
     * @returns {HRESULT} 
     */
    GetForceRerunAutoProxyDetection(pfForceRerunDetection) {
        result := ComCall(17, this, "ptr", pfForceRerunDetection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fForceRerunDetection 
     * @returns {HRESULT} 
     */
    SetForceRerunAutoProxyDetection(fForceRerunDetection) {
        result := ComCall(18, this, "int", fForceRerunDetection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEnableMulticast 
     * @returns {HRESULT} 
     */
    GetEnableMulticast(pfEnableMulticast) {
        result := ComCall(19, this, "ptr", pfEnableMulticast, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnableMulticast 
     * @returns {HRESULT} 
     */
    SetEnableMulticast(fEnableMulticast) {
        result := ComCall(20, this, "int", fEnableMulticast, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEnableHTTP 
     * @returns {HRESULT} 
     */
    GetEnableHTTP(pfEnableHTTP) {
        result := ComCall(21, this, "ptr", pfEnableHTTP, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnableHTTP 
     * @returns {HRESULT} 
     */
    SetEnableHTTP(fEnableHTTP) {
        result := ComCall(22, this, "int", fEnableHTTP, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEnableUDP 
     * @returns {HRESULT} 
     */
    GetEnableUDP(pfEnableUDP) {
        result := ComCall(23, this, "ptr", pfEnableUDP, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnableUDP 
     * @returns {HRESULT} 
     */
    SetEnableUDP(fEnableUDP) {
        result := ComCall(24, this, "int", fEnableUDP, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEnableTCP 
     * @returns {HRESULT} 
     */
    GetEnableTCP(pfEnableTCP) {
        result := ComCall(25, this, "ptr", pfEnableTCP, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnableTCP 
     * @returns {HRESULT} 
     */
    SetEnableTCP(fEnableTCP) {
        result := ComCall(26, this, "int", fEnableTCP, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetProtocolRollover() {
        result := ComCall(27, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwConnectionBandwidth 
     * @returns {HRESULT} 
     */
    GetConnectionBandwidth(pdwConnectionBandwidth) {
        result := ComCall(28, this, "uint*", pdwConnectionBandwidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwConnectionBandwidth 
     * @returns {HRESULT} 
     */
    SetConnectionBandwidth(dwConnectionBandwidth) {
        result := ComCall(29, this, "uint", dwConnectionBandwidth, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pcProtocols 
     * @returns {HRESULT} 
     */
    GetNumProtocolsSupported(pcProtocols) {
        result := ComCall(30, this, "uint*", pcProtocols, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwProtocolNum 
     * @param {PWSTR} pwszProtocolName 
     * @param {Pointer<UInt32>} pcchProtocolName 
     * @returns {HRESULT} 
     */
    GetSupportedProtocolName(dwProtocolNum, pwszProtocolName, pcchProtocolName) {
        pwszProtocolName := pwszProtocolName is String ? StrPtr(pwszProtocolName) : pwszProtocolName

        result := ComCall(31, this, "uint", dwProtocolNum, "ptr", pwszProtocolName, "uint*", pcchProtocolName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwszUrl 
     * @returns {HRESULT} 
     */
    AddLoggingUrl(pwszUrl) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        result := ComCall(32, this, "ptr", pwszUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {PWSTR} pwszUrl 
     * @param {Pointer<UInt32>} pcchUrl 
     * @returns {HRESULT} 
     */
    GetLoggingUrl(dwIndex, pwszUrl, pcchUrl) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        result := ComCall(33, this, "uint", dwIndex, "ptr", pwszUrl, "uint*", pcchUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwUrlCount 
     * @returns {HRESULT} 
     */
    GetLoggingUrlCount(pdwUrlCount) {
        result := ComCall(34, this, "uint*", pdwUrlCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetLoggingUrlList() {
        result := ComCall(35, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
