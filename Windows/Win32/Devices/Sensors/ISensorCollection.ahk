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
     * Retrieves the sensor at the specified index in the collection.
     * @param {Integer} ulIndex <b>ULONG</b> containing the index of the sensor to retrieve.
     * @returns {ISensor} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensor">ISensor</a> pointer that receives the pointer to the specified sensor.
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensorcollection-getat
     */
    GetAt(ulIndex) {
        result := ComCall(3, this, "uint", ulIndex, "ptr*", &ppSensor := 0, "HRESULT")
        return ISensor(ppSensor)
    }

    /**
     * Retrieves the count of sensors in the collection.
     * @returns {Integer} Address of a <b>ULONG</b> that receives the count.
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensorcollection-getcount
     */
    GetCount() {
        result := ComCall(4, this, "uint*", &pCount := 0, "HRESULT")
        return pCount
    }

    /**
     * Adds a sensor to the collection.
     * @param {ISensor} pSensor Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensor">ISensor</a> interface for the sensor to add to the collection.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>HRESULT_FROM_WIN32(ERROR_ALREADY_EXISTS)
     * </b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The sensor collection already contains a sensor with the specified ID.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensorcollection-add
     */
    Add(pSensor) {
        result := ComCall(5, this, "ptr", pSensor, "HRESULT")
        return result
    }

    /**
     * Removes a sensor from the collection. The sensor is specified by a pointer to the ISensor interface to be removed.
     * @param {ISensor} pSensor Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensor">ISensor</a> interface to remove from the collection.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified sensor is not part of the collection.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensorcollection-remove
     */
    Remove(pSensor) {
        result := ComCall(6, this, "ptr", pSensor, "HRESULT")
        return result
    }

    /**
     * Removes a sensor from the collection. The sensor to be removed is specified by its ID.
     * @param {Pointer<Guid>} sensorID The <b>GUID</b> of the sensor to remove from the collection.
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
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified sensor is not part of the collection.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensorcollection-removebyid
     */
    RemoveByID(sensorID) {
        result := ComCall(7, this, "ptr", sensorID, "HRESULT")
        return result
    }

    /**
     * Empties the sensor collection.
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
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensorcollection-clear
     */
    Clear() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
