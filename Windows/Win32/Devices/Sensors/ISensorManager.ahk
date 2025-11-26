#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISensorCollection.ahk
#Include .\ISensor.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides methods for discovering and retrieving available sensors and a method to request sensor manager events.
 * @remarks
 * 
 * You retrieve a pointer to this interface by calling the COM <b>CoCreateInstance</b> method. If group policy does not allow creation of this object, <b>CoCreateInstance</b> will return <b>HRESULT_FROM_WIN32
 * (ERROR_ACCESS_DISABLED_BY_POLICY)</b>.
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nn-sensorsapi-isensormanager
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class ISensorManager extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISensorManager
     * @type {Guid}
     */
    static IID => Guid("{bd77db67-45a8-42dc-8d00-6dcf15f8377a}")

    /**
     * The class identifier for SensorManager
     * @type {Guid}
     */
    static CLSID => Guid("{77a1c827-fcd2-4689-8915-9d613cc5fa3e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSensorsByCategory", "GetSensorsByType", "GetSensorByID", "SetEventSink", "RequestPermissions"]

    /**
     * Retrieves a collection containing all sensors associated with the specified category.
     * @param {Pointer<Guid>} sensorCategory ID of the sensor category to retrieve.
     * @returns {ISensorCollection} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensorcollection">ISensorCollection</a> interface pointer that receives a pointer to the sensor collection requested.
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensormanager-getsensorsbycategory
     */
    GetSensorsByCategory(sensorCategory) {
        result := ComCall(3, this, "ptr", sensorCategory, "ptr*", &ppSensorsFound := 0, "HRESULT")
        return ISensorCollection(ppSensorsFound)
    }

    /**
     * Retrieves a collection containing all sensors associated with the specified type.
     * @param {Pointer<Guid>} sensorType ID of the type of sensors to retrieve.
     * @returns {ISensorCollection} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensorcollection">ISensorCollection</a> interface pointer that receives the pointer to the sensor collection requested.
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensormanager-getsensorsbytype
     */
    GetSensorsByType(sensorType) {
        result := ComCall(4, this, "ptr", sensorType, "ptr*", &ppSensorsFound := 0, "HRESULT")
        return ISensorCollection(ppSensorsFound)
    }

    /**
     * Retrieves a pointer to the specified sensor.
     * @param {Pointer<Guid>} sensorID The ID of the sensor to retrieve.
     * @returns {ISensor} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensor">ISensor</a> interface pointer that receives a pointer to the requested sensor. Will be <b>NULL</b> if the requested sensor cannot be found.
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensormanager-getsensorbyid
     */
    GetSensorByID(sensorID) {
        result := ComCall(5, this, "ptr", sensorID, "ptr*", &ppSensor := 0, "HRESULT")
        return ISensor(ppSensor)
    }

    /**
     * Specifies the interface through which to receive sensor manager event notifications.
     * @param {ISensorManagerEvents} pEvents Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensormanagerevents">ISensorManagerEvents</a> callback interface that receives the event notifications. Set to <b>NULL</b> to stop receiving event notifications.
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
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensormanager-seteventsink
     */
    SetEventSink(pEvents) {
        result := ComCall(6, this, "ptr", pEvents, "HRESULT")
        return result
    }

    /**
     * Opens a system dialog box to request user permission to access sensor data.
     * @param {HWND} hParent For Windows 8, if <i>hParent</i> is provided a value, then the dialog will be modal to the parent window. If <i>hParent</i> is <b>NULL</b>, then the dialog will not be modal.  The dialog is always synchronous.
     * 
     * For Windows 7, <b>HWND</b> is handle to a window that can act as a parent to the permissions dialog box. Must be <b>NULL</b> if <i>fModal</i> is <b>TRUE</b>.
     * @param {ISensorCollection} pSensors For Windows 8, this value is not used.
     * 
     * For Windows 7, <i>pSensors</i> is a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensorcollection">ISensorCollection</a> interface that contains the list of sensors for which permission is being requested.
     * @param {BOOL} fModal For Windows 8, this value is not used. Refer to <i>hParent</i> for control of modality.
     * 
     * For Windows 7, <i>fModal</i> is a <b>BOOL</b> that specifies the dialog box mode. Must be <b>FALSE</b> if <i>hParent</i> is non-null.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="TRUE"></a><a id="true"></a><dl>
     * <dt><b>TRUE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If <i>hParent</i> is <b>NULL</b>, the dialog box is modal and therefore has exclusive focus in Windows until the user responds. The call is synchronous. The return code indicates the user choice. See Return Value. 
     * 
     * If <i>hParent</i> is non-null, the call is asynchronous and the calling thread will not wait for the dialog box to be closed. The return code indicates whether the call succeeded. See Return Value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FALSE"></a><a id="false"></a><dl>
     * <dt><b>FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The dialog box is modeless. The call is asynchronous and the calling thread will not wait for the dialog box to be closed. The return code indicates whether the call succeeded. See Return Value.
     * 
     * The <i>hParent</i> parameter is ignored.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {HRESULT} The following table describes return codes for  synchronous results.
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
     * The user enabled the sensors.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ACCESS_DENIED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user chose to disable the sensors. 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_CANCELLED) </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user canceled the dialog box or refused elevation of permission to show the dialog box.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * The following table describes return codes for  asynchronous results.
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
     * All of the sensors in the sensor collection were displayed for the user to enable. The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Some of the sensors in the sensor collection were displayed for the user to enable. Some sensors may have been removed from the collection; for example, because the user had previously chosen to keep them disabled. The method succeeded.
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
     * An argument is  not valid.
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
     * A pointer is null.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ACCESS_DENIED)</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * All sensors in the sensor collection were previously disabled by the user. The dialog box was not shown.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensormanager-requestpermissions
     */
    RequestPermissions(hParent, pSensors, fModal) {
        hParent := hParent is Win32Handle ? NumGet(hParent, "ptr") : hParent

        result := ComCall(7, this, "ptr", hParent, "ptr", pSensors, "int", fModal, "HRESULT")
        return result
    }
}
