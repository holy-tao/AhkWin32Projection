#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ISensor.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a collection of sensors, such as all the sensors connected to a computer.
 * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nn-sensorsapi-isensorcollection
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class ISensorCollection extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAt", "GetCount", "Add", "Remove", "RemoveByID", "Clear"]

    /**
     * 
     * @param {Integer} ulIndex 
     * @returns {ISensor} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensorcollection-getat
     */
    GetAt(ulIndex) {
        result := ComCall(3, this, "uint", ulIndex, "ptr*", &ppSensor := 0, "HRESULT")
        return ISensor(ppSensor)
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensorcollection-getcount
     */
    GetCount() {
        result := ComCall(4, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * 
     * @param {ISensor} pSensor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensorcollection-add
     */
    Add(pSensor) {
        result := ComCall(5, this, "ptr", pSensor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ISensor} pSensor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensorcollection-remove
     */
    Remove(pSensor) {
        result := ComCall(6, this, "ptr", pSensor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} sensorID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensorcollection-removebyid
     */
    RemoveByID(sensorID) {
        result := ComCall(7, this, "ptr", sensorID, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/sensorsapi/nf-sensorsapi-isensorcollection-clear
     */
    Clear() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
