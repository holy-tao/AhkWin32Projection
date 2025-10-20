#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a collection of sensors, such as all the sensors connected to a computer.
 * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nn-sensorsapi-isensorcollection
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class ISensorCollection extends IUnknown{
    /**
     * The interface identifier for ISensorCollection
     * @type {Guid}
     */
    static IID => Guid("{23571e11-e545-4dd8-a337-b89bf44b10df}")

    /**
     * The class identifier for SensorCollection
     * @type {Guid}
     */
    static CLSID => Guid("{79c43adb-a429-469f-aa39-2f2b74b75937}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} ulIndex 
     * @param {Pointer<ISensor>} ppSensor 
     * @returns {HRESULT} 
     */
    GetAt(ulIndex, ppSensor) {
        result := ComCall(3, this, "uint", ulIndex, "ptr", ppSensor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCount 
     * @returns {HRESULT} 
     */
    GetCount(pCount) {
        result := ComCall(4, this, "uint*", pCount, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISensor>} pSensor 
     * @returns {HRESULT} 
     */
    Add(pSensor) {
        result := ComCall(5, this, "ptr", pSensor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ISensor>} pSensor 
     * @returns {HRESULT} 
     */
    Remove(pSensor) {
        result := ComCall(6, this, "ptr", pSensor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} sensorID 
     * @returns {HRESULT} 
     */
    RemoveByID(sensorID) {
        result := ComCall(7, this, "ptr", sensorID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Clear() {
        result := ComCall(8, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
