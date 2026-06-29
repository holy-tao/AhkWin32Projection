#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\ISensor.ahk" { ISensor }
#Import "..\PortableDevices\IPortableDeviceValues.ahk" { IPortableDeviceValues }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISensorDataReport.ahk" { ISensorDataReport }
#Import ".\SensorState.ahk" { SensorState }

/**
 * The callback interface you must implement if you want to receive sensor events.
 * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nn-sensorsapi-isensorevents
 * @namespace Windows.Win32.Devices.Sensors
 */
export default struct ISensorEvents extends IUnknown {
    /**
     * The interface identifier for ISensorEvents
     * @type {Guid}
     */
    static IID := Guid("{5d8dcc91-4641-47e7-b7c3-b74f48a6c391}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISensorEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnStateChanged : IntPtr
        OnDataUpdated  : IntPtr
        OnEvent        : IntPtr
        OnLeave        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISensorEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides a notification that a sensor state has changed.
     * @param {ISensor} pSensor Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensor">ISensor</a> interface of the sensor that raised the event.
     * @param {SensorState} state <a href="https://docs.microsoft.com/windows/win32/api/sensorsapi/ne-sensorsapi-sensorstate">SensorState</a> containing the new state.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensorevents-onstatechanged
     */
    OnStateChanged(pSensor, state) {
        result := ComCall(3, this, "ptr", pSensor, SensorState, state, "HRESULT")
        return result
    }

    /**
     * Provides sensor event data.
     * @param {ISensor} pSensor Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensor">ISensor</a> interface of the sensor that raised the event.
     * @param {ISensorDataReport} pNewData Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensordatareport">ISensorDataReport</a> interface that contains the event data.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensorevents-ondataupdated
     */
    OnDataUpdated(pSensor, pNewData) {
        result := ComCall(4, this, "ptr", pSensor, "ptr", pNewData, "HRESULT")
        return result
    }

    /**
     * Provides custom event notifications.
     * @remarks
     * This callback method receives custom event notifications. Custom events are defined by sensor providers. Platform-defined event IDs are defined in Sensors.h.
     * 
     * To receive new data from a sensor, use the <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nf-sensorsapi-isensorevents-ondataupdated">OnDataUpdated Method</a>.
     * @param {ISensor} pSensor Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensor">ISensor</a> interface that represents the sensor that raised the event.
     * @param {Pointer<Guid>} eventID <b>REFGUID</b> that identifies the event.
     * @param {IPortableDeviceValues} pEventData Pointer to the <a href="https://docs.microsoft.com/previous-versions//ms740012(v=vs.85)">IPortableDeviceValues</a> interface that contains the event data.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensorevents-onevent
     */
    OnEvent(pSensor, eventID, pEventData) {
        result := ComCall(5, this, "ptr", pSensor, Guid.Ptr, eventID, "ptr", pEventData, "HRESULT")
        return result
    }

    /**
     * Provides notification that a sensor device is no longer connected.
     * @remarks
     * To know when a sensor enters, subscribe to the <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nf-sensorsapi-isensormanagerevents-onsensorenter">ISensorManagerEvents::OnSensorEnter</a> event.
     * @param {Pointer<Guid>} ID The ID of the sensor.
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensorevents-onleave
     */
    OnLeave(ID) {
        result := ComCall(6, this, Guid.Ptr, ID, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISensorEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnStateChanged := CallbackCreate(GetMethod(implObj, "OnStateChanged"), flags, 3)
        this.vtbl.OnDataUpdated := CallbackCreate(GetMethod(implObj, "OnDataUpdated"), flags, 3)
        this.vtbl.OnEvent := CallbackCreate(GetMethod(implObj, "OnEvent"), flags, 4)
        this.vtbl.OnLeave := CallbackCreate(GetMethod(implObj, "OnLeave"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnStateChanged)
        CallbackFree(this.vtbl.OnDataUpdated)
        CallbackFree(this.vtbl.OnEvent)
        CallbackFree(this.vtbl.OnLeave)
    }
}
