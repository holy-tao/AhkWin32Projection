#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\Com\IDispatch.ahk

/**
 * The ISensNetwork interface handles network events fired by the System Event Notification Service (SENS).
 * @see https://docs.microsoft.com/windows/win32/api//sensevts/nn-sensevts-isensnetwork
 * @namespace Windows.Win32.System.EventNotificationService
 * @version v4.0.30319
 */
class ISensNetwork extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISensNetwork
     * @type {Guid}
     */
    static IID => Guid("{d597bab1-5b9f-11d1-8dd2-00aa004abd5e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConnectionMade", "ConnectionMadeNoQOCInfo", "ConnectionLost", "DestinationReachable", "DestinationReachableNoQOCInfo"]

    /**
     * The ConnectionMade method notifies your application that the specified connection has been established.
     * @param {BSTR} bstrConnection For WAN connections, the information passed is the connection name. For WAN connections, the connection name is the name of the phone book entry. For LAN connections, the information passed is "LAN connection".
     * @param {Integer} ulType Connection type. This value can be CONNECTION_LAN (0) or CONNECTION_WAN (1).
     * @param {Pointer<SENS_QOCINFO>} lpQOCInfo Pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/sensevts/ns-sensevts-sens_qocinfo">SENS_QOCINFO</a> structure which contains Quality of Connection information.
     * @returns {HRESULT} This method can return one of these values.
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
     * Method returned successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sensevts/nf-sensevts-isensnetwork-connectionmade
     */
    ConnectionMade(bstrConnection, ulType, lpQOCInfo) {
        bstrConnection := bstrConnection is String ? BSTR.Alloc(bstrConnection).Value : bstrConnection

        result := ComCall(7, this, "ptr", bstrConnection, "uint", ulType, "ptr", lpQOCInfo, "HRESULT")
        return result
    }

    /**
     * The ConnectionMadeNoQOCInfo method notifies your application that the specified connection has been established with no Quality of Connection information available.
     * @param {BSTR} bstrConnection For WAN connections, the information passed is the connection name. For WAN connections, the connection name is the name of the phone book entry. For LAN connections, the information passed is "LAN connection".
     * @param {Integer} ulType Connection type. This value can be CONNECTION_LAN (0) or CONNECTION_WAN (1).
     * @returns {HRESULT} This method can return one of these values.
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
     * Method returned successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sensevts/nf-sensevts-isensnetwork-connectionmadenoqocinfo
     */
    ConnectionMadeNoQOCInfo(bstrConnection, ulType) {
        bstrConnection := bstrConnection is String ? BSTR.Alloc(bstrConnection).Value : bstrConnection

        result := ComCall(8, this, "ptr", bstrConnection, "uint", ulType, "HRESULT")
        return result
    }

    /**
     * The ConnectionLost method notifies your application that the specified connection has been dropped.
     * @param {BSTR} bstrConnection For WAN connections, the information passed is the connection name. For WAN connections, the connection name is the name of the phone book entry. For LAN connections, the information passed is "LAN connection".
     * @param {Integer} ulType 
     * @returns {HRESULT} This method can return one of these values.
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
     * Method returned successfully.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sensevts/nf-sensevts-isensnetwork-connectionlost
     */
    ConnectionLost(bstrConnection, ulType) {
        bstrConnection := bstrConnection is String ? BSTR.Alloc(bstrConnection).Value : bstrConnection

        result := ComCall(9, this, "ptr", bstrConnection, "uint", ulType, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDestination 
     * @param {BSTR} bstrConnection 
     * @param {Integer} ulType 
     * @param {Pointer<SENS_QOCINFO>} lpQOCInfo 
     * @returns {HRESULT} 
     */
    DestinationReachable(bstrDestination, bstrConnection, ulType, lpQOCInfo) {
        bstrDestination := bstrDestination is String ? BSTR.Alloc(bstrDestination).Value : bstrDestination
        bstrConnection := bstrConnection is String ? BSTR.Alloc(bstrConnection).Value : bstrConnection

        result := ComCall(10, this, "ptr", bstrDestination, "ptr", bstrConnection, "uint", ulType, "ptr", lpQOCInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} bstrDestination 
     * @param {BSTR} bstrConnection 
     * @param {Integer} ulType 
     * @returns {HRESULT} 
     */
    DestinationReachableNoQOCInfo(bstrDestination, bstrConnection, ulType) {
        bstrDestination := bstrDestination is String ? BSTR.Alloc(bstrDestination).Value : bstrDestination
        bstrConnection := bstrConnection is String ? BSTR.Alloc(bstrConnection).Value : bstrConnection

        result := ComCall(11, this, "ptr", bstrDestination, "ptr", bstrConnection, "uint", ulType, "HRESULT")
        return result
    }
}
