#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines the notifications supported by IDot11AdHocInterface.
 * @see https://learn.microsoft.com/windows/win32/api/adhoc/nn-adhoc-idot11adhocinterfacenotificationsink
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class IDot11AdHocInterfaceNotificationSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDot11AdHocInterfaceNotificationSink
     * @type {Guid}
     */
    static IID => Guid("{8f10cc2f-cf0d-42a0-acbe-e2de7007384d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnConnectionStatusChange"]

    /**
     * Notifies the client that the connection status of the network associated with the NIC has changed.
     * @remarks
     * This notification is triggered when the connection status changes as a result of connection and disconnection requests issued by the current application. It is also triggered when other applications issue successful connection  and disconnection requests using the <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nn-adhoc-idot11adhocnetwork">IDot11AdHocNetwork</a> methods or the <a href="https://docs.microsoft.com/windows/desktop/NativeWiFi/native-wifi-functions">Native Wifi functions</a>.
     * @param {Integer} eStatus A pointer to a  <a href="https://docs.microsoft.com/windows/win32/api/adhoc/ne-adhoc-dot11_adhoc_network_connection_status">DOT11_ADHOC_NETWORK_CONNECTION_STATUS</a> value that specifies the new connection state.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
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
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method failed.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/adhoc/nf-adhoc-idot11adhocinterfacenotificationsink-onconnectionstatuschange
     */
    OnConnectionStatusChange(eStatus) {
        result := ComCall(3, this, "int", eStatus, "HRESULT")
        return result
    }
}
