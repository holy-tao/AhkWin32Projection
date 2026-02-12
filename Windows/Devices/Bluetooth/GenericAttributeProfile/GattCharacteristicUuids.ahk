#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGattCharacteristicUuidsStatics.ahk
#Include .\IGattCharacteristicUuidsStatics2.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents an enumeration of the most well known Characteristic UUID values, and provides convenience methods for working with GATT characteristic UUIDs, and static properties providing characteristic UUIDs for common GATT characteristics.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class GattCharacteristicUuids extends IInspectable {
;@region Static Properties
    /**
     * Gets the Bluetooth SIG-defined Battery Level Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.batterylevel
     * @type {Guid} 
     */
    static BatteryLevel {
        get => GattCharacteristicUuids.get_BatteryLevel()
    }

    /**
     * Gets the Bluetooth SIG-defined Blood Pressure Feature Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.bloodpressurefeature
     * @type {Guid} 
     */
    static BloodPressureFeature {
        get => GattCharacteristicUuids.get_BloodPressureFeature()
    }

    /**
     * Gets the Bluetooth SIG-defined Blood Pressure Measurement Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.bloodpressuremeasurement
     * @type {Guid} 
     */
    static BloodPressureMeasurement {
        get => GattCharacteristicUuids.get_BloodPressureMeasurement()
    }

    /**
     * Gets the Bluetooth SIG-defined Body Sensor Location Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.bodysensorlocation
     * @type {Guid} 
     */
    static BodySensorLocation {
        get => GattCharacteristicUuids.get_BodySensorLocation()
    }

    /**
     * Gets the Bluetooth SIG-defined Csc Feature Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.cscfeature
     * @type {Guid} 
     */
    static CscFeature {
        get => GattCharacteristicUuids.get_CscFeature()
    }

    /**
     * Gets the Bluetooth SIG-defined Csc Measurement Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.cscmeasurement
     * @type {Guid} 
     */
    static CscMeasurement {
        get => GattCharacteristicUuids.get_CscMeasurement()
    }

    /**
     * Gets the Bluetooth SIG-defined Glucose Feature Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.glucosefeature
     * @type {Guid} 
     */
    static GlucoseFeature {
        get => GattCharacteristicUuids.get_GlucoseFeature()
    }

    /**
     * Gets the Bluetooth SIG-defined Glucose Measurement Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.glucosemeasurement
     * @type {Guid} 
     */
    static GlucoseMeasurement {
        get => GattCharacteristicUuids.get_GlucoseMeasurement()
    }

    /**
     * Gets the Bluetooth SIG-defined Glucose Measurement Context Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.glucosemeasurementcontext
     * @type {Guid} 
     */
    static GlucoseMeasurementContext {
        get => GattCharacteristicUuids.get_GlucoseMeasurementContext()
    }

    /**
     * Gets the Bluetooth SIG-defined Heart Rate Control Point Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.heartratecontrolpoint
     * @type {Guid} 
     */
    static HeartRateControlPoint {
        get => GattCharacteristicUuids.get_HeartRateControlPoint()
    }

    /**
     * Gets the Bluetooth SIG-defined Heart Rate Measurement Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.heartratemeasurement
     * @type {Guid} 
     */
    static HeartRateMeasurement {
        get => GattCharacteristicUuids.get_HeartRateMeasurement()
    }

    /**
     * Gets the Bluetooth SIG-defined Intermediate Cuff Pressure Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.intermediatecuffpressure
     * @type {Guid} 
     */
    static IntermediateCuffPressure {
        get => GattCharacteristicUuids.get_IntermediateCuffPressure()
    }

    /**
     * Gets the Bluetooth SIG-defined Intermediate Temperature Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.intermediatetemperature
     * @type {Guid} 
     */
    static IntermediateTemperature {
        get => GattCharacteristicUuids.get_IntermediateTemperature()
    }

    /**
     * Gets the Bluetooth SIG-defined Measurement Interval Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.measurementinterval
     * @type {Guid} 
     */
    static MeasurementInterval {
        get => GattCharacteristicUuids.get_MeasurementInterval()
    }

    /**
     * Gets the Bluetooth SIG-defined Record Access Control Point Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.recordaccesscontrolpoint
     * @type {Guid} 
     */
    static RecordAccessControlPoint {
        get => GattCharacteristicUuids.get_RecordAccessControlPoint()
    }

    /**
     * Gets the Bluetooth SIG-defined Rsc Feature Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.rscfeature
     * @type {Guid} 
     */
    static RscFeature {
        get => GattCharacteristicUuids.get_RscFeature()
    }

    /**
     * Gets the Bluetooth SIG-defined Rsc Measurement Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.rscmeasurement
     * @type {Guid} 
     */
    static RscMeasurement {
        get => GattCharacteristicUuids.get_RscMeasurement()
    }

    /**
     * Gets the Bluetooth SIG-defined SC Control Point Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.sccontrolpoint
     * @type {Guid} 
     */
    static SCControlPoint {
        get => GattCharacteristicUuids.get_SCControlPoint()
    }

    /**
     * Gets the Bluetooth SIG-defined Sensor Location Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.sensorlocation
     * @type {Guid} 
     */
    static SensorLocation {
        get => GattCharacteristicUuids.get_SensorLocation()
    }

    /**
     * Gets the Bluetooth SIG-defined Temperature Measurement Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.temperaturemeasurement
     * @type {Guid} 
     */
    static TemperatureMeasurement {
        get => GattCharacteristicUuids.get_TemperatureMeasurement()
    }

    /**
     * Gets the Bluetooth SIG-defined Temperature Type Characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.temperaturetype
     * @type {Guid} 
     */
    static TemperatureType {
        get => GattCharacteristicUuids.get_TemperatureType()
    }

    /**
     * Gets the Bluetooth SIG-defined AlertCategoryId characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.alertcategoryid
     * @type {Guid} 
     */
    static AlertCategoryId {
        get => GattCharacteristicUuids.get_AlertCategoryId()
    }

    /**
     * Gets the Bluetooth SIG-Defined AlertCategoryIdBitMask characteristic UUID. To view a list of all Bluetooth SIG-defined characteristic UUIDs, see [Bluetooth SIG-defined Characteristic UUIDs](https://www.bluetooth.com/specifications/assigned-numbers/).
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.alertcategoryidbitmask
     * @type {Guid} 
     */
    static AlertCategoryIdBitMask {
        get => GattCharacteristicUuids.get_AlertCategoryIdBitMask()
    }

    /**
     * Gets the Bluetooth SIG-defined AlertLevel characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.alertlevel
     * @type {Guid} 
     */
    static AlertLevel {
        get => GattCharacteristicUuids.get_AlertLevel()
    }

    /**
     * Gets the Bluetooth SIG-defined AlertNotificationControlPoint characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.alertnotificationcontrolpoint
     * @type {Guid} 
     */
    static AlertNotificationControlPoint {
        get => GattCharacteristicUuids.get_AlertNotificationControlPoint()
    }

    /**
     * Gets the Bluetooth SIG-defined AlertStatus characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.alertstatus
     * @type {Guid} 
     */
    static AlertStatus {
        get => GattCharacteristicUuids.get_AlertStatus()
    }

    /**
     * Gets the Bluetooth SIG-defined GapAppearance characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.gapappearance
     * @type {Guid} 
     */
    static GapAppearance {
        get => GattCharacteristicUuids.get_GapAppearance()
    }

    /**
     * Gets the Bluetooth SIG-defined BootKeyboardInputReport characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.bootkeyboardinputreport
     * @type {Guid} 
     */
    static BootKeyboardInputReport {
        get => GattCharacteristicUuids.get_BootKeyboardInputReport()
    }

    /**
     * Gets the Bluetooth SIG-defined BootKeyboardOutputReport characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.bootkeyboardoutputreport
     * @type {Guid} 
     */
    static BootKeyboardOutputReport {
        get => GattCharacteristicUuids.get_BootKeyboardOutputReport()
    }

    /**
     * Gets the Bluetooth SIG-defined BootMouseInputReport characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.bootmouseinputreport
     * @type {Guid} 
     */
    static BootMouseInputReport {
        get => GattCharacteristicUuids.get_BootMouseInputReport()
    }

    /**
     * Gets the Bluetooth SIG-defined CurrentTime characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.currenttime
     * @type {Guid} 
     */
    static CurrentTime {
        get => GattCharacteristicUuids.get_CurrentTime()
    }

    /**
     * Gets the Bluetooth SIG-defined CyclingPowerControlPoint characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.cyclingpowercontrolpoint
     * @type {Guid} 
     */
    static CyclingPowerControlPoint {
        get => GattCharacteristicUuids.get_CyclingPowerControlPoint()
    }

    /**
     * Gets the Bluetooth SIG-defined CyclingPowerFeature characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.cyclingpowerfeature
     * @type {Guid} 
     */
    static CyclingPowerFeature {
        get => GattCharacteristicUuids.get_CyclingPowerFeature()
    }

    /**
     * Gets the Bluetooth SIG-defined CyclingPowerMeasurement characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.cyclingpowermeasurement
     * @type {Guid} 
     */
    static CyclingPowerMeasurement {
        get => GattCharacteristicUuids.get_CyclingPowerMeasurement()
    }

    /**
     * Gets the Bluetooth SIG-defined CyclingPowerVector characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.cyclingpowervector
     * @type {Guid} 
     */
    static CyclingPowerVector {
        get => GattCharacteristicUuids.get_CyclingPowerVector()
    }

    /**
     * Gets the Bluetooth SIG-defined DateTime characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.datetime
     * @type {Guid} 
     */
    static DateTime {
        get => GattCharacteristicUuids.get_DateTime()
    }

    /**
     * Gets the Bluetooth SIG-defined DayDateTime characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.daydatetime
     * @type {Guid} 
     */
    static DayDateTime {
        get => GattCharacteristicUuids.get_DayDateTime()
    }

    /**
     * Gets the Bluetooth SIG-defined DayOfWeek characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.dayofweek
     * @type {Guid} 
     */
    static DayOfWeek {
        get => GattCharacteristicUuids.get_DayOfWeek()
    }

    /**
     * Gets the Bluetooth SIG-defined GapDeviceName characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.gapdevicename
     * @type {Guid} 
     */
    static GapDeviceName {
        get => GattCharacteristicUuids.get_GapDeviceName()
    }

    /**
     * Gets the Bluetooth SIG-defined DstOffset characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.dstoffset
     * @type {Guid} 
     */
    static DstOffset {
        get => GattCharacteristicUuids.get_DstOffset()
    }

    /**
     * Gets the Bluetooth SIG-defined ExactTime256 characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.exacttime256
     * @type {Guid} 
     */
    static ExactTime256 {
        get => GattCharacteristicUuids.get_ExactTime256()
    }

    /**
     * Gets the Bluetooth SIG-defined FirmwareRevisionString characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.firmwarerevisionstring
     * @type {Guid} 
     */
    static FirmwareRevisionString {
        get => GattCharacteristicUuids.get_FirmwareRevisionString()
    }

    /**
     * Gets the Bluetooth SIG-defined HardwareRevisionString characterisitc UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.hardwarerevisionstring
     * @type {Guid} 
     */
    static HardwareRevisionString {
        get => GattCharacteristicUuids.get_HardwareRevisionString()
    }

    /**
     * Gets the Bluetooth SIG-defined HidControlPoint characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.hidcontrolpoint
     * @type {Guid} 
     */
    static HidControlPoint {
        get => GattCharacteristicUuids.get_HidControlPoint()
    }

    /**
     * Gets the Bluetooth SIG-defined HidInformation characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.hidinformation
     * @type {Guid} 
     */
    static HidInformation {
        get => GattCharacteristicUuids.get_HidInformation()
    }

    /**
     * Gets the Bluetooth SIG-defined Ieee1107320601RegulatoryCertificationDataList characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.ieee1107320601regulatorycertificationdatalist
     * @type {Guid} 
     */
    static Ieee1107320601RegulatoryCertificationDataList {
        get => GattCharacteristicUuids.get_Ieee1107320601RegulatoryCertificationDataList()
    }

    /**
     * Gets the Bluetooth SIG-defined LnControlPoint characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.lncontrolpoint
     * @type {Guid} 
     */
    static LnControlPoint {
        get => GattCharacteristicUuids.get_LnControlPoint()
    }

    /**
     * Gets the Bluetooth SIG-defined LnFeature characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.lnfeature
     * @type {Guid} 
     */
    static LnFeature {
        get => GattCharacteristicUuids.get_LnFeature()
    }

    /**
     * Gets the Bluetooth SIG-defined LocalTimeInformation characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.localtimeinformation
     * @type {Guid} 
     */
    static LocalTimeInformation {
        get => GattCharacteristicUuids.get_LocalTimeInformation()
    }

    /**
     * Gets the Bluetooth SIG-defined LocationAndSpeed characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.locationandspeed
     * @type {Guid} 
     */
    static LocationAndSpeed {
        get => GattCharacteristicUuids.get_LocationAndSpeed()
    }

    /**
     * Gets the Bluetooth SIG-defined ManufacturerNameString characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.manufacturernamestring
     * @type {Guid} 
     */
    static ManufacturerNameString {
        get => GattCharacteristicUuids.get_ManufacturerNameString()
    }

    /**
     * Gets the Bluetooth SIG-defined ModelNumberString UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.modelnumberstring
     * @type {Guid} 
     */
    static ModelNumberString {
        get => GattCharacteristicUuids.get_ModelNumberString()
    }

    /**
     * Gets the Bluetooth SIG-defined Navigation characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.navigation
     * @type {Guid} 
     */
    static Navigation {
        get => GattCharacteristicUuids.get_Navigation()
    }

    /**
     * Gets the Bluetooth SIG-defined NewAlert characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.newalert
     * @type {Guid} 
     */
    static NewAlert {
        get => GattCharacteristicUuids.get_NewAlert()
    }

    /**
     * Gets the Bluetooth SIG-defined GapPeripheralPreferredConnectionParameters characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.gapperipheralpreferredconnectionparameters
     * @type {Guid} 
     */
    static GapPeripheralPreferredConnectionParameters {
        get => GattCharacteristicUuids.get_GapPeripheralPreferredConnectionParameters()
    }

    /**
     * Gets the Bluetooth GapPeripheralPrivacyFlag characterisitc UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.gapperipheralprivacyflag
     * @type {Guid} 
     */
    static GapPeripheralPrivacyFlag {
        get => GattCharacteristicUuids.get_GapPeripheralPrivacyFlag()
    }

    /**
     * Gets the Bluetooth SIG-defined PnpId characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.pnpid
     * @type {Guid} 
     */
    static PnpId {
        get => GattCharacteristicUuids.get_PnpId()
    }

    /**
     * Gets the Bluetooth SIG-defined PositionQuality characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.positionquality
     * @type {Guid} 
     */
    static PositionQuality {
        get => GattCharacteristicUuids.get_PositionQuality()
    }

    /**
     * Gets the Bluetooth SIG-defined ProtocolMode characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.protocolmode
     * @type {Guid} 
     */
    static ProtocolMode {
        get => GattCharacteristicUuids.get_ProtocolMode()
    }

    /**
     * Gets the Bluetooth SIG-defined GapReconnectionAddress characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.gapreconnectionaddress
     * @type {Guid} 
     */
    static GapReconnectionAddress {
        get => GattCharacteristicUuids.get_GapReconnectionAddress()
    }

    /**
     * Gets the Bluetooth SIG-defined ReferenceTimeInformation characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.referencetimeinformation
     * @type {Guid} 
     */
    static ReferenceTimeInformation {
        get => GattCharacteristicUuids.get_ReferenceTimeInformation()
    }

    /**
     * Gets the Bluetooth SIG-defined Report characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.report
     * @type {Guid} 
     */
    static Report {
        get => GattCharacteristicUuids.get_Report()
    }

    /**
     * Gets the Bluetooth SIG-defined ReportMap characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.reportmap
     * @type {Guid} 
     */
    static ReportMap {
        get => GattCharacteristicUuids.get_ReportMap()
    }

    /**
     * Gets the Bluetooth SIG-defined RingerControlPoint characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.ringercontrolpoint
     * @type {Guid} 
     */
    static RingerControlPoint {
        get => GattCharacteristicUuids.get_RingerControlPoint()
    }

    /**
     * Gets the Bluetooth SIG-defined RingerSetting characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.ringersetting
     * @type {Guid} 
     */
    static RingerSetting {
        get => GattCharacteristicUuids.get_RingerSetting()
    }

    /**
     * Gets the Bluetooth SIG-defined ScanIntervalWindow characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.scanintervalwindow
     * @type {Guid} 
     */
    static ScanIntervalWindow {
        get => GattCharacteristicUuids.get_ScanIntervalWindow()
    }

    /**
     * Gets the Bluetooth SIG-defined ScanRefresh characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.scanrefresh
     * @type {Guid} 
     */
    static ScanRefresh {
        get => GattCharacteristicUuids.get_ScanRefresh()
    }

    /**
     * Gets the Bluetooth SIG-defined SerialNumberString characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.serialnumberstring
     * @type {Guid} 
     */
    static SerialNumberString {
        get => GattCharacteristicUuids.get_SerialNumberString()
    }

    /**
     * Gets the Bluetooth SIG-defined GattServiceChanged characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.gattservicechanged
     * @type {Guid} 
     */
    static GattServiceChanged {
        get => GattCharacteristicUuids.get_GattServiceChanged()
    }

    /**
     * Gets the Bluetooth SIG-defined SoftwareRevisionString characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.softwarerevisionstring
     * @type {Guid} 
     */
    static SoftwareRevisionString {
        get => GattCharacteristicUuids.get_SoftwareRevisionString()
    }

    /**
     * Gets the Bluetooth SIG-defined SupportedNewAlertCategory characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.supportednewalertcategory
     * @type {Guid} 
     */
    static SupportedNewAlertCategory {
        get => GattCharacteristicUuids.get_SupportedNewAlertCategory()
    }

    /**
     * Gets the Bluetooth SIG-defined SupportUnreadAlertCategory characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.supportunreadalertcategory
     * @type {Guid} 
     */
    static SupportUnreadAlertCategory {
        get => GattCharacteristicUuids.get_SupportUnreadAlertCategory()
    }

    /**
     * Gets the Bluetooth SIG-defined SystemId characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.systemid
     * @type {Guid} 
     */
    static SystemId {
        get => GattCharacteristicUuids.get_SystemId()
    }

    /**
     * Gets the Bluetooth SIG-defined TimeAccuracy characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.timeaccuracy
     * @type {Guid} 
     */
    static TimeAccuracy {
        get => GattCharacteristicUuids.get_TimeAccuracy()
    }

    /**
     * Gets the Bluetooth SIG-defined TimeSource characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.timesource
     * @type {Guid} 
     */
    static TimeSource {
        get => GattCharacteristicUuids.get_TimeSource()
    }

    /**
     * Gets the Bluetooth SIG-defined TimeUpdateControlPoint characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.timeupdatecontrolpoint
     * @type {Guid} 
     */
    static TimeUpdateControlPoint {
        get => GattCharacteristicUuids.get_TimeUpdateControlPoint()
    }

    /**
     * Gets the Bluetooth SIG-defined TimeUpdateState characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.timeupdatestate
     * @type {Guid} 
     */
    static TimeUpdateState {
        get => GattCharacteristicUuids.get_TimeUpdateState()
    }

    /**
     * Gets the Bluetooth SIG-defined TimeWithDst characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.timewithdst
     * @type {Guid} 
     */
    static TimeWithDst {
        get => GattCharacteristicUuids.get_TimeWithDst()
    }

    /**
     * Gets the Bluetooth SIG-defined TimeZone characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.timezone
     * @type {Guid} 
     */
    static TimeZone {
        get => GattCharacteristicUuids.get_TimeZone()
    }

    /**
     * Gets the Bluetooth SIG-defined TxPowerLevel characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.txpowerlevel
     * @type {Guid} 
     */
    static TxPowerLevel {
        get => GattCharacteristicUuids.get_TxPowerLevel()
    }

    /**
     * Gets the Bluetooth SIG-defined UnreadAlertStatus characteristic UUID.
     * @see https://learn.microsoft.com/uwp/api/windows.devices.bluetooth.genericattributeprofile.gattcharacteristicuuids.unreadalertstatus
     * @type {Guid} 
     */
    static UnreadAlertStatus {
        get => GattCharacteristicUuids.get_UnreadAlertStatus()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Guid} 
     */
    static get_BatteryLevel() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_BatteryLevel()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_BloodPressureFeature() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_BloodPressureFeature()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_BloodPressureMeasurement() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_BloodPressureMeasurement()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_BodySensorLocation() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_BodySensorLocation()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_CscFeature() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_CscFeature()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_CscMeasurement() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_CscMeasurement()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_GlucoseFeature() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_GlucoseFeature()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_GlucoseMeasurement() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_GlucoseMeasurement()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_GlucoseMeasurementContext() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_GlucoseMeasurementContext()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_HeartRateControlPoint() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_HeartRateControlPoint()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_HeartRateMeasurement() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_HeartRateMeasurement()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_IntermediateCuffPressure() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_IntermediateCuffPressure()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_IntermediateTemperature() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_IntermediateTemperature()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_MeasurementInterval() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_MeasurementInterval()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_RecordAccessControlPoint() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_RecordAccessControlPoint()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_RscFeature() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_RscFeature()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_RscMeasurement() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_RscMeasurement()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_SCControlPoint() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_SCControlPoint()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_SensorLocation() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_SensorLocation()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_TemperatureMeasurement() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_TemperatureMeasurement()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_TemperatureType() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics := IGattCharacteristicUuidsStatics(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics.get_TemperatureType()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_AlertCategoryId() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_AlertCategoryId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_AlertCategoryIdBitMask() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_AlertCategoryIdBitMask()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_AlertLevel() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_AlertLevel()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_AlertNotificationControlPoint() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_AlertNotificationControlPoint()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_AlertStatus() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_AlertStatus()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_GapAppearance() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_GapAppearance()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_BootKeyboardInputReport() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_BootKeyboardInputReport()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_BootKeyboardOutputReport() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_BootKeyboardOutputReport()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_BootMouseInputReport() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_BootMouseInputReport()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_CurrentTime() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_CurrentTime()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_CyclingPowerControlPoint() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_CyclingPowerControlPoint()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_CyclingPowerFeature() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_CyclingPowerFeature()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_CyclingPowerMeasurement() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_CyclingPowerMeasurement()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_CyclingPowerVector() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_CyclingPowerVector()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_DateTime() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_DateTime()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_DayDateTime() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_DayDateTime()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_DayOfWeek() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_DayOfWeek()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_GapDeviceName() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_GapDeviceName()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_DstOffset() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_DstOffset()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_ExactTime256() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_ExactTime256()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_FirmwareRevisionString() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_FirmwareRevisionString()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_HardwareRevisionString() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_HardwareRevisionString()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_HidControlPoint() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_HidControlPoint()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_HidInformation() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_HidInformation()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_Ieee1107320601RegulatoryCertificationDataList() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_Ieee1107320601RegulatoryCertificationDataList()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_LnControlPoint() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_LnControlPoint()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_LnFeature() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_LnFeature()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_LocalTimeInformation() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_LocalTimeInformation()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_LocationAndSpeed() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_LocationAndSpeed()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_ManufacturerNameString() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_ManufacturerNameString()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_ModelNumberString() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_ModelNumberString()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_Navigation() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_Navigation()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_NewAlert() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_NewAlert()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_GapPeripheralPreferredConnectionParameters() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_GapPeripheralPreferredConnectionParameters()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_GapPeripheralPrivacyFlag() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_GapPeripheralPrivacyFlag()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_PnpId() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_PnpId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_PositionQuality() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_PositionQuality()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_ProtocolMode() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_ProtocolMode()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_GapReconnectionAddress() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_GapReconnectionAddress()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_ReferenceTimeInformation() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_ReferenceTimeInformation()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_Report() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_Report()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_ReportMap() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_ReportMap()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_RingerControlPoint() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_RingerControlPoint()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_RingerSetting() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_RingerSetting()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_ScanIntervalWindow() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_ScanIntervalWindow()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_ScanRefresh() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_ScanRefresh()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_SerialNumberString() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_SerialNumberString()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_GattServiceChanged() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_GattServiceChanged()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_SoftwareRevisionString() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_SoftwareRevisionString()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_SupportedNewAlertCategory() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_SupportedNewAlertCategory()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_SupportUnreadAlertCategory() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_SupportUnreadAlertCategory()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_SystemId() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_SystemId()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_TimeAccuracy() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_TimeAccuracy()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_TimeSource() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_TimeSource()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_TimeUpdateControlPoint() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_TimeUpdateControlPoint()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_TimeUpdateState() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_TimeUpdateState()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_TimeWithDst() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_TimeWithDst()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_TimeZone() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_TimeZone()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_TxPowerLevel() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_TxPowerLevel()
    }

    /**
     * 
     * @returns {Guid} 
     */
    static get_UnreadAlertStatus() {
        if (!GattCharacteristicUuids.HasProp("__IGattCharacteristicUuidsStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Devices.Bluetooth.GenericAttributeProfile.GattCharacteristicUuids")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGattCharacteristicUuidsStatics2.IID)
            GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2 := IGattCharacteristicUuidsStatics2(factoryPtr)
        }

        return GattCharacteristicUuids.__IGattCharacteristicUuidsStatics2.get_UnreadAlertStatus()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
