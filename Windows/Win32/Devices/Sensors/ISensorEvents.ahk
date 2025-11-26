#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The callback interface you must implement if you want to receive sensor events.
 * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nn-sensorsapi-isensorevents
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class ISensorEvents extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISensorEvents
     * @type {Guid}
     */
    static IID => Guid("{5d8dcc91-4641-47e7-b7c3-b74f48a6c391}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStateChanged", "OnDataUpdated", "OnEvent", "OnLeave"]

    /**
     * Provides a notification that a sensor state has changed.
     * @param {ISensor} pSensor Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensor">ISensor</a> interface of the sensor that raised the event.
     * @param {Integer} state <a href="https://docs.microsoft.com/windows/win32/api/sensorsapi/ne-sensorsapi-sensorstate">SensorState</a> containing the new state.
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
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensorevents-onstatechanged
     */
    OnStateChanged(pSensor, state) {
        result := ComCall(3, this, "ptr", pSensor, "int", state, "HRESULT")
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
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensorevents-ondataupdated
     */
    OnDataUpdated(pSensor, pNewData) {
        result := ComCall(4, this, "ptr", pSensor, "ptr", pNewData, "HRESULT")
        return result
    }

    /**
     * Provides custom event notifications.
     * @param {ISensor} pSensor Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensor">ISensor</a> interface that represents the sensor that raised the event.
     * @param {Pointer<Guid>} eventID <b>REFGUID</b> that identifies the event.
     * @param {IPortableDeviceValues} pEventData Pointer to the <a href="https://docs.microsoft.com/previous-versions//ms740012(v=vs.85)">IPortableDeviceValues</a> interface that contains the event data.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensorevents-onevent
     */
    OnEvent(pSensor, eventID, pEventData) {
        result := ComCall(5, this, "ptr", pSensor, "ptr", eventID, "ptr", pEventData, "HRESULT")
        return result
    }

    /**
     * Provides notification that a sensor device is no longer connected.
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
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensorevents-onleave
     */
    OnLeave(ID) {
        result := ComCall(6, this, "ptr", ID, "HRESULT")
        return result
    }
}
