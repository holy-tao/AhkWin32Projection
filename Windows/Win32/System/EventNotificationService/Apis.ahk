#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk

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
     * @type {Guid}
     */
    static SENSGUID_PUBLISHER => Guid("{5fee1bd6-5b9b-11d1-8dd2-00aa004abd5e}")

    /**
     * @type {Guid}
     */
    static SENSGUID_SUBSCRIBER_LCE => Guid("{d3938ab0-5b9d-11d1-8dd2-00aa004abd5e}")

    /**
     * @type {Guid}
     */
    static SENSGUID_SUBSCRIBER_WININET => Guid("{d3938ab5-5b9d-11d1-8dd2-00aa004abd5e}")

    /**
     * @type {Guid}
     */
    static SENSGUID_EVENTCLASS_NETWORK => Guid("{d5978620-5b9f-11d1-8dd2-00aa004abd5e}")

    /**
     * @type {Guid}
     */
    static SENSGUID_EVENTCLASS_LOGON => Guid("{d5978630-5b9f-11d1-8dd2-00aa004abd5e}")

    /**
     * @type {Guid}
     */
    static SENSGUID_EVENTCLASS_ONNOW => Guid("{d5978640-5b9f-11d1-8dd2-00aa004abd5e}")

    /**
     * @type {Guid}
     */
    static SENSGUID_EVENTCLASS_LOGON2 => Guid("{d5978650-5b9f-11d1-8dd2-00aa004abd5e}")
;@endregion Constants

;@region Methods
    /**
     * The IsDestinationReachable function determines whether or not a specified destination can be reached, and provides Quality of Connection (QOC) information for a destination.
     * @param {PSTR} lpszDestination A pointer to a <b>null</b>-terminated string that specifies a destination. The destination can be an IP address, UNC name, or URL.
     * @param {Pointer<QOCINFO>} lpQOCInfo A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sensapi/ns-sensapi-qocinfo">QOCINFO</a> structure that receives the Quality of Connection (QOC) information. You can supply a <b>NULL</b> pointer if you do not want to receive the QOC information.
     * @returns {BOOL} <table>
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
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//sensapi/nf-sensapi-isdestinationreachablea
     * @since windows5.1.2600
     */
    static IsDestinationReachableA(lpszDestination, lpQOCInfo) {
        lpszDestination := lpszDestination is String ? StrPtr(lpszDestination) : lpszDestination

        A_LastError := 0

        result := DllCall("SensApi.dll\IsDestinationReachableA", "ptr", lpszDestination, "ptr", lpQOCInfo, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IsDestinationReachable function determines whether or not a specified destination can be reached, and provides Quality of Connection (QOC) information for a destination.
     * @param {PWSTR} lpszDestination A pointer to a <b>null</b>-terminated string that specifies a destination. The destination can be an IP address, UNC name, or URL.
     * @param {Pointer<QOCINFO>} lpQOCInfo A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sensapi/ns-sensapi-qocinfo">QOCINFO</a> structure that receives the Quality of Connection (QOC) information. You can supply a <b>NULL</b> pointer if you do not want to receive the QOC information.
     * @returns {BOOL} <table>
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
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//sensapi/nf-sensapi-isdestinationreachablew
     * @since windows5.1.2600
     */
    static IsDestinationReachableW(lpszDestination, lpQOCInfo) {
        lpszDestination := lpszDestination is String ? StrPtr(lpszDestination) : lpszDestination

        A_LastError := 0

        result := DllCall("SensApi.dll\IsDestinationReachableW", "ptr", lpszDestination, "ptr", lpQOCInfo, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IsNetworkAlive function determines whether or not a local system is connected to a network, and identifies the type of network connection, for example, a LAN, WAN, or both.
     * @param {Pointer<Integer>} lpdwFlags 
     * @returns {BOOL} Always call <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> before checking the return code of this function.  If the last error is not 0, the <b>IsNetworkAlive</b> function has failed and the following <b>TRUE</b> and <b>FALSE</b> values do not apply.
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
     * @see https://docs.microsoft.com/windows/win32/api//sensapi/nf-sensapi-isnetworkalive
     * @since windows5.1.2600
     */
    static IsNetworkAlive(lpdwFlags) {
        lpdwFlagsMarshal := lpdwFlags is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("SensApi.dll\IsNetworkAlive", lpdwFlagsMarshal, lpdwFlags, "int")
        if((!result && A_LastError)) {
            throw OSError(A_LastError || result)
        }

        return result
    }

;@endregion Methods
}
