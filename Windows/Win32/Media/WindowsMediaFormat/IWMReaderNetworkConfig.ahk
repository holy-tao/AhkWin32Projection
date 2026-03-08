#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\WM_PORT_NUMBER_RANGE.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IWMReaderNetworkConfig interface is used to set and test network configuration settings.
 * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nn-wmsdkidl-iwmreadernetworkconfig
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
     * The GetBufferingTime method retrieves the amount of time that the network source buffers data before rendering it.
     * @remarks
     * See the Remarks for <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setbufferingtime">SetBufferingTime</a>.
     * @returns {Integer} Pointer to a variable that receives the buffering time, in 100-nanosecond units.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getbufferingtime
     */
    GetBufferingTime() {
        result := ComCall(3, this, "uint*", &pcnsBufferingTime := 0, "HRESULT")
        return pcnsBufferingTime
    }

    /**
     * The SetBufferingTime method specifies how long the network source buffers data before rendering it.
     * @remarks
     * The minimum buffering time is 1 second and the maximum is 60 seconds. To set a buffering time of 1 second, for example, set the value to 10000000.
     * @param {Integer} cnsBufferingTime Specifies the amount of time in to buffer content before starting playback, in 100-nanosecond units.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <i>cnsBufferingTime</i> is larger than the maximum or smaller than the minimum.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setbufferingtime
     */
    SetBufferingTime(cnsBufferingTime) {
        result := ComCall(4, this, "uint", cnsBufferingTime, "HRESULT")
        return result
    }

    /**
     * The GetUDPPortRanges method retrieves the UDP port number ranges used for receiving data.
     * @remarks
     * You should make two calls to this method. On the first call, pass <b>NULL</b> for <i>pRangeArray</i>. On return, the value pointed to by <i>pcRanges</i> is set to the size of the array that you should allocate. Then you can allocate the required amount of memory for the array and pass a pointer to it as <i>pRangeArray</i> on the second call.
     * @param {Pointer<Integer>} pcRanges On input, pointer to a <b>DWORD</b> containing the length of the array passed in <i>pRangeArray</i>. On output, pointer to the required array size.
     * @returns {WM_PORT_NUMBER_RANGE} Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wmsdkidl/ns-wmsdkidl-wm_port_number_range">WM_PORT_NUMBER_RANGE</a> structures allocated by the caller. Pass <b>NULL</b> to get the size of the array.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getudpportranges
     */
    GetUDPPortRanges(pcRanges) {
        pcRangesMarshal := pcRanges is VarRef ? "uint*" : "ptr"

        pRangeArray := WM_PORT_NUMBER_RANGE()
        result := ComCall(5, this, "ptr", pRangeArray, pcRangesMarshal, pcRanges, "HRESULT")
        return pRangeArray
    }

    /**
     * The SetUDPPortRanges method specifies the UDP port number ranges that are used for receiving data.
     * @remarks
     * If no ranges are specified by the application, port numbers are selected by the reader.
     * @param {Pointer<WM_PORT_NUMBER_RANGE>} pRangeArray Pointer to an array of <b>WM_PORT_NUMBER_RANGE</b> structures.
     * @param {Integer} cRanges A value indicating the length of the array passed in <i>pRangeArray</i>.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * NULL or invalid argument passed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setudpportranges
     */
    SetUDPPortRanges(pRangeArray, cRanges) {
        result := ComCall(6, this, "ptr", pRangeArray, "uint", cRanges, "HRESULT")
        return result
    }

    /**
     * The GetProxySettings method retrieves the current proxy settings.
     * @param {PWSTR} pwszProtocol Pointer to a wide-character null-terminated string containing the protocol.
     * @returns {Integer} Pointer to one member of the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_proxy_settings">WMT_PROXY_SETTINGS</a> enumeration type.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getproxysettings
     */
    GetProxySettings(pwszProtocol) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(7, this, "ptr", pwszProtocol, "int*", &pProxySetting := 0, "HRESULT")
        return pProxySetting
    }

    /**
     * The SetProxySettings method specifies the proxy settings.
     * @remarks
     * Setting the protocol to WMT_PROXY_SETTING_MANUAL causes the reader to use the proxy settings from <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setproxyhostname">SetProxyHostName</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setproxyport">SetProxyPort</a>. Setting it to WMT_PROXY_SETTING_AUTO uses Web Proxy Auto-Detect mechanisms to dynamically determine the appropriate proxy based on the specified URL. Setting the protocol to WMT_PROXY_SETTING_BROWSER is valid only for HTTP URLs, and causes the reader to use the proxy settings that are configured in the browser.
     * @param {PWSTR} pwszProtocol Pointer to a wide-character null-terminated string containing the protocol name. Supported names are HTTP and MMS.
     * @param {Integer} ProxySetting A value from the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/ne-wmsdkidl-wmt_proxy_settings">WMT_PROXY_SETTINGS</a> enumeration type.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * NULL or invalid argument passed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setproxysettings
     */
    SetProxySettings(pwszProtocol, ProxySetting) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(8, this, "ptr", pwszProtocol, "int", ProxySetting, "HRESULT")
        return result
    }

    /**
     * The GetProxyHostName method retrieves the name of the host to use as the proxy.
     * @remarks
     * Call this method twice. The first time, pass <b>NULL</b> as the value for <i>pwszHostName</i>. The method returns the size of the string in the <i>pcchHostName</i> parameter. Allocate the required amount of memory for the string and call the method again. This time, pass a pointer to the allocated buffer in the <i>pwszHostName</i> parameter.
     * 
     * The host name is ignored if the proxy setting is WMT_PROXY_SETTING_AUTO or WMT_PROXY_SETTING_BROWSER.
     * @param {PWSTR} pwszProtocol Pointer to a string that contains a protocol name, such as "http" or "mms". The string is not case-sensitive.
     * @param {PWSTR} pwszHostName Pointer to a buffer that receives the name of the proxy server host. The returned value applies only to the protocol specified in <i>pwszProtocol</i>; the reader object supports separate settings for each protocol.
     * @param {Pointer<Integer>} pcchHostName On input, pointer to a variable specifying the size of <i>pwszHostName</i>, in characters. On output, the variable contains the length of the string, including the terminating <b>null</b> character.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * The size of the buffer passed in is not large enough to hold the return string.
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
     * <b>NULL</b> or invalid argument passed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getproxyhostname
     */
    GetProxyHostName(pwszProtocol, pwszHostName, pcchHostName) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol
        pwszHostName := pwszHostName is String ? StrPtr(pwszHostName) : pwszHostName

        pcchHostNameMarshal := pcchHostName is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr", pwszProtocol, "ptr", pwszHostName, pcchHostNameMarshal, pcchHostName, "HRESULT")
        return result
    }

    /**
     * The SetProxyHostName method specifies the proxy host name.
     * @remarks
     * By default, the proxy host name is <b>NULL</b>, and must be set if a proxy is being used.
     * @param {PWSTR} pwszProtocol Pointer to a wide-character <b>null</b>-terminated string containing the protocol.
     * @param {PWSTR} pwszHostName Pointer to a wide-character <b>null</b>-terminated string containing the host name. Host names are limited to 1024 wide characters.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <b>NULL</b> or invalid argument passed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setproxyhostname
     */
    SetProxyHostName(pwszProtocol, pwszHostName) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol
        pwszHostName := pwszHostName is String ? StrPtr(pwszHostName) : pwszHostName

        result := ComCall(10, this, "ptr", pwszProtocol, "ptr", pwszHostName, "HRESULT")
        return result
    }

    /**
     * The GetProxyPort method retrieves the port number of the proxy server.
     * @param {PWSTR} pwszProtocol Pointer to a string that contains a protocol name, such as "http" or "mms". The string is not case-sensitive.
     * @returns {Integer} Pointer to a variable that receives the port number. The returned value applies only to the protocol specified in <i>pwszProtocol</i>; the reader object supports separate settings for each protocol.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getproxyport
     */
    GetProxyPort(pwszProtocol) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(11, this, "ptr", pwszProtocol, "uint*", &pdwPort := 0, "HRESULT")
        return pdwPort
    }

    /**
     * The SetProxyPort method specifies the proxy port.
     * @remarks
     * By default, the port numbers are 1755 for MMS and 80 for HTTP. The correct port number must be set if a port is required. It is not required if the proxy setting is WMT_PROXY_SETTING_AUTO or WMT_PROXY_SETTING_BROWSER.
     * @param {PWSTR} pwszProtocol Pointer to a wide-character null-terminated string containing the protocol.
     * @param {Integer} dwPort <b>DWORD</b> containing the name of the port.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * NULL or invalid argument passed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setproxyport
     */
    SetProxyPort(pwszProtocol, dwPort) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(12, this, "ptr", pwszProtocol, "uint", dwPort, "HRESULT")
        return result
    }

    /**
     * The GetProxyExceptionList method retrieves the list of computers, domains, or addresses for which the reader object bypasses the proxy server.
     * @remarks
     * Call this method twice. The first time, pass <b>NULL</b> as the value for <i>pwszExceptionList</i>. The method returns the size of the string in the <i>pcchExceptionList</i> parameter. Allocate the required amount of memory for the string and call the method again. This time, pass a pointer to the allocated buffer in the <i>pwszExceptionList</i> parameter.
     * 
     * For more information, see the Remarks for <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setproxyexceptionlist">SetProxyExceptionList</a>.
     * @param {PWSTR} pwszProtocol Pointer to a string that contains a protocol name, such as "http" or "mms". The string is not case-sensitive.
     * @param {PWSTR} pwszExceptionList Pointer to a buffer that receives a string containing the exception list. The returned string is a comma-separated list. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setproxyexceptionlist">SetProxyExceptionList</a>. The list applies only to the protocol specified in <i>pwszProtocol</i>; the reader object supports separate settings for each protocol.
     * @param {Pointer<Integer>} pcchExceptionList On input, pointer to a variable specifying the size of the <i>pwszExceptionList</i> buffer, in characters. On output, the variable contains the length of the string, including the terminating <b>null</b> character.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <b>NULL</b> or invalid argument passed in.
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
     * The size of the buffer passed in is not large enough to hold the return string.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getproxyexceptionlist
     */
    GetProxyExceptionList(pwszProtocol, pwszExceptionList, pcchExceptionList) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol
        pwszExceptionList := pwszExceptionList is String ? StrPtr(pwszExceptionList) : pwszExceptionList

        pcchExceptionListMarshal := pcchExceptionList is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, "ptr", pwszProtocol, "ptr", pwszExceptionList, pcchExceptionListMarshal, pcchExceptionList, "HRESULT")
        return result
    }

    /**
     * The SetProxyExceptionList method specifies the proxy exception list.
     * @remarks
     * The exception list is a list of computers, domains, or addresses that bypass the proxy host name when the host in the target URL matches an entry in the list.
     * 
     * Wildcard characters can be used in the list entries (using the * character). For example "*.com" would match all hosts in the "com" domain while "67.*" would match all hosts in the 67 class A subnet. The exception list is used only when the proxy setting is WMT_PROXY_SETTING_MANUAL. If the proxy setting is WMT_PROXY_SETTING_BROWSER, then the exception list configured in the browser is used instead.
     * @param {PWSTR} pwszProtocol Pointer to a wide-character null-terminated string containing the protocol.
     * @param {PWSTR} pwszExceptionList Pointer to a wide-character null-terminated string containing the exception list. The list must be a comma-separated list of hosts. Exception lists are limited to 1024 wide characters.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * NULL or invalid argument passed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setproxyexceptionlist
     */
    SetProxyExceptionList(pwszProtocol, pwszExceptionList) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol
        pwszExceptionList := pwszExceptionList is String ? StrPtr(pwszExceptionList) : pwszExceptionList

        result := ComCall(14, this, "ptr", pwszProtocol, "ptr", pwszExceptionList, "HRESULT")
        return result
    }

    /**
     * The GetProxyBypassForLocal method queries whether the reader object bypasses the proxy server for local URLs.
     * @param {PWSTR} pwszProtocol Pointer to a string that contains a protocol name, such as "http" or "mms". The string is not case-sensitive.
     * @returns {BOOL} Pointer to a variable that receives a Boolean value. If the value is <b>TRUE</b>, the reader bypasses the proxy server when it retrieves a URL from a local host. If the value is <b>FALSE</b>, the reader always goes through the proxy server (if any). The returned value applies only to the protocol specified in <i>pwszProtocol</i>; the reader object supports separate settings for each protocol.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getproxybypassforlocal
     */
    GetProxyBypassForLocal(pwszProtocol) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(15, this, "ptr", pwszProtocol, "int*", &pfBypassForLocal := 0, "HRESULT")
        return pfBypassForLocal
    }

    /**
     * The SetProxyBypassForLocal method specifies the configuration setting for bypassing the proxy for local hosts.
     * @remarks
     * This setting is used only when the proxy setting is WMT_PROXY_SETTING_MANUAL. If the proxy setting is WMT_PROXY_SETTING_BROWSER, the local bypass flag setting in the browser is used instead.
     * @param {PWSTR} pwszProtocol Pointer to a wide-character null-terminated string containing the protocol.
     * @param {BOOL} fBypassForLocal Boolean value that is True if bypassing the proxy for local hosts is to be enabled (implying that the origin server is on the local network).
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * NULL or invalid argument passed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setproxybypassforlocal
     */
    SetProxyBypassForLocal(pwszProtocol, fBypassForLocal) {
        pwszProtocol := pwszProtocol is String ? StrPtr(pwszProtocol) : pwszProtocol

        result := ComCall(16, this, "ptr", pwszProtocol, "int", fBypassForLocal, "HRESULT")
        return result
    }

    /**
     * The GetForceRerunAutoProxyDetection method ascertains whether forced rerun detection is enabled.
     * @remarks
     * See the Remarks for <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setforcererunautoproxydetection">SetForceRerunAutoProxyDetection</a>.
     * @returns {BOOL} Pointer to a Boolean value that is set to True if forced rerun detection has been enabled.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getforcererunautoproxydetection
     */
    GetForceRerunAutoProxyDetection() {
        result := ComCall(17, this, "int*", &pfForceRerunDetection := 0, "HRESULT")
        return pfForceRerunDetection
    }

    /**
     * The SetForceRerunAutoProxyDetection method enables or disables forced rerun detection.
     * @remarks
     * Forced rerun detection indicates that Web Proxy Auto-Detection mechanisms must be invoked before the next streaming connection is established.
     * 
     * Setting <i>fForceRerunDetection</i> to True applies to all protocols when the auto setting has been specified by the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setproxysettings">SetProxySettings</a> method.
     * @param {BOOL} fForceRerunDetection Boolean value that is True if forced rerun detection is to be enabled.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * NULL or invalid argument passed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setforcererunautoproxydetection
     */
    SetForceRerunAutoProxyDetection(fForceRerunDetection) {
        result := ComCall(18, this, "int", fForceRerunDetection, "HRESULT")
        return result
    }

    /**
     * The GetEnableMulticast method ascertains whether multicast is enabled.
     * @returns {BOOL} Pointer to a Boolean value that is set to True if multicast has been enabled.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getenablemulticast
     */
    GetEnableMulticast() {
        result := ComCall(19, this, "int*", &pfEnableMulticast := 0, "HRESULT")
        return pfEnableMulticast
    }

    /**
     * The SetEnableMulticast method enables or disables multicasting.
     * @param {BOOL} fEnableMulticast Boolean value that is True if multicasting is to be enabled.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * NULL or invalid argument passed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setenablemulticast
     */
    SetEnableMulticast(fEnableMulticast) {
        result := ComCall(20, this, "int", fEnableMulticast, "HRESULT")
        return result
    }

    /**
     * The GetEnableHTTP method queries whether HTTP is enabled for protocol rollover.
     * @returns {BOOL} Pointer to a variable that receives a Boolean value. If the value is <b>TRUE</b>, the reader object includes HTTP when it performs protocol rollover. If the value is <b>FALSE</b>, the reader does not use HTTP for protocol rollover. However, the reader will still use HTTP if it is explicitly specified in the URL.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getenablehttp
     */
    GetEnableHTTP() {
        result := ComCall(21, this, "int*", &pfEnableHTTP := 0, "HRESULT")
        return pfEnableHTTP
    }

    /**
     * The SetEnableHTTP method enables or disables HTTP.
     * @remarks
     * This setting applies only to a protocol rollover or MMS:// URL. Even if this setting is disabled, the application can still specify an explicit HTTP://URL and stream successfully.
     * @param {BOOL} fEnableHTTP Boolean value that is True if HTTP is to be enabled. Set this value to true if the reader can use HTTP when selecting a protocol for streaming.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * NULL or invalid argument passed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setenablehttp
     */
    SetEnableHTTP(fEnableHTTP) {
        result := ComCall(22, this, "int", fEnableHTTP, "HRESULT")
        return result
    }

    /**
     * The GetEnableUDP method queries whether UDP is enabled for protocol rollover.
     * @returns {BOOL} Pointer to a variable that receives a Boolean value. If the value is <b>TRUE</b>, the reader object includes UDP when it performs protocol rollover. If the value is <b>FALSE</b>, the reader does not use UDP for protocol rollover. However, the reader will still use UDP if the URL explicitly specifies a UDP-based protocol, such as MMSU or RTSPU.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getenableudp
     */
    GetEnableUDP() {
        result := ComCall(23, this, "int*", &pfEnableUDP := 0, "HRESULT")
        return pfEnableUDP
    }

    /**
     * The SetEnableUDP method enables or disables UDP.
     * @remarks
     * This setting applies only to a protocol rollover or MMS://URL. Even if this setting is disabled, the application can still specify an explicit MMSU://URL and stream MMS via TCP successfully.
     * 
     * For more information, see the Remarks section of <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-resetprotocolrollover">IWMReaderNetworkConfig::ResetProtocolRollover</a>.
     * @param {BOOL} fEnableUDP Boolean value that is True if UDP is to be enabled. Set this to true if the reader can use UDP-based MMS streaming when selecting a protocol for streaming.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * NULL or invalid argument passed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setenableudp
     */
    SetEnableUDP(fEnableUDP) {
        result := ComCall(24, this, "int", fEnableUDP, "HRESULT")
        return result
    }

    /**
     * The GetEnableTCP method queries whether TCP is enabled for protocol rollover.
     * @returns {BOOL} Pointer to a variable that receives a Boolean value. If the value is <b>TRUE</b>, the reader object includes TCP when it performs protocol rollover. If the value is <b>FALSE</b>, the reader does not use TCP for protocol rollover. However, the reader will still use TCP if the URL explicitly specifies a TCP-based protocol, such as MMST or RTSPT.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getenabletcp
     */
    GetEnableTCP() {
        result := ComCall(25, this, "int*", &pfEnableTCP := 0, "HRESULT")
        return pfEnableTCP
    }

    /**
     * The SetEnableTCP method enables or disables TCP.
     * @remarks
     * This setting applies only to a protocol rollover or MMS://URL. Even if this setting is disabled, the application can still specify an explicit MMST://URL and stream MMS via TCP successfully.
     * @param {BOOL} fEnableTCP Boolean value that is True if TCP is to be enabled. Set this to true if the SDK can use TCP-based MMS streaming when selecting a protocol for streaming.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * NULL or invalid argument passed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setenabletcp
     */
    SetEnableTCP(fEnableTCP) {
        result := ComCall(26, this, "int", fEnableTCP, "HRESULT")
        return result
    }

    /**
     * The ResetProtocolRollover method forces the reader object to use the normal protocol rollover algorithm.
     * @remarks
     * Protocol rollover is a process whereby the reader object discovers the best streaming protocol available from a server. For more information, see <a href="https://docs.microsoft.com/windows/desktop/wmformat/protocol-rollover">Protocol Rollover</a>.
     * 
     * When the reader object uses protocol rollover, it records which protocol was used and tries that protocol first on subsequent connection attempts. After a certain period of time, the reader object goes back to the default protocol rollover behavior.
     * 
     * However, if the application disables a particular protocol (for example, by calling <b>SetEnableUDP</b> or <b>SetEnableTCP</b>), the reader object may use a protocol that is less efficient than necessary. You can force the reader object to use the default protocol rollover behavior by calling the <b>ResetProtocolRollover</b> method.
     * 
     * Player users sometimes experiment with network settings when they are having connectivity problems. By using this method to reset the protocol rollover settings, the application can improve the quality of streaming that users receive.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-resetprotocolrollover
     */
    ResetProtocolRollover() {
        result := ComCall(27, this, "HRESULT")
        return result
    }

    /**
     * The GetConnectionBandwidth method retrieves the connection bandwidth for the client.
     * @remarks
     * If this method returns zero, the bandwidth could not be detected. If the application has not called <b>SetConnectionBandwidth</b> (or called it with a zero parameter), the return value is the connection rate detected by the reader.
     * 
     * If you want to determine the connection bandwidth before receiving a sample, use this method.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the connection bandwidth, in bits per second.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getconnectionbandwidth
     */
    GetConnectionBandwidth() {
        result := ComCall(28, this, "uint*", &pdwConnectionBandwidth := 0, "HRESULT")
        return pdwConnectionBandwidth
    }

    /**
     * The SetConnectionBandwidth method specifies the connection bandwidth for the client.
     * @remarks
     * By default, the SDK automatically detects the bandwidth of the connection to the server. When auto-detection is set, a call to <b>GetConnectionBandwidth</b> following the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreader-open">Open</a> request returns the dynamically detected connection bandwidth.
     * 
     * Setting a bandwidth by using this method is sometimes called <i>bandwidth-throttling</i> because it deliberately limits the available bandwidth.
     * @param {Integer} dwConnectionBandwidth Specifies the maximum bandwidth for the connection, in bits per second. Specify zero for the reader to automatically detect the bandwidth
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * NULL or invalid argument passed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-setconnectionbandwidth
     */
    SetConnectionBandwidth(dwConnectionBandwidth) {
        result := ComCall(29, this, "uint", dwConnectionBandwidth, "HRESULT")
        return result
    }

    /**
     * The GetNumProtocolsSupported method retrieves the number of supported protocols.
     * @remarks
     * Use this method along with <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreaderadvanced2-getprotocolname">IWMReaderAdvanced2::GetProtocolName</a> to iterate through the network protocols supported by the reader.
     * 
     * This method counts the number of protocols that the reader can use when receiving a stream. It does not indicate the protocols that are available for sending a stream.
     * @returns {Integer} Pointer to a count of the protocols.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getnumprotocolssupported
     */
    GetNumProtocolsSupported() {
        result := ComCall(30, this, "uint*", &pcProtocols := 0, "HRESULT")
        return pcProtocols
    }

    /**
     * The GetSupportedProtocolName method retrieves a protocol name by index.
     * @remarks
     * You should make two calls to <b>GetSupportedProtocolName</b>. On the first call, pass <b>NULL</b> for <i>pwszProtocoName</i>. On return, the value pointed to by <i>pcchProtocolName</i> is set to the number of wide characters, including the terminating <b>null</b>, required to hold the protocol name. Then you can allocate the required amount of memory for the string and pass a pointer to it as <i>pwszProtocolName</i> on the second call.
     * 
     * Use this method along with <b>GetNumProtocolsSupported</b> to iterate through the network protocols supported by the reader object.
     * 
     * This method only returns a list of protocols that are used to receive content from Windows Media servers. Protocols that are only used for retrieving content from local sources, or non-Windows Media servers (such as Web servers) are not included in this list.
     * 
     * <div class="alert"><b>Note</b>  The HTTPS support works only when downloading content from a Web server (because the player is using WININET). Streaming protocols supported are HTTP, RTSP, MMS, and, for multicasting, ASFM (by opening an ASF file with an .nsc extension). Download support includes HTTP, HTTPS, and FTP.</div>
     * <div> </div>
     * @param {Integer} dwProtocolNum Specifies protocol name to retrieve, indexed from zero. To get the number of supported protocols, call the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getnumprotocolssupported">IWMReaderNetworkConfig::GetNumProtocolsSupported</a> method.
     * @param {PWSTR} pwszProtocolName Pointer to a wide-character <b>null</b>-terminated string containing the protocol name. Pass <b>NULL</b> to retrieve the length of the name.
     * @param {Pointer<Integer>} pcchProtocolName On input, pointer to a <b>DWORD</b> containing the length of the <i>pwszProtocolName</i>, in characters. On output, pointer to the length of the protocol name, including the terminating <b>null</b> character.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <b>NULL</b> or invalid argument passed in.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getsupportedprotocolname
     */
    GetSupportedProtocolName(dwProtocolNum, pwszProtocolName, pcchProtocolName) {
        pwszProtocolName := pwszProtocolName is String ? StrPtr(pwszProtocolName) : pwszProtocolName

        pcchProtocolNameMarshal := pcchProtocolName is VarRef ? "uint*" : "ptr"

        result := ComCall(31, this, "uint", dwProtocolNum, "ptr", pwszProtocolName, pcchProtocolNameMarshal, pcchProtocolName, "HRESULT")
        return result
    }

    /**
     * The AddLoggingUrl method specifies a server that receive logging information from the reader object.
     * @remarks
     * When the reader streams content from a server, it automatically sends logging information to that server. Use the <b>AddLoggingUrl</b> method to specify additional servers that will receive the logging information.
     * @param {PWSTR} pwszUrl Specifies a string containing the URL.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * Null value passed in to <i>pwszUrl</i>
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Unable to create or add the URL.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-addloggingurl
     */
    AddLoggingUrl(pwszUrl) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        result := ComCall(32, this, "ptr", pwszUrl, "HRESULT")
        return result
    }

    /**
     * The GetLoggingUrl method retrieves a URL from the list of servers that receive logging information from the reader object. Use the IWMReaderNetworkConfig::GetLoggingUrl method to add servers to the list.
     * @remarks
     * You should make two calls to <b>GetLoggingUrl</b>. On the first call, pass <b>NULL</b> for <i>pwszUrl</i>. On return, the value pointed to by <i>pcchUrl</i> is set to the number of wide characters, including the terminating <b>null</b>, required to hold the URL. Then you can allocate the required amount of memory for the string and pass a pointer to it as <i>pwszUrl</i> on the second call.
     * @param {Integer} dwIndex Specifies which URL to retrieve, indexed from zero. To get the number of URLs, call the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getloggingurlcount">IWMReaderNetworkConfig::GetLoggingUrlCount</a> method.
     * @param {PWSTR} pwszUrl Pointer to a buffer that receives a string containing the URL. The caller must allocate the buffer.
     * @param {Pointer<Integer>} pcchUrl On input, specifies the length of the <i>pwszUrl</i> buffer, in characters. On output, receives the length of the URL, including the terminating <b>null</b> character.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <b>NULL</b> or invalid argument passed in.
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
     * Size passed in to <i>pcchUrl</i> is too small.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getloggingurl
     */
    GetLoggingUrl(dwIndex, pwszUrl, pcchUrl) {
        pwszUrl := pwszUrl is String ? StrPtr(pwszUrl) : pwszUrl

        pcchUrlMarshal := pcchUrl is VarRef ? "uint*" : "ptr"

        result := ComCall(33, this, "uint", dwIndex, "ptr", pwszUrl, pcchUrlMarshal, pcchUrl, "HRESULT")
        return result
    }

    /**
     * The GetLoggingUrlCount method retrieves the number of URLs in the current list of logging URLs.
     * @returns {Integer} Pointer to a <b>DWORD</b> containing the URL count.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-getloggingurlcount
     */
    GetLoggingUrlCount() {
        result := ComCall(34, this, "uint*", &pdwUrlCount := 0, "HRESULT")
        return pdwUrlCount
    }

    /**
     * The ResetLoggingUrlList method clears the list of servers that receive logging data.
     * @remarks
     * This method removes any servers that were added using the <a href="https://docs.microsoft.com/windows/desktop/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-addloggingurl">IWMReaderNetworkConfig::AddLoggingUrl</a> method. Note that the originating server always receives a log, even after the list is cleared.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/wmsdkidl/nf-wmsdkidl-iwmreadernetworkconfig-resetloggingurllist
     */
    ResetLoggingUrlList() {
        result := ComCall(35, this, "HRESULT")
        return result
    }
}
