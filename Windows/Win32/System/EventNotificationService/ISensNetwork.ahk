#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SENS_QOCINFO.ahk" { SENS_QOCINFO }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\Com\IDispatch.ahk" { IDispatch }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\SENS_CONNECTION_TYPE.ahk" { SENS_CONNECTION_TYPE }

/**
 * The ISensNetwork interface handles network events fired by the System Event Notification Service (SENS).
 * @see https://learn.microsoft.com/windows/win32/api/sensevts/nn-sensevts-isensnetwork
 * @namespace Windows.Win32.System.EventNotificationService
 */
export default struct ISensNetwork extends IDispatch {
    /**
     * The interface identifier for ISensNetwork
     * @type {Guid}
     */
    static IID := Guid("{d597bab1-5b9f-11d1-8dd2-00aa004abd5e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISensNetwork interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        ConnectionMade                : IntPtr
        ConnectionMadeNoQOCInfo       : IntPtr
        ConnectionLost                : IntPtr
        DestinationReachable          : IntPtr
        DestinationReachableNoQOCInfo : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISensNetwork.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The ConnectionMade method notifies your application that the specified connection has been established.
     * @remarks
     * SENS calls this method to notify your application that the specified connection has been established. SENS also provides a pointer to a structure containing Quality of Connection information.
     * 
     * Filtering can be performed on the publisher property <i>ulConnectionMadeType</i> by setting it to either CONNECTION_LAN or CONNECTION_WAN or both. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsubscription-putpublisherproperty">IEventSubscription::PutPublisherProperty</a> to set the publisher property.
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
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isensnetwork-connectionmade
     */
    ConnectionMade(bstrConnection, ulType, lpQOCInfo) {
        bstrConnection := bstrConnection is String ? BSTR.Alloc(bstrConnection).Value : bstrConnection

        result := ComCall(7, this, BSTR, bstrConnection, "uint", ulType, SENS_QOCINFO.Ptr, lpQOCInfo, "HRESULT")
        return result
    }

    /**
     * The ConnectionMadeNoQOCInfo method notifies your application that the specified connection has been established with no Quality of Connection information available.
     * @remarks
     * SENS calls this method to notify your application that the specified connection has been established when Quality of Connection information is not available.
     * 
     * Filtering can be performed on the publisher property <i>ulConnectionMadeTypeNoQOC</i> by setting it to either CONNECTION_LAN or CONNECTION_WAN or both. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsubscription-putpublisherproperty">IEventSubscription::PutPublisherProperty</a> to set the publisher property.
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
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isensnetwork-connectionmadenoqocinfo
     */
    ConnectionMadeNoQOCInfo(bstrConnection, ulType) {
        bstrConnection := bstrConnection is String ? BSTR.Alloc(bstrConnection).Value : bstrConnection

        result := ComCall(8, this, BSTR, bstrConnection, "uint", ulType, "HRESULT")
        return result
    }

    /**
     * The ConnectionLost method notifies your application that the specified connection has been dropped.
     * @remarks
     * SENS calls this method to notify your application that the specified connection has been dropped.
     * 			
     * 
     * Filtering can be performed on the publisher property <i>ulConnectionLostType</i> by setting it to either CONNECTION_LAN or CONNECTION_WAN or both. Use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/eventsys/nf-eventsys-ieventsubscription-putpublisherproperty">IEventSubscription::PutPublisherProperty</a> to set the publisher property.
     * @param {BSTR} bstrConnection For WAN connections, the information passed is the connection name. For WAN connections, the connection name is the name of the phone book entry. For LAN connections, the information passed is "LAN connection".
     * @param {SENS_CONNECTION_TYPE} ulType 
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
     * @see https://learn.microsoft.com/windows/win32/api/sensevts/nf-sensevts-isensnetwork-connectionlost
     */
    ConnectionLost(bstrConnection, ulType) {
        bstrConnection := bstrConnection is String ? BSTR.Alloc(bstrConnection).Value : bstrConnection

        result := ComCall(9, this, BSTR, bstrConnection, SENS_CONNECTION_TYPE, ulType, "HRESULT")
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

        result := ComCall(10, this, BSTR, bstrDestination, BSTR, bstrConnection, "uint", ulType, SENS_QOCINFO.Ptr, lpQOCInfo, "HRESULT")
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

        result := ComCall(11, this, BSTR, bstrDestination, BSTR, bstrConnection, "uint", ulType, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISensNetwork.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ConnectionMade := CallbackCreate(GetMethod(implObj, "ConnectionMade"), flags, 4)
        this.vtbl.ConnectionMadeNoQOCInfo := CallbackCreate(GetMethod(implObj, "ConnectionMadeNoQOCInfo"), flags, 3)
        this.vtbl.ConnectionLost := CallbackCreate(GetMethod(implObj, "ConnectionLost"), flags, 3)
        this.vtbl.DestinationReachable := CallbackCreate(GetMethod(implObj, "DestinationReachable"), flags, 5)
        this.vtbl.DestinationReachableNoQOCInfo := CallbackCreate(GetMethod(implObj, "DestinationReachableNoQOCInfo"), flags, 4)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ConnectionMade)
        CallbackFree(this.vtbl.ConnectionMadeNoQOCInfo)
        CallbackFree(this.vtbl.ConnectionLost)
        CallbackFree(this.vtbl.DestinationReachable)
        CallbackFree(this.vtbl.DestinationReachableNoQOCInfo)
    }
}
