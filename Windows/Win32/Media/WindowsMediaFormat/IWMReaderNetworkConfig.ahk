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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetBufferingTime", "SetBufferingTime", "GetUDPPortRanges", "SetUDPPortRanges", "GetProxySettings", "SetProxySettings", "GetProxyHostName", "SetProxyHostName", "GetProxyPort", "SetProxyPort", "GetProxyExceptionList", "SetProxyExceptionList", "GetProxyBypassForLocal", "SetProxyBypassForLocal", "GetForceRerunAutoProxyDetection", "SetForceRerunAutoProxyDetection", "GetEnableMulticast", "SetEnableMulticast", "GetEnableHTTP", "SetEnableHTTP", "GetEnableUDP", "SetEnableUDP", "GetEnableTCP", "SetEnableTCP", "ResetProtocolRollover", "GetConnectionBandwidth", "SetConnectionBandwidth", "GetNumProtocolsSupported", "GetSupportedProtocolName", "AddLoggingUrl", "GetLoggingUrl", "GetLoggingUrlCount", "ResetLoggingUrlList"]

    /**
     * 
     * @param {Pointer<Integer>} pcnsBufferingTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getbufferingtime
     */
    GetBufferingTime(pcnsBufferingTime) {
        result := ComCall(3, this, "uint*", pcnsBufferingTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} cnsBufferingTime 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setbufferingtime
     */
    SetBufferingTime(cnsBufferingTime) {
        result := ComCall(4, this, "uint", cnsBufferingTime, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WM_PORT_NUMBER_RANGE>} pRangeArray 
     * @param {Pointer<Integer>} pcRanges 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getudpportranges
     */
    GetUDPPortRanges(pRangeArray, pcRanges) {
        result := ComCall(5, this, "ptr", pRangeArray, "uint*", pcRanges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<WM_PORT_NUMBER_RANGE>} pRangeArray 
     * @param {Integer} cRanges 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setudpportranges
     */
    SetUDPPortRanges(pRangeArray, cRanges) {
        result := ComCall(6, this, "ptr", pRangeArray, "uint", cRanges, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {Pointer<Integer>} pProxySetting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getproxysettings
     */
    GetProxySettings(pwszProtocol, pProxySetting) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(7, this, "ptr", pwszProtocol, "int*", pProxySetting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {Integer} ProxySetting 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setproxysettings
     */
    SetProxySettings(pwszProtocol, ProxySetting) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(8, this, "ptr", pwszProtocol, "int", ProxySetting, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {PWSTR} pwszHostName 
     * @param {Pointer<Integer>} pcchHostName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getproxyhostname
     */
    GetProxyHostName(pwszProtocol, pwszHostName, pcchHostName) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol
        pwszHostName := pwszHostName is String ? StrPtr(pwszHostName) : pwszHostName

        result := ComCall(9, this, "ptr", pwszProtocol, "ptr", pwszHostName, "uint*", pcchHostName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {PWSTR} pwszHostName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setproxyhostname
     */
    SetProxyHostName(pwszProtocol, pwszHostName) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol
        pwszHostName := pwszHostName is String ? StrPtr(pwszHostName) : pwszHostName

        result := ComCall(10, this, "ptr", pwszProtocol, "ptr", pwszHostName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {Pointer<Integer>} pdwPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getproxyport
     */
    GetProxyPort(pwszProtocol, pdwPort) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(11, this, "ptr", pwszProtocol, "uint*", pdwPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {Integer} dwPort 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setproxyport
     */
    SetProxyPort(pwszProtocol, dwPort) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(12, this, "ptr", pwszProtocol, "uint", dwPort, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {PWSTR} pwszExceptionList 
     * @param {Pointer<Integer>} pcchExceptionList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getproxyexceptionlist
     */
    GetProxyExceptionList(pwszProtocol, pwszExceptionList, pcchExceptionList) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol
        pwszExceptionList := pwszExceptionList is String ? StrPtr(pwszExceptionList) : pwszExceptionList

        result := ComCall(13, this, "ptr", pwszProtocol, "ptr", pwszExceptionList, "uint*", pcchExceptionList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {PWSTR} pwszExceptionList 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setproxyexceptionlist
     */
    SetProxyExceptionList(pwszProtocol, pwszExceptionList) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol
        pwszExceptionList := pwszExceptionList is String ? StrPtr(pwszExceptionList) : pwszExceptionList

        result := ComCall(14, this, "ptr", pwszProtocol, "ptr", pwszExceptionList, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {Pointer<BOOL>} pfBypassForLocal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getproxybypassforlocal
     */
    GetProxyBypassForLocal(pwszProtocol, pfBypassForLocal) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(15, this, "ptr", pwszProtocol, "ptr", pfBypassForLocal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszProtocol 
     * @param {BOOL} fBypassForLocal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setproxybypassforlocal
     */
    SetProxyBypassForLocal(pwszProtocol, fBypassForLocal) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(16, this, "ptr", pwszProtocol, "int", fBypassForLocal, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfForceRerunDetection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getforcererunautoproxydetection
     */
    GetForceRerunAutoProxyDetection(pfForceRerunDetection) {
        result := ComCall(17, this, "ptr", pfForceRerunDetection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fForceRerunDetection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setforcererunautoproxydetection
     */
    SetForceRerunAutoProxyDetection(fForceRerunDetection) {
        result := ComCall(18, this, "int", fForceRerunDetection, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEnableMulticast 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getenablemulticast
     */
    GetEnableMulticast(pfEnableMulticast) {
        result := ComCall(19, this, "ptr", pfEnableMulticast, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnableMulticast 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setenablemulticast
     */
    SetEnableMulticast(fEnableMulticast) {
        result := ComCall(20, this, "int", fEnableMulticast, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEnableHTTP 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getenablehttp
     */
    GetEnableHTTP(pfEnableHTTP) {
        result := ComCall(21, this, "ptr", pfEnableHTTP, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnableHTTP 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setenablehttp
     */
    SetEnableHTTP(fEnableHTTP) {
        result := ComCall(22, this, "int", fEnableHTTP, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEnableUDP 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getenableudp
     */
    GetEnableUDP(pfEnableUDP) {
        result := ComCall(23, this, "ptr", pfEnableUDP, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnableUDP 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setenableudp
     */
    SetEnableUDP(fEnableUDP) {
        result := ComCall(24, this, "int", fEnableUDP, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BOOL>} pfEnableTCP 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getenabletcp
     */
    GetEnableTCP(pfEnableTCP) {
        result := ComCall(25, this, "ptr", pfEnableTCP, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BOOL} fEnableTCP 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setenabletcp
     */
    SetEnableTCP(fEnableTCP) {
        result := ComCall(26, this, "int", fEnableTCP, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-resetprotocolrollover
     */
    ResetProtocolRollover() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwConnectionBandwidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getconnectionbandwidth
     */
    GetConnectionBandwidth(pdwConnectionBandwidth) {
        result := ComCall(28, this, "uint*", pdwConnectionBandwidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwConnectionBandwidth 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setconnectionbandwidth
     */
    SetConnectionBandwidth(dwConnectionBandwidth) {
        result := ComCall(29, this, "uint", dwConnectionBandwidth, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcProtocols 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getnumprotocolssupported
     */
    GetNumProtocolsSupported(pcProtocols) {
        result := ComCall(30, this, "uint*", pcProtocols, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwProtocolNum 
     * @param {PWSTR} pwszProtocolName 
     * @param {Pointer<Integer>} pcchProtocolName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getsupportedprotocolname
     */
    GetSupportedProtocolName(dwProtocolNum, pwszProtocolName, pcchProtocolName) {
        pwszProtocolName := pwszProtocolName is String ? StrPtr(pwszProtocolName) : pwszProtocolName

        result := ComCall(31, this, "uint", dwProtocolNum, "ptr", pwszProtocolName, "uint*", pcchProtocolName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwszUrl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-addloggingurl
     */
    AddLoggingUrl(pwszUrl) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        result := ComCall(32, this, "ptr", pwszUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwIndex 
     * @param {PWSTR} pwszUrl 
     * @param {Pointer<Integer>} pcchUrl 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getloggingurl
     */
    GetLoggingUrl(dwIndex, pwszUrl, pcchUrl) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        result := ComCall(33, this, "uint", dwIndex, "ptr", pwszUrl, "uint*", pcchUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwUrlCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getloggingurlcount
     */
    GetLoggingUrlCount(pdwUrlCount) {
        result := ComCall(34, this, "uint*", pdwUrlCount, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-resetloggingurllist
     */
    ResetLoggingUrlList() {
        result := ComCall(35, this, "HRESULT")
        return result
    }
}
