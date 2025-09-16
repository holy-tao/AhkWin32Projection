#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.EventNotificationService
 * @version v4.0.30319
 */
class EventNotificationService {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static NETWORK_ALIVE_LAN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NETWORK_ALIVE_WAN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NETWORK_ALIVE_AOL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NETWORK_ALIVE_INTERNET => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECTION_AOL => 4

    /**
     * @type {String}
     */
    static SENSGUID_PUBLISHER => "{5fee1bd6-5b9b-11d1-8dd2-00aa004abd5e}"

    /**
     * @type {String}
     */
    static SENSGUID_SUBSCRIBER_LCE => "{d3938ab0-5b9d-11d1-8dd2-00aa004abd5e}"

    /**
     * @type {String}
     */
    static SENSGUID_SUBSCRIBER_WININET => "{d3938ab5-5b9d-11d1-8dd2-00aa004abd5e}"

    /**
     * @type {String}
     */
    static SENSGUID_EVENTCLASS_NETWORK => "{d5978620-5b9f-11d1-8dd2-00aa004abd5e}"

    /**
     * @type {String}
     */
    static SENSGUID_EVENTCLASS_LOGON => "{d5978630-5b9f-11d1-8dd2-00aa004abd5e}"

    /**
     * @type {String}
     */
    static SENSGUID_EVENTCLASS_ONNOW => "{d5978640-5b9f-11d1-8dd2-00aa004abd5e}"

    /**
     * @type {String}
     */
    static SENSGUID_EVENTCLASS_LOGON2 => "{d5978650-5b9f-11d1-8dd2-00aa004abd5e}"
;@endregion Constants

;@region Methods
    /**
     * The IsDestinationReachable function determines whether or not a specified destination can be reached, and provides Quality of Connection (QOC) information for a destination. (ANSI)
     * @remarks
     * Client applications use this function to determine the QOC information before proceeding with network operations. For standalone computers that are directly connected to a network through a network card or remote access server (RAS), this function generates minimal network traffic with RPC calls to the nearest router. For computers that are part of a network where a destination can be reached by using RAS or a network gateway, this function pings a destination to generate accurate QOC information.
     * 
     * This function is only available for TCP/IP connections. A caller supplies the buffer for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sensapi/ns-sensapi-qocinfo">QOCINFO</a> structure, and must release the memory when it is not needed.
     * 
     * Starting with applications designed for Windows Vista and Windows Server 2008, developers should consider using the <a href="https://docs.microsoft.com/windows/desktop/NLA/portal">Network List Manager</a> instead of this function.
     * 
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The sensapi.h header defines IsDestinationReachable as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PSTR>} lpszDestination A pointer to a <b>null</b>-terminated string that specifies a destination. The destination can be an IP address, UNC name, or URL.
     * @param {Pointer<QOCINFO>} lpQOCInfo A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sensapi/ns-sensapi-qocinfo">QOCINFO</a> structure that receives the Quality of Connection (QOC) information. You can supply a <b>NULL</b> pointer if you do not want to receive the QOC information.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A destination can be reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A destination cannot be reached. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CALL_NOT_IMPLEMENTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function is not available on Windows Vista.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sensapi/nf-sensapi-isdestinationreachablea
     * @since windows5.1.2600
     */
    static IsDestinationReachableA(lpszDestination, lpQOCInfo) {
        lpszDestination := lpszDestination is String? StrPtr(lpszDestination) : lpszDestination

        A_LastError := 0

        result := DllCall("SensApi.dll\IsDestinationReachableA", "ptr", lpszDestination, "ptr", lpQOCInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The IsDestinationReachable function determines whether or not a specified destination can be reached, and provides Quality of Connection (QOC) information for a destination. (Unicode)
     * @remarks
     * Client applications use this function to determine the QOC information before proceeding with network operations. For standalone computers that are directly connected to a network through a network card or remote access server (RAS), this function generates minimal network traffic with RPC calls to the nearest router. For computers that are part of a network where a destination can be reached by using RAS or a network gateway, this function pings a destination to generate accurate QOC information.
     * 
     * This function is only available for TCP/IP connections. A caller supplies the buffer for the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sensapi/ns-sensapi-qocinfo">QOCINFO</a> structure, and must release the memory when it is not needed.
     * 
     * Starting with applications designed for Windows Vista and Windows Server 2008, developers should consider using the <a href="https://docs.microsoft.com/windows/desktop/NLA/portal">Network List Manager</a> instead of this function.
     * 
     * 
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The sensapi.h header defines IsDestinationReachable as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<PWSTR>} lpszDestination A pointer to a <b>null</b>-terminated string that specifies a destination. The destination can be an IP address, UNC name, or URL.
     * @param {Pointer<QOCINFO>} lpQOCInfo A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sensapi/ns-sensapi-qocinfo">QOCINFO</a> structure that receives the Quality of Connection (QOC) information. You can supply a <b>NULL</b> pointer if you do not want to receive the QOC information.
     * @returns {Integer} <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A destination can be reached.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A destination cannot be reached. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CALL_NOT_IMPLEMENTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This function is not available on Windows Vista.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sensapi/nf-sensapi-isdestinationreachablew
     * @since windows5.1.2600
     */
    static IsDestinationReachableW(lpszDestination, lpQOCInfo) {
        lpszDestination := lpszDestination is String? StrPtr(lpszDestination) : lpszDestination

        A_LastError := 0

        result := DllCall("SensApi.dll\IsDestinationReachableW", "ptr", lpszDestination, "ptr", lpQOCInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * The IsNetworkAlive function determines whether or not a local system is connected to a network, and identifies the type of network connection, for example, a LAN, WAN, or both.
     * @remarks
     * Starting with applications designed for Windows Vista and Windows Server 2008, developers should consider using the <a href="https://docs.microsoft.com/windows/desktop/NLA/portal">Network List Manager</a> instead of this function.
     * 
     * This function can be used by an application to determine whether or not there is network connectivity before proceeding with network operations. A directory service type of application, e-mail client, or Internet browser can adapt to various types of network connectivity. For example, a printing operation can be deferred until a network connection is available.
     * 
     * It may not always be practical for an application to call 
     * <b>IsNetworkAlive</b> to determine whether or not a  local system is disconnected from a LAN, because <b>IsNetworkAlive</b> can be slow, and it may take too much time for the function to detect that a local system is disconnected. 
     * However, <b>IsNetworkAlive</b> can always identify a WAN connectivity at the moment.
     * 
     * <div class="alert"><b>Note</b>  This function is only available for TCP/IP connections.</div>
     * <div> </div>
     * @param {Pointer<UInt32>} lpdwFlags 
     * @returns {Integer} Always call <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> before checking the return code of this function.  If the last error is not 0, the <b>IsNetworkAlive</b> function has failed and the following <b>TRUE</b> and <b>FALSE</b> values do not apply.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the last error is 0 and the function returns <b>TRUE</b>, SENS has determined that a  local system is connected to a network. 
     * 
     * For information about the type of connection, see the <i>lpdwFlags</i> parameter.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If the last error is 0 and the function returns <b>FALSE</b>, SENS has determined there is no connection. 
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sensapi/nf-sensapi-isnetworkalive
     * @since windows5.1.2600
     */
    static IsNetworkAlive(lpdwFlags) {
        A_LastError := 0

        result := DllCall("SensApi.dll\IsNetworkAlive", "ptr", lpdwFlags, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

;@endregion Methods
}
