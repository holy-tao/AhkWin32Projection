#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Defines the notifications supported by the IDot11AdHocManager interface.
 * @see https://docs.microsoft.com/windows/win32/api//adhoc/nn-adhoc-idot11adhocmanagernotificationsink
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class IDot11AdHocManagerNotificationSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDot11AdHocManagerNotificationSink
     * @type {Guid}
     */
    static IID => Guid("{8f10cc27-cf0d-42a0-acbe-e2de7007384d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnNetworkAdd", "OnNetworkRemove", "OnInterfaceAdd", "OnInterfaceRemove"]

    /**
     * Notifies the client that a new wireless ad hoc network destination is in range and available for connection.
     * @param {IDot11AdHocNetwork} pIAdHocNetwork A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nn-adhoc-idot11adhocnetwork">IDot11AdHocNetwork</a> interface that represents the new network.
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
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocmanagernotificationsink-onnetworkadd
     */
    OnNetworkAdd(pIAdHocNetwork) {
        result := ComCall(3, this, "ptr", pIAdHocNetwork, "HRESULT")
        return result
    }

    /**
     * Notifies the client that a wireless ad hoc network destination is no longer available for connection.
     * @param {Pointer<Guid>} Signature A pointer to a signature that uniquely identifies the newly unavailable network. For more information about signatures, see <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nf-adhoc-idot11adhocnetwork-getsignature">IDot11AdHocNetwork::GetSignature</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocmanagernotificationsink-onnetworkremove
     */
    OnNetworkRemove(Signature) {
        result := ComCall(4, this, "ptr", Signature, "HRESULT")
        return result
    }

    /**
     * Notifies the client that a new network interface card (NIC) is active.
     * @param {IDot11AdHocInterface} pIAdHocInterface A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nn-adhoc-idot11adhocinterface">IDot11AdHocInterface</a> interface that represents the activated NIC.
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
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocmanagernotificationsink-oninterfaceadd
     */
    OnInterfaceAdd(pIAdHocInterface) {
        result := ComCall(5, this, "ptr", pIAdHocInterface, "HRESULT")
        return result
    }

    /**
     * Notifies the client that a network interface card (NIC) has become inactive.
     * @param {Pointer<Guid>} Signature A pointer to a signature that uniquely identifies the inactive NIC. For more information about signatures, see <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nf-adhoc-idot11adhocinterface-getdevicesignature">IDot11AdHocInterface::GetDeviceSignature</a>.
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
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocmanagernotificationsink-oninterfaceremove
     */
    OnInterfaceRemove(Signature) {
        result := ComCall(6, this, "ptr", Signature, "HRESULT")
        return result
    }
}
