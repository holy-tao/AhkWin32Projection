#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IDot11AdHocNetwork.ahk
#Include .\IEnumDot11AdHocSecuritySettings.ahk
#Include .\IEnumDot11AdHocNetworks.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a wireless network interface card (NIC).
 * @see https://docs.microsoft.com/windows/win32/api//adhoc/nn-adhoc-idot11adhocinterface
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class IDot11AdHocInterface extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDot11AdHocInterface
     * @type {Guid}
     */
    static IID => Guid("{8f10cc2b-cf0d-42a0-acbe-e2de7007384d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDeviceSignature", "GetFriendlyName", "IsDot11d", "IsAdHocCapable", "IsRadioOn", "GetActiveNetwork", "GetIEnumSecuritySettings", "GetIEnumDot11AdHocNetworks", "GetStatus"]

    /**
     * Gets the signature of the NIC.
     * @param {Pointer<Guid>} pSignature The signature of the NIC.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
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
     * The method could not allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer passed as a parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocinterface-getdevicesignature
     */
    GetDeviceSignature(pSignature) {
        result := ComCall(3, this, "ptr", pSignature, "HRESULT")
        return result
    }

    /**
     * Gets the friendly name of the NIC.
     * @returns {PWSTR} The friendly name of the NIC. The SSID of the network is used as the friendly name.
     * 
     * You must free this string using <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-cotaskmemfree">CoTaskMemFree</a>.
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocinterface-getfriendlyname
     */
    GetFriendlyName() {
        result := ComCall(4, this, "ptr*", &ppszName := 0, "HRESULT")
        return ppszName
    }

    /**
     * Specifies whether the NIC is 802.11d compliant.
     * @param {Pointer<Integer>} pf11d A pointer to a boolean that specifies 802.11d compliance. The boolean value is set to <b>TRUE</b> if  the NIC is compliant and <b>FALSE</b> otherwise.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
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
     * The method could not allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer passed as a parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocinterface-isdot11d
     */
    IsDot11d(pf11d) {
        pf11dMarshal := pf11d is VarRef ? "char*" : "ptr"

        result := ComCall(5, this, pf11dMarshal, pf11d, "HRESULT")
        return result
    }

    /**
     * Specifies whether a NIC supports the creation or use of an ad hoc network.
     * @param {Pointer<Integer>} pfAdHocCapable A pointer to a boolean that specifies the NIC's ad hoc network capabilities. The boolean value is set to  <b>TRUE</b> if the NIC supports the creation and use of ad hoc networks and <b>FALSE</b> otherwise.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
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
     * The method could not allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer passed as a parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocinterface-isadhoccapable
     */
    IsAdHocCapable(pfAdHocCapable) {
        pfAdHocCapableMarshal := pfAdHocCapable is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, pfAdHocCapableMarshal, pfAdHocCapable, "HRESULT")
        return result
    }

    /**
     * Specifies whether the radio is on.
     * @param {Pointer<Integer>} pfIsRadioOn A pointer to a boolean that specifies the radio state. The value is set to <b>TRUE</b> if the radio is on.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
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
     * The method could not allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer passed as a parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocinterface-isradioon
     */
    IsRadioOn(pfIsRadioOn) {
        pfIsRadioOnMarshal := pfIsRadioOn is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, pfIsRadioOnMarshal, pfIsRadioOn, "HRESULT")
        return result
    }

    /**
     * Gets the network that is currently active on the interface.
     * @returns {IDot11AdHocNetwork} A pointer to an IDot11AdHocNetwork object that represents the active network.
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocinterface-getactivenetwork
     */
    GetActiveNetwork() {
        result := ComCall(8, this, "ptr*", &ppNetwork := 0, "HRESULT")
        return IDot11AdHocNetwork(ppNetwork)
    }

    /**
     * Gets the collection of security settings associated with this NIC.
     * @returns {IEnumDot11AdHocSecuritySettings} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nn-adhoc-ienumdot11adhocsecuritysettings">IEnumDot11AdHocSecuritySettings</a> interface that contains the collection of security settings.
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocinterface-getienumsecuritysettings
     */
    GetIEnumSecuritySettings() {
        result := ComCall(9, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDot11AdHocSecuritySettings(ppEnum)
    }

    /**
     * Gets the collection of networks associated with this NIC.
     * @param {Pointer<Guid>} pFilterGuid An optional parameter that specifies the GUID of the application that created the network. An application can use this identifier to limit the networks enumerated to networks created by the application. For this filtering to work correctly, all instances of the application on all machines must use the same GUID.
     * @returns {IEnumDot11AdHocNetworks} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/adhoc/nn-adhoc-ienumdot11adhocnetworks">IEnumDot11AdHocNetworks</a> interface that contains the enumerated networks.
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocinterface-getienumdot11adhocnetworks
     */
    GetIEnumDot11AdHocNetworks(pFilterGuid) {
        result := ComCall(10, this, "ptr", pFilterGuid, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumDot11AdHocNetworks(ppEnum)
    }

    /**
     * Gets the connection status of the active network associated with this NIC.
     * @param {Pointer<Integer>} pState A pointer to a  <a href="https://docs.microsoft.com/windows/win32/api/adhoc/ne-adhoc-dot11_adhoc_network_connection_status">DOT11_ADHOC_NETWORK_CONNECTION_STATUS</a> value that specifies the connection state.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * One of the parameters is invalid.
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
     * The method could not allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A pointer passed as a parameter is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//adhoc/nf-adhoc-idot11adhocinterface-getstatus
     */
    GetStatus(pState) {
        pStateMarshal := pState is VarRef ? "int*" : "ptr"

        result := ComCall(11, this, pStateMarshal, pState, "HRESULT")
        return result
    }
}
