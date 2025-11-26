#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\PortableDevices\IPortableDeviceValues.ahk
#Include ..\PortableDevices\IPortableDeviceKeyCollection.ahk
#Include .\ISensorDataReport.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a sensor.
 * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nn-sensorsapi-isensor
 * @namespace Windows.Win32.Devices.Sensors
 * @version v4.0.30319
 */
class ISensor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISensor
     * @type {Guid}
     */
    static IID => Guid("{5fa08f80-2657-458e-af75-46f73fa6ac5c}")

    /**
     * The class identifier for Sensor
     * @type {Guid}
     */
    static CLSID => Guid("{e97ced00-523a-4133-bf6f-d3a2dae7f6ba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetID", "GetCategory", "GetType", "GetFriendlyName", "GetProperty", "GetProperties", "GetSupportedDataFields", "SetProperties", "SupportsDataField", "GetState", "GetData", "SupportsEvent", "GetEventInterest", "SetEventInterest", "SetEventSink"]

    /**
     * Retrieves the unique identifier of the sensor.
     * @returns {Guid} Address of a <b>SENSOR_ID</b> that receives the ID.
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensor-getid
     */
    GetID() {
        pID := Guid()
        result := ComCall(3, this, "ptr", pID, "HRESULT")
        return pID
    }

    /**
     * Retrieves the identifier of the sensor category.
     * @returns {Guid} Address of a <b>SENSOR_CATEGORY_ID</b> that receives the sensor category ID.
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensor-getcategory
     */
    GetCategory() {
        pSensorCategory := Guid()
        result := ComCall(4, this, "ptr", pSensorCategory, "HRESULT")
        return pSensorCategory
    }

    /**
     * Retrieves the sensor type ID.
     * @returns {Guid} Address of a <b>SENSOR_TYPE_ID</b> that receives the sensor type ID.
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensor-gettype
     */
    GetType() {
        pSensorType := Guid()
        result := ComCall(5, this, "ptr", pSensorType, "HRESULT")
        return pSensorType
    }

    /**
     * Retrieves the sensor name that is intended to be seen by the user.
     * @returns {BSTR} Address of a <b>BSTR</b> that receives the friendly name.
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensor-getfriendlyname
     */
    GetFriendlyName() {
        pFriendlyName := BSTR()
        result := ComCall(6, this, "ptr", pFriendlyName, "HRESULT")
        return pFriendlyName
    }

    /**
     * Retrieves a property value.
     * @param {Pointer<PROPERTYKEY>} key <b>REFPROPERTYKEY</b> specifying the property value to be retrieved.
     * @returns {PROPVARIANT} <b>PROPVARIANT</b> pointer that receives the property value.
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensor-getproperty
     */
    GetProperty(key) {
        pProperty := PROPVARIANT()
        result := ComCall(7, this, "ptr", key, "ptr", pProperty, "HRESULT")
        return pProperty
    }

    /**
     * Retrieves multiple sensor properties.
     * @param {IPortableDeviceKeyCollection} pKeys Pointer to an <a href="https://docs.microsoft.com/previous-versions//ms739549(v=vs.85)">IPortableDeviceKeyCollection</a> interface containing the <b>PROPERTYKEY</b> collection for the property values being requested. Set to <b>NULL</b> to retrieve all supported properties.
     * @returns {IPortableDeviceValues} Address of an <a href="https://docs.microsoft.com/previous-versions//ms740012(v=vs.85)">IPortableDeviceValues</a> pointer that receives the pointer to the requested property values.
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensor-getproperties
     */
    GetProperties(pKeys) {
        result := ComCall(8, this, "ptr", pKeys, "ptr*", &ppProperties := 0, "HRESULT")
        return IPortableDeviceValues(ppProperties)
    }

    /**
     * Retrieves a set of PROPERTYKEYs that represent the data fields the sensor can provide.
     * @returns {IPortableDeviceKeyCollection} Address of the <a href="https://docs.microsoft.com/previous-versions//ms739549(v=vs.85)">IPortableDeviceKeyCollection</a>  pointer that receives the list of supported data fields.
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensor-getsupporteddatafields
     */
    GetSupportedDataFields() {
        result := ComCall(9, this, "ptr*", &ppDataFields := 0, "HRESULT")
        return IPortableDeviceKeyCollection(ppDataFields)
    }

    /**
     * Specifies sensor properties.
     * @param {IPortableDeviceValues} pProperties Pointer to an <a href="https://docs.microsoft.com/previous-versions//ms740012(v=vs.85)">IPortableDeviceValues</a> interface containing the list of properties and values to set.
     * @returns {IPortableDeviceValues} Address of an <b>IPortableDeviceValues</b> interface that receives the list of properties that were successfully set. Each property has an associated <b>HRESULT</b> value, which indicates whether setting the property succeeded.
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensor-setproperties
     */
    SetProperties(pProperties) {
        result := ComCall(10, this, "ptr", pProperties, "ptr*", &ppResults := 0, "HRESULT")
        return IPortableDeviceValues(ppResults)
    }

    /**
     * Indicates whether the sensor supports the specified data field.
     * @param {Pointer<PROPERTYKEY>} key <b>REFPROPERTYKEY</b> value specifying the data field to search for.
     * @returns {VARIANT_BOOL} Address of a <b>VARIANT_BOOL</b> that receives a value indicating whether the sensor supports the data field.
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensor-supportsdatafield
     */
    SupportsDataField(key) {
        result := ComCall(11, this, "ptr", key, "short*", &pIsSupported := 0, "HRESULT")
        return pIsSupported
    }

    /**
     * Retrieves the current operational state of the sensor.
     * @returns {Integer} Address of a <a href="https://docs.microsoft.com/windows/win32/api/sensorsapi/ne-sensorsapi-sensorstate">SensorState</a> variable that receives the current state.
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensor-getstate
     */
    GetState() {
        result := ComCall(12, this, "int*", &pState := 0, "HRESULT")
        return pState
    }

    /**
     * Retrieves the most recent sensor data report.
     * @returns {ISensorDataReport} Address of an <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensordatareport">ISensorDataReport</a> pointer that receives the pointer to the most recent sensor data report.
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensor-getdata
     */
    GetData() {
        result := ComCall(13, this, "ptr*", &ppDataReport := 0, "HRESULT")
        return ISensorDataReport(ppDataReport)
    }

    /**
     * Indicates whether the sensor supports the specified event.
     * @param {Pointer<Guid>} eventGuid <b>REFGUID</b> value specifying the event to search for.
     * @returns {VARIANT_BOOL} Address of a <b>VARIANT_BOOL</b> that receives a value indicating whether the sensor supports the event.
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensor-supportsevent
     */
    SupportsEvent(eventGuid) {
        result := ComCall(14, this, "ptr", eventGuid, "short*", &pIsSupported := 0, "HRESULT")
        return pIsSupported
    }

    /**
     * Retrieves the current event interest settings.
     * @param {Pointer<Pointer<Guid>>} ppValues Address of a <b>GUID</b> pointer that points to an array of sensor event identifiers.
     * @param {Pointer<Integer>} pCount The count of <b>GUID</b>s in the array pointed to by <i>ppValues</i>.
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
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NULL was passed in for ppValues or pCount.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensor-geteventinterest
     */
    GetEventInterest(ppValues, pCount) {
        ppValuesMarshal := ppValues is VarRef ? "ptr*" : "ptr"
        pCountMarshal := pCount is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, ppValuesMarshal, ppValues, pCountMarshal, pCount, "HRESULT")
        return result
    }

    /**
     * Specifies the list of sensor events to receive.
     * @param {Pointer<Guid>} pValues Pointer to an array of <b>GUID</b>s. Each <b>GUID</b> represents an event to receive. Set to <b>NULL</b> to receive all data-updated events and all custom events.
     * @param {Integer} count The count of <b>GUID</b>s in the array pointed to by <i>pValues</i>. Set to zero when <i>pValues</i> is <b>NULL</b>.
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
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensor-seteventinterest
     */
    SetEventInterest(pValues, count) {
        result := ComCall(16, this, "ptr", pValues, "uint", count, "HRESULT")
        return result
    }

    /**
     * Specifies the interface through which to receive sensor event notifications.
     * @param {ISensorEvents} pEvents Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/sensorsapi/nn-sensorsapi-isensorevents">ISensorEvents</a> callback interface that receives the event notifications. Set to <b>NULL</b> to cancel event notifications.
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
     * @see https://docs.microsoft.com/windows/win32/api//sensorsapi/nf-sensorsapi-isensor-seteventsink
     */
    SetEventSink(pEvents) {
        result := ComCall(17, this, "ptr", pEvents, "HRESULT")
        return result
    }
}
