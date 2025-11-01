#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * 
     * @param {Pointer<Guid>} sensorCategory 
     * @param {Pointer<ISensorCollection>} ppSensorsFound 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensormanager-getsensorsbycategory
     */
    GetSensorsByCategory(sensorCategory, ppSensorsFound) {
        result := ComCall(3, this, "ptr", sensorCategory, "ptr*", ppSensorsFound, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} sensorType 
     * @param {Pointer<ISensorCollection>} ppSensorsFound 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensormanager-getsensorsbytype
     */
    GetSensorsByType(sensorType, ppSensorsFound) {
        result := ComCall(4, this, "ptr", sensorType, "ptr*", ppSensorsFound, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} sensorID 
     * @param {Pointer<ISensor>} ppSensor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensormanager-getsensorbyid
     */
    GetSensorByID(sensorID, ppSensor) {
        result := ComCall(5, this, "ptr", sensorID, "ptr*", ppSensor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISensorManagerEvents} pEvents 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensormanager-seteventsink
     */
    SetEventSink(pEvents) {
        result := ComCall(6, this, "ptr", pEvents, "HRESULT")
        return result
    }

    /**
     * 
     * @param {HWND} hParent 
     * @param {ISensorCollection} pSensors 
     * @param {BOOL} fModal 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensormanager-requestpermissions
     */
    RequestPermissions(hParent, pSensors, fModal) {
        hParent := hParent is Win32Handle ? NumGet(hParent, "ptr") : hParent

        result := ComCall(7, this, "ptr", hParent, "ptr", pSensors, "int", fModal, "HRESULT")
        return result
    }
}
