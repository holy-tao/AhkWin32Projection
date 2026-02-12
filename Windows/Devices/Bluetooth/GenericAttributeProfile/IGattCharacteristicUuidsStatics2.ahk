#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Devices.Bluetooth.GenericAttributeProfile
 * @version WindowsRuntime 1.4
 */
class IGattCharacteristicUuidsStatics2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGattCharacteristicUuidsStatics2
     * @type {Guid}
     */
    static IID => Guid("{1855b425-d46e-4a2c-9c3f-ed6dea29e7be}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_AlertCategoryId", "get_AlertCategoryIdBitMask", "get_AlertLevel", "get_AlertNotificationControlPoint", "get_AlertStatus", "get_GapAppearance", "get_BootKeyboardInputReport", "get_BootKeyboardOutputReport", "get_BootMouseInputReport", "get_CurrentTime", "get_CyclingPowerControlPoint", "get_CyclingPowerFeature", "get_CyclingPowerMeasurement", "get_CyclingPowerVector", "get_DateTime", "get_DayDateTime", "get_DayOfWeek", "get_GapDeviceName", "get_DstOffset", "get_ExactTime256", "get_FirmwareRevisionString", "get_HardwareRevisionString", "get_HidControlPoint", "get_HidInformation", "get_Ieee1107320601RegulatoryCertificationDataList", "get_LnControlPoint", "get_LnFeature", "get_LocalTimeInformation", "get_LocationAndSpeed", "get_ManufacturerNameString", "get_ModelNumberString", "get_Navigation", "get_NewAlert", "get_GapPeripheralPreferredConnectionParameters", "get_GapPeripheralPrivacyFlag", "get_PnpId", "get_PositionQuality", "get_ProtocolMode", "get_GapReconnectionAddress", "get_ReferenceTimeInformation", "get_Report", "get_ReportMap", "get_RingerControlPoint", "get_RingerSetting", "get_ScanIntervalWindow", "get_ScanRefresh", "get_SerialNumberString", "get_GattServiceChanged", "get_SoftwareRevisionString", "get_SupportedNewAlertCategory", "get_SupportUnreadAlertCategory", "get_SystemId", "get_TimeAccuracy", "get_TimeSource", "get_TimeUpdateControlPoint", "get_TimeUpdateState", "get_TimeWithDst", "get_TimeZone", "get_TxPowerLevel", "get_UnreadAlertStatus"]

    /**
     * @type {Guid} 
     */
    AlertCategoryId {
        get => this.get_AlertCategoryId()
    }

    /**
     * @type {Guid} 
     */
    AlertCategoryIdBitMask {
        get => this.get_AlertCategoryIdBitMask()
    }

    /**
     * @type {Guid} 
     */
    AlertLevel {
        get => this.get_AlertLevel()
    }

    /**
     * @type {Guid} 
     */
    AlertNotificationControlPoint {
        get => this.get_AlertNotificationControlPoint()
    }

    /**
     * @type {Guid} 
     */
    AlertStatus {
        get => this.get_AlertStatus()
    }

    /**
     * @type {Guid} 
     */
    GapAppearance {
        get => this.get_GapAppearance()
    }

    /**
     * @type {Guid} 
     */
    BootKeyboardInputReport {
        get => this.get_BootKeyboardInputReport()
    }

    /**
     * @type {Guid} 
     */
    BootKeyboardOutputReport {
        get => this.get_BootKeyboardOutputReport()
    }

    /**
     * @type {Guid} 
     */
    BootMouseInputReport {
        get => this.get_BootMouseInputReport()
    }

    /**
     * @type {Guid} 
     */
    CurrentTime {
        get => this.get_CurrentTime()
    }

    /**
     * @type {Guid} 
     */
    CyclingPowerControlPoint {
        get => this.get_CyclingPowerControlPoint()
    }

    /**
     * @type {Guid} 
     */
    CyclingPowerFeature {
        get => this.get_CyclingPowerFeature()
    }

    /**
     * @type {Guid} 
     */
    CyclingPowerMeasurement {
        get => this.get_CyclingPowerMeasurement()
    }

    /**
     * @type {Guid} 
     */
    CyclingPowerVector {
        get => this.get_CyclingPowerVector()
    }

    /**
     * @type {Guid} 
     */
    DateTime {
        get => this.get_DateTime()
    }

    /**
     * @type {Guid} 
     */
    DayDateTime {
        get => this.get_DayDateTime()
    }

    /**
     * @type {Guid} 
     */
    DayOfWeek {
        get => this.get_DayOfWeek()
    }

    /**
     * @type {Guid} 
     */
    GapDeviceName {
        get => this.get_GapDeviceName()
    }

    /**
     * @type {Guid} 
     */
    DstOffset {
        get => this.get_DstOffset()
    }

    /**
     * @type {Guid} 
     */
    ExactTime256 {
        get => this.get_ExactTime256()
    }

    /**
     * @type {Guid} 
     */
    FirmwareRevisionString {
        get => this.get_FirmwareRevisionString()
    }

    /**
     * @type {Guid} 
     */
    HardwareRevisionString {
        get => this.get_HardwareRevisionString()
    }

    /**
     * @type {Guid} 
     */
    HidControlPoint {
        get => this.get_HidControlPoint()
    }

    /**
     * @type {Guid} 
     */
    HidInformation {
        get => this.get_HidInformation()
    }

    /**
     * @type {Guid} 
     */
    Ieee1107320601RegulatoryCertificationDataList {
        get => this.get_Ieee1107320601RegulatoryCertificationDataList()
    }

    /**
     * @type {Guid} 
     */
    LnControlPoint {
        get => this.get_LnControlPoint()
    }

    /**
     * @type {Guid} 
     */
    LnFeature {
        get => this.get_LnFeature()
    }

    /**
     * @type {Guid} 
     */
    LocalTimeInformation {
        get => this.get_LocalTimeInformation()
    }

    /**
     * @type {Guid} 
     */
    LocationAndSpeed {
        get => this.get_LocationAndSpeed()
    }

    /**
     * @type {Guid} 
     */
    ManufacturerNameString {
        get => this.get_ManufacturerNameString()
    }

    /**
     * @type {Guid} 
     */
    ModelNumberString {
        get => this.get_ModelNumberString()
    }

    /**
     * @type {Guid} 
     */
    Navigation {
        get => this.get_Navigation()
    }

    /**
     * @type {Guid} 
     */
    NewAlert {
        get => this.get_NewAlert()
    }

    /**
     * @type {Guid} 
     */
    GapPeripheralPreferredConnectionParameters {
        get => this.get_GapPeripheralPreferredConnectionParameters()
    }

    /**
     * @type {Guid} 
     */
    GapPeripheralPrivacyFlag {
        get => this.get_GapPeripheralPrivacyFlag()
    }

    /**
     * @type {Guid} 
     */
    PnpId {
        get => this.get_PnpId()
    }

    /**
     * @type {Guid} 
     */
    PositionQuality {
        get => this.get_PositionQuality()
    }

    /**
     * @type {Guid} 
     */
    ProtocolMode {
        get => this.get_ProtocolMode()
    }

    /**
     * @type {Guid} 
     */
    GapReconnectionAddress {
        get => this.get_GapReconnectionAddress()
    }

    /**
     * @type {Guid} 
     */
    ReferenceTimeInformation {
        get => this.get_ReferenceTimeInformation()
    }

    /**
     * @type {Guid} 
     */
    Report {
        get => this.get_Report()
    }

    /**
     * @type {Guid} 
     */
    ReportMap {
        get => this.get_ReportMap()
    }

    /**
     * @type {Guid} 
     */
    RingerControlPoint {
        get => this.get_RingerControlPoint()
    }

    /**
     * @type {Guid} 
     */
    RingerSetting {
        get => this.get_RingerSetting()
    }

    /**
     * @type {Guid} 
     */
    ScanIntervalWindow {
        get => this.get_ScanIntervalWindow()
    }

    /**
     * @type {Guid} 
     */
    ScanRefresh {
        get => this.get_ScanRefresh()
    }

    /**
     * @type {Guid} 
     */
    SerialNumberString {
        get => this.get_SerialNumberString()
    }

    /**
     * @type {Guid} 
     */
    GattServiceChanged {
        get => this.get_GattServiceChanged()
    }

    /**
     * @type {Guid} 
     */
    SoftwareRevisionString {
        get => this.get_SoftwareRevisionString()
    }

    /**
     * @type {Guid} 
     */
    SupportedNewAlertCategory {
        get => this.get_SupportedNewAlertCategory()
    }

    /**
     * @type {Guid} 
     */
    SupportUnreadAlertCategory {
        get => this.get_SupportUnreadAlertCategory()
    }

    /**
     * @type {Guid} 
     */
    SystemId {
        get => this.get_SystemId()
    }

    /**
     * @type {Guid} 
     */
    TimeAccuracy {
        get => this.get_TimeAccuracy()
    }

    /**
     * @type {Guid} 
     */
    TimeSource {
        get => this.get_TimeSource()
    }

    /**
     * @type {Guid} 
     */
    TimeUpdateControlPoint {
        get => this.get_TimeUpdateControlPoint()
    }

    /**
     * @type {Guid} 
     */
    TimeUpdateState {
        get => this.get_TimeUpdateState()
    }

    /**
     * @type {Guid} 
     */
    TimeWithDst {
        get => this.get_TimeWithDst()
    }

    /**
     * @type {Guid} 
     */
    TimeZone {
        get => this.get_TimeZone()
    }

    /**
     * @type {Guid} 
     */
    TxPowerLevel {
        get => this.get_TxPowerLevel()
    }

    /**
     * @type {Guid} 
     */
    UnreadAlertStatus {
        get => this.get_UnreadAlertStatus()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_AlertCategoryId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_AlertCategoryIdBitMask() {
        value := Guid()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_AlertLevel() {
        value := Guid()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_AlertNotificationControlPoint() {
        value := Guid()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_AlertStatus() {
        value := Guid()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_GapAppearance() {
        value := Guid()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_BootKeyboardInputReport() {
        value := Guid()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_BootKeyboardOutputReport() {
        value := Guid()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_BootMouseInputReport() {
        value := Guid()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_CurrentTime() {
        value := Guid()
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_CyclingPowerControlPoint() {
        value := Guid()
        result := ComCall(16, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_CyclingPowerFeature() {
        value := Guid()
        result := ComCall(17, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_CyclingPowerMeasurement() {
        value := Guid()
        result := ComCall(18, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_CyclingPowerVector() {
        value := Guid()
        result := ComCall(19, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DateTime() {
        value := Guid()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DayDateTime() {
        value := Guid()
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DayOfWeek() {
        value := Guid()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_GapDeviceName() {
        value := Guid()
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_DstOffset() {
        value := Guid()
        result := ComCall(24, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ExactTime256() {
        value := Guid()
        result := ComCall(25, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_FirmwareRevisionString() {
        value := Guid()
        result := ComCall(26, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_HardwareRevisionString() {
        value := Guid()
        result := ComCall(27, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_HidControlPoint() {
        value := Guid()
        result := ComCall(28, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_HidInformation() {
        value := Guid()
        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Ieee1107320601RegulatoryCertificationDataList() {
        value := Guid()
        result := ComCall(30, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_LnControlPoint() {
        value := Guid()
        result := ComCall(31, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_LnFeature() {
        value := Guid()
        result := ComCall(32, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_LocalTimeInformation() {
        value := Guid()
        result := ComCall(33, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_LocationAndSpeed() {
        value := Guid()
        result := ComCall(34, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ManufacturerNameString() {
        value := Guid()
        result := ComCall(35, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ModelNumberString() {
        value := Guid()
        result := ComCall(36, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Navigation() {
        value := Guid()
        result := ComCall(37, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_NewAlert() {
        value := Guid()
        result := ComCall(38, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_GapPeripheralPreferredConnectionParameters() {
        value := Guid()
        result := ComCall(39, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_GapPeripheralPrivacyFlag() {
        value := Guid()
        result := ComCall(40, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_PnpId() {
        value := Guid()
        result := ComCall(41, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_PositionQuality() {
        value := Guid()
        result := ComCall(42, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ProtocolMode() {
        value := Guid()
        result := ComCall(43, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_GapReconnectionAddress() {
        value := Guid()
        result := ComCall(44, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ReferenceTimeInformation() {
        value := Guid()
        result := ComCall(45, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_Report() {
        value := Guid()
        result := ComCall(46, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ReportMap() {
        value := Guid()
        result := ComCall(47, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_RingerControlPoint() {
        value := Guid()
        result := ComCall(48, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_RingerSetting() {
        value := Guid()
        result := ComCall(49, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ScanIntervalWindow() {
        value := Guid()
        result := ComCall(50, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_ScanRefresh() {
        value := Guid()
        result := ComCall(51, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_SerialNumberString() {
        value := Guid()
        result := ComCall(52, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_GattServiceChanged() {
        value := Guid()
        result := ComCall(53, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_SoftwareRevisionString() {
        value := Guid()
        result := ComCall(54, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_SupportedNewAlertCategory() {
        value := Guid()
        result := ComCall(55, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_SupportUnreadAlertCategory() {
        value := Guid()
        result := ComCall(56, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_SystemId() {
        value := Guid()
        result := ComCall(57, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_TimeAccuracy() {
        value := Guid()
        result := ComCall(58, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_TimeSource() {
        value := Guid()
        result := ComCall(59, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_TimeUpdateControlPoint() {
        value := Guid()
        result := ComCall(60, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_TimeUpdateState() {
        value := Guid()
        result := ComCall(61, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_TimeWithDst() {
        value := Guid()
        result := ComCall(62, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_TimeZone() {
        value := Guid()
        result := ComCall(63, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_TxPowerLevel() {
        value := Guid()
        result := ComCall(64, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_UnreadAlertStatus() {
        value := Guid()
        result := ComCall(65, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
