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
     * 
     * @param {Pointer<Guid>} sensorCategory 
     * @param {Pointer<ISensorCollection>} ppSensorsFound 
     * @returns {HRESULT} 
     */
    GetSensorsByCategory(sensorCategory, ppSensorsFound) {
        result := ComCall(3, this, "ptr", sensorCategory, "ptr", ppSensorsFound, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} sensorType 
     * @param {Pointer<ISensorCollection>} ppSensorsFound 
     * @returns {HRESULT} 
     */
    GetSensorsByType(sensorType, ppSensorsFound) {
        result := ComCall(4, this, "ptr", sensorType, "ptr", ppSensorsFound, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} sensorID 
     * @param {Pointer<ISensor>} ppSensor 
     * @returns {HRESULT} 
     */
    GetSensorByID(sensorID, ppSensor) {
        result := ComCall(5, this, "ptr", sensorID, "ptr", ppSensor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISensorManagerEvents>} pEvents 
     * @returns {HRESULT} 
     */
    SetEventSink(pEvents) {
        result := ComCall(6, this, "ptr", pEvents, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {HWND} hParent 
     * @param {Pointer<ISensorCollection>} pSensors 
     * @param {BOOL} fModal 
     * @returns {HRESULT} 
     */
    RequestPermissions(hParent, pSensors, fModal) {
        hParent := hParent is Win32Handle ? NumGet(hParent, "ptr") : hParent

        result := ComCall(7, this, "ptr", hParent, "ptr", pSensors, "int", fModal, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
