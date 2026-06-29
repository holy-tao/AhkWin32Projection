#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\SensorState.ahk" { SensorState }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\ISensor.ahk" { ISensor }

/**
 * The callback interface for receiving sensor manager events.
 * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nn-sensorsapi-isensormanagerevents
 * @namespace Windows.Win32.Devices.Sensors
 */
export default struct ISensorManagerEvents extends IUnknown {
    /**
     * The interface identifier for ISensorManagerEvents
     * @type {Guid}
     */
    static IID := Guid("{9b3b0b86-266a-4aad-b21f-fde5501001b7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISensorManagerEvents interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnSensorEnter : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISensorManagerEvents.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Provides notification when a sensor device is connected.
     * @remarks
     * To know when a sensor is disconnected, subscribe to the <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nf-sensorsapi-isensorevents-onleave">ISensorEvents::OnLeave</a> event.
     * @param {ISensor} pSensor A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensor">ISensor</a> interface of the sensor that was connected.
     * @param {SensorState} state <a href="https://docs.microsoft.com/windows/win32/api/sensorsapi/ne-sensorsapi-sensorstate">SensorState</a> indicating the current state of the sensor.
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
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensormanagerevents-onsensorenter
     */
    OnSensorEnter(pSensor, state) {
        result := ComCall(3, this, "ptr", pSensor, SensorState, state, "HRESULT")
        return result
    }

    Query(iid) {
        if (ISensorManagerEvents.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnSensorEnter := CallbackCreate(GetMethod(implObj, "OnSensorEnter"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnSensorEnter)
    }
}
