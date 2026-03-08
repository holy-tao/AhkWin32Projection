#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk
#Include ..\..\System\Com\StructuredStorage\PROPVARIANT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The parent interface for location reports.
 * @see https://learn.microsoft.com/windows/win32/api/locationapi/nn-locationapi-ilocationreport
 * @namespace Windows.Win32.Devices.Geolocation
 * @version v4.0.30319
 */
class ILocationReport extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILocationReport
     * @type {Guid}
     */
    static IID => Guid("{c8b7f7ee-75d0-4db9-b62d-7a0f369ca456}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSensorID", "GetTimestamp", "GetValue"]

    /**
     * Retrieves the ID of the sensor that generated the location report.
     * @remarks
     * A sensor ID is a <b>GUID</b>.
     * @returns {Guid} Address of a <b>SENSOR_ID</b> that receives the ID of the sensor that generated the location report.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocationreport-getsensorid
     */
    GetSensorID() {
        pSensorID := Guid()
        result := ComCall(3, this, "ptr", pSensorID, "HRESULT")
        return pSensorID
    }

    /**
     * Retrieves the date and time when the report was generated.
     * @returns {SYSTEMTIME} Address of a <b>SYSTEMTIME</b> that receives the date and time when the report was generated. Time stamps are provided as Coordinated Universal Time (UTC).
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocationreport-gettimestamp
     */
    GetTimestamp() {
        pCreationTime := SYSTEMTIME()
        result := ComCall(4, this, "ptr", pCreationTime, "HRESULT")
        return pCreationTime
    }

    /**
     * Retrieves a property value from the location report.
     * @remarks
     * The properties may be platform defined or manufacturer defined.
     * 
     * Platform-defined <b>PROPERTYKEY</b> values for location sensors are defined in the location sensor data types section of sensors.h.
     * 
     * The following is a table of some platform-defined properties that are commonly association with location reports. These property keys have a <b>fmtid</b> field equal to <b>SENSOR_DATA_TYPE_LOCATION_GUID</b>. Additional properties can be found in sensors.h. If you are implementing your own location report to pass to <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-idefaultlocation-setreport">SetReport</a>, this table indicates which values must be supplied in your report object's implementation of <b>GetValue</b>.
     * 
     * <table>
     * <tr>
     * <th>Property key name and type</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>SENSOR_DATA_TYPE_LATITUDE <b>VT_R8</b>
     * 
     * </td>
     * <td>Degrees latitude where North is positive.
     *  
     * <div class="alert"><b>Note</b>  A latitude/longitude report object that is passed to <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-idefaultlocation-setreport">SetReport</a> must provide this value in its implementation of <b>GetValue</b>.</div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>SENSOR_DATA_TYPE_LONGITUDE <b>VT_R8</b>
     * 
     * </td>
     * <td>Degrees longitude where East is positive.
     *             
     * <div class="alert"><b>Note</b>  A latitude/longitude report object that is passed to <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-idefaultlocation-setreport">SetReport</a> must provide this value in its implementation of <b>GetValue</b>.</div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>SENSOR_DATA_TYPE_ALTITUDE_SEALEVEL_METERS <b>VT_R8</b>
     * 
     * </td>
     * <td>Altitude with respect to sea level, in meters.</td>
     * </tr>
     * <tr>
     * <td>SENSOR_DATA_TYPE_ALTITUDE_ELLIPSOID_METERS <b>VT_R8</b>
     * 
     * </td>
     * <td>Altitude with respect to the reference ellipsoid, in meters.</td>
     * </tr>
     * <tr>
     * <td>SENSOR_DATA_TYPE_SPEED_KNOTS <b>VT_R8</b>
     * 
     * </td>
     * <td>Speed measured in knots.</td>
     * </tr>
     * <tr>
     * <td>SENSOR_DATA_TYPE_TRUE_HEADING_DEGREES <b>VT_R8</b>
     * 
     * </td>
     * <td>Heading relative to true north in degrees.
     *             </td>
     * </tr>
     * <tr>
     * <td>SENSOR_DATA_TYPE_MAGNETIC_HEADING_DEGREES <b>VT_R8</b>
     * 
     * </td>
     * <td> Heading relative to magnetic north in degrees.</td>
     * </tr>
     * <tr>
     * <td>SENSOR_DATA_TYPE_MAGNETIC_VARIATION <b>VT_R8</b>
     * 
     * </td>
     * <td>Magnetic variation. East is positive.</td>
     * </tr>
     * <tr>
     * <td>SENSOR_DATA_TYPE_ERROR_RADIUS_METERS <b>VT_R8</b>
     * 
     * </td>
     * <td>Error radius that indicates accuracy of latitude and longitude in meters.
     * <div class="alert"><b>Note</b>  A latitude/longitude report object that is passed to <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-idefaultlocation-setreport">SetReport</a> must provide this value in its implementation of <b>GetValue</b>.</div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>SENSOR_DATA_TYPE_ADDRESS1 <b>VT_LPWSTR</b>
     * 
     * </td>
     * <td> First line of the address in a civic address report. 
     * <div class="alert"><b>Note</b>  If a civic address report object that is passed to <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-idefaultlocation-setreport">SetReport</a> contains this data, it should provide this value in its implementation of <b>GetValue</b>.</div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>SENSOR_DATA_TYPE_ADDRESS2 <b>VT_LPWSTR</b>
     * 
     * </td>
     * <td>Second line of the address in a civic address report.<div class="alert"><b>Note</b>  If a civic address report object that is passed to <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-idefaultlocation-setreport">SetReport</a> contains this data, it should provide this value in its implementation of <b>GetValue</b>.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td>SENSOR_DATA_TYPE_CITY <b>VT_LPWSTR</b>
     * 
     * </td>
     * <td> City field in a civic address report.<div class="alert"><b>Note</b>  If a civic address report object that is passed to <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-idefaultlocation-setreport">SetReport</a> contains this data, it should provide this value in its implementation of <b>GetValue</b>.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td>SENSOR_DATA_TYPE_STATE_PROVINCE <b>VT_LPWSTR</b>
     * 
     * </td>
     * <td>State/province field in a civic address report.<div class="alert"><b>Note</b>  If a civic address report object that is passed to <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-idefaultlocation-setreport">SetReport</a> contains this data, it should provide this value in its implementation of <b>GetValue</b>.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td>SENSOR_DATA_TYPE_POSTALCODE <b>VT_LPWSTR</b>
     * 
     * </td>
     * <td>Postal code field in a civic address report.<div class="alert"><b>Note</b>  If a civic address report object that is passed to <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-idefaultlocation-setreport">SetReport</a> contains this data, it should provide this value in its implementation of <b>GetValue</b>.</div>
     * <div> </div>
     * </td>
     * </tr>
     * <tr>
     * <td>SENSOR_DATA_TYPE_COUNTRY_REGION <b>VT_LPWSTR</b>
     * 
     * </td>
     * <td>Country/region code in a civic address report. The value must be a two-letter or three-letter ISO 3166 country code.
     * 
     * 
     * <div class="alert"><b>Note</b>  A civic address report object that is passed to <a href="https://docs.microsoft.com/windows/desktop/api/locationapi/nf-locationapi-idefaultlocation-setreport">SetReport</a> must provide this value in its implementation of <b>GetValue</b>.</div>
     * <div> </div>
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>SENSOR_DATA_TYPE_ALTITUDE_ELLIPSOID_ERROR_METERS <b>VT_R8</b>
     * 
     * </td>
     * <td>Altitude error with respect to the reference ellipsoid, in meters.</td>
     * </tr>
     * <tr>
     * <td>SENSOR_DATA_TYPE_ALTITUDE_SEALEVEL_ERROR_METERS <b>VT_R8</b>
     * 
     * </td>
     * <td>Altitude error with respect to sea level, in meters.</td>
     * </tr>
     * </table>
     *  
     * 
     * The following is a table of other platform-defined properties that may occur in location reports but are not specific to location. The <b>fmtid</b> field of these property keys is <b>SENSOR_PROPERTY_COMMON_GUID</b>.
     * 
     * <table>
     * <tr>
     * <th>Property key name and type</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td>SENSOR_PROPERTY_ACCURACY <b>VT_UNKNOWN</b>
     * 
     * </td>
     * <td>IPortableDeviceValues object that contains sensor data type names and their associated accuracies. Accuracy values represent possible variation from true values.
     * 
     * Accuracy values are expressed by using the same units as the data field, except when otherwise documented.
     *  </td>
     * </tr>
     * <tr>
     * <td>SENSOR_PROPERTY_CHANGE_SENSITIVITY <b>VT_UNKNOWN</b>
     * 
     * </td>
     * <td>
     * <b>IPortableDeviceValues</b> object that contains sensor data type names and their associated change sensitivity values. Change sensitivity values represent the amount by which the data field must change before the SENSOR_EVENT_DATA_UPDATED event is raised.
     * 
     * Sensitivity values are expressed by using the same units as the data field, except where otherwise documented. 
     * 
     * 
     * 
     * For example, a change sensitivity value of 2 for SENSOR_DATA_TYPE_TEMPERATURE_CELSIUS would represent a sensitivity of plus or minus 2 degrees Celsius.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>SENSOR_PROPERTY_CURRENT_CONNECTION_TYPE <b>VT_UI4</b>
     * 
     * </td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/sensorsapi/ne-sensorsapi-sensorconnectiontype">SensorConnectionType</a> value that contains the current connection type.</td>
     * </tr>
     * <tr>
     * <td>SENSOR_PROPERTY_CURRENT_REPORT_INTERVAL <b>VT_UI4</b>
     * 
     * </td>
     * <td>
     * The current elapsed time for sensor data report generation, in milliseconds.
     * 
     * Setting a value of zero signals the driver to use its default report interval. After receiving a value of zero for this property, a driver must return its default report interval, not zero, when queried.
     * 
     * Applications can set this value to request a particular report interval, but multiple applications might be using the same driver. Therefore, drivers determine the true report interval that is based on internal logic. For example, the driver might always use the shortest report interval that is requested by the caller.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>SENSOR_PROPERTY_DESCRIPTION <b>VT_LPWSTR</b>
     * 
     * </td>
     * <td>The sensor description string.</td>
     * </tr>
     * <tr>
     * <td>SENSOR_PROPERTY_DEVICE_PATH <b>VT_LPWSTR</b>
     * 
     * </td>
     * <td>
     * Uniquely identifies the device instance with which the sensor is associated. You can use this property to determine whether a device contains multiple sensors.
     * 
     * Device drivers do not have to support this property because the platform provides this value to applications without querying drivers.
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>SENSOR_PROPERTY_FRIENDLY_NAME <b>VT_LPWSTR</b>
     * 
     * </td>
     * <td> The friendly name for the device.</td>
     * </tr>
     * <tr>
     * <td>SENSOR_PROPERTY_LOCATION_DESIRED_ACCURACY <b>VT_UI4</b>
     * 
     * </td>
     * <td>An enumerated value that indicates the type of accuracy handling requested by a client application.<b>LOCATION_DESIRED_ACCURACY_DEFAULT</b> (0) indicates that the sensor should use the accuracy for which it can optimize power use and other cost considerations.
     * 
     * <b>LOCATION_DESIRED_ACCURACY_HIGH</b> (1) indicates that the sensor should deliver the most accurate report possible. This includes using services that might charge money, or consuming higher levels of battery power or connection bandwidth.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>SENSOR_PROPERTY_MANUFACTURER <b>VT_LPWSTR</b>
     * 
     * </td>
     * <td>The manufacturer's name.</td>
     * </tr>
     * <tr>
     * <td>SENSOR_PROPERTY_MIN_REPORT_INTERVAL <b>VT_UI4</b>
     * 
     * </td>
     * <td> The minimum elapsed time setting that the hardware supports for sensor data report generation, in milliseconds. </td>
     * </tr>
     * <tr>
     * <td>SENSOR_PROPERTY_MODEL <b>VT_LPWSTR</b>
     * 
     * </td>
     * <td>The sensor model name.</td>
     * </tr>
     * <tr>
     * <td>SENSOR_PROPERTY_PERSISTENT_UNIQUE_ID <b>VT_CLSID</b>
     * 
     * </td>
     * <td> A <b>GUID</b> that identifies the sensor. This value must be unique for each sensor on a device, or across devices of the same model as enumerated on the computer.</td>
     * </tr>
     * <tr>
     * <td>SENSOR_PROPERTY_RANGE_MAXIMUM <b>VT_UKNOWN</b>
     * 
     * </td>
     * <td><b>IPortableDeviceValues</b> object that contains sensor data field names and their associated maximum values.</td>
     * </tr>
     * <tr>
     * <td>SENSOR_PROPERTY_RANGE_MINIMUM <b>VT_UKNOWN</b>
     * 
     * </td>
     * <td><b>IPortableDeviceValues</b> object that contains sensor data field names and their associated minimum values.</td>
     * </tr>
     * <tr>
     * <td>SENSOR_PROPERTY_RESOLUTION <b>VT_UKNOWN</b>
     * 
     * </td>
     * <td><b>IPortableDeviceValues</b> object that contains sensor data field names and their associated resolutions. Resolution values represent sensitivity to change in the data field.
     * 
     * Resolution values are expressed by using the same units as the data field, except when otherwise documented.
     * 
     * 
     * 
     * </td>
     * </tr>
     * <tr>
     * <td>SENSOR_PROPERTY_SERIAL_NUMBER <b>VT_LPWSTR</b>
     * 
     * </td>
     * <td>The sensor serial number.</td>
     * </tr>
     * <tr>
     * <td>SENSOR_PROPERTY_STATE <b>VT_UI4</b>
     * 
     * </td>
     * <td>
     * <a href="https://docs.microsoft.com/windows/win32/api/sensorsapi/ne-sensorsapi-sensorstate">SensorState</a> value that contains the current sensor state.</td>
     * </tr>
     * <tr>
     * <td>SENSOR_PROPERTY_TYPE <b>VT_CLSID</b>
     * 
     * </td>
     * <td>A <b>GUID</b> that identifies the sensor type. Platform-defined sensor types are defined in Sensors.h.</td>
     * </tr>
     * </table>
     * @param {Pointer<PROPERTYKEY>} pKey <b>REFPROPERTYKEY</b> that specifies the name of the property to retrieve.
     * @returns {PROPVARIANT} Address of a <b>PROPVARIANT</b> that receives the property value.
     * @see https://learn.microsoft.com/windows/win32/api/locationapi/nf-locationapi-ilocationreport-getvalue
     */
    GetValue(pKey) {
        pValue := PROPVARIANT()
        result := ComCall(5, this, "ptr", pKey, "ptr", pValue, "HRESULT")
        return pValue
    }
}
