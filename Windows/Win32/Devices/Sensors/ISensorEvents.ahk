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
     * 
     * @param {Pointer<ISensor>} pSensor 
     * @param {Integer} state 
     * @returns {HRESULT} 
     */
    OnStateChanged(pSensor, state) {
        result := ComCall(3, this, "ptr", pSensor, "int", state, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISensor>} pSensor 
     * @param {Pointer<ISensorDataReport>} pNewData 
     * @returns {HRESULT} 
     */
    OnDataUpdated(pSensor, pNewData) {
        result := ComCall(4, this, "ptr", pSensor, "ptr", pNewData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISensor>} pSensor 
     * @param {Pointer<Guid>} eventID 
     * @param {Pointer<IPortableDeviceValues>} pEventData 
     * @returns {HRESULT} 
     */
    OnEvent(pSensor, eventID, pEventData) {
        result := ComCall(5, this, "ptr", pSensor, "ptr", eventID, "ptr", pEventData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} ID 
     * @returns {HRESULT} 
     */
    OnLeave(ID) {
        result := ComCall(6, this, "ptr", ID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
