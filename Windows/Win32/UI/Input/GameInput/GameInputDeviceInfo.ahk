#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include .\GameInputUsage.ahk
#Include .\GameInputVersion.ahk
#Include ..\..\..\Foundation\APP_LOCAL_DEVICE_ID.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputDeviceInfo extends Win32Struct
{
    static sizeof => 328

    static packingSize => 8

    /**
     * @type {Integer}
     */
    infoSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    vendorId {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    productId {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * @type {Integer}
     */
    revisionNumber {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    interfaceNumber {
        get => NumGet(this, 10, "char")
        set => NumPut("char", value, this, 10)
    }

    /**
     * @type {Integer}
     */
    collectionNumber {
        get => NumGet(this, 11, "char")
        set => NumPut("char", value, this, 11)
    }

    /**
     * @type {GameInputUsage}
     */
    usage{
        get {
            if(!this.HasProp("__usage"))
                this.__usage := GameInputUsage(12, this)
            return this.__usage
        }
    }

    /**
     * @type {GameInputVersion}
     */
    hardwareVersion{
        get {
            if(!this.HasProp("__hardwareVersion"))
                this.__hardwareVersion := GameInputVersion(16, this)
            return this.__hardwareVersion
        }
    }

    /**
     * @type {GameInputVersion}
     */
    firmwareVersion{
        get {
            if(!this.HasProp("__firmwareVersion"))
                this.__firmwareVersion := GameInputVersion(24, this)
            return this.__firmwareVersion
        }
    }

    /**
     * @type {APP_LOCAL_DEVICE_ID}
     */
    deviceId{
        get {
            if(!this.HasProp("__deviceId"))
                this.__deviceId := APP_LOCAL_DEVICE_ID(32, this)
            return this.__deviceId
        }
    }

    /**
     * @type {APP_LOCAL_DEVICE_ID}
     */
    deviceRootId{
        get {
            if(!this.HasProp("__deviceRootId"))
                this.__deviceRootId := APP_LOCAL_DEVICE_ID(64, this)
            return this.__deviceRootId
        }
    }

    /**
     * @type {Integer}
     */
    deviceFamily {
        get => NumGet(this, 96, "int")
        set => NumPut("int", value, this, 96)
    }

    /**
     * @type {Integer}
     */
    capabilities {
        get => NumGet(this, 100, "int")
        set => NumPut("int", value, this, 100)
    }

    /**
     * @type {Integer}
     */
    supportedInput {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * @type {Integer}
     */
    supportedRumbleMotors {
        get => NumGet(this, 108, "int")
        set => NumPut("int", value, this, 108)
    }

    /**
     * @type {Integer}
     */
    inputReportCount {
        get => NumGet(this, 112, "uint")
        set => NumPut("uint", value, this, 112)
    }

    /**
     * @type {Integer}
     */
    outputReportCount {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * @type {Integer}
     */
    featureReportCount {
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
    }

    /**
     * @type {Integer}
     */
    controllerAxisCount {
        get => NumGet(this, 124, "uint")
        set => NumPut("uint", value, this, 124)
    }

    /**
     * @type {Integer}
     */
    controllerButtonCount {
        get => NumGet(this, 128, "uint")
        set => NumPut("uint", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    controllerSwitchCount {
        get => NumGet(this, 132, "uint")
        set => NumPut("uint", value, this, 132)
    }

    /**
     * @type {Integer}
     */
    touchPointCount {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }

    /**
     * @type {Integer}
     */
    touchSensorCount {
        get => NumGet(this, 140, "uint")
        set => NumPut("uint", value, this, 140)
    }

    /**
     * @type {Integer}
     */
    forceFeedbackMotorCount {
        get => NumGet(this, 144, "uint")
        set => NumPut("uint", value, this, 144)
    }

    /**
     * @type {Integer}
     */
    hapticFeedbackMotorCount {
        get => NumGet(this, 148, "uint")
        set => NumPut("uint", value, this, 148)
    }

    /**
     * @type {Integer}
     */
    deviceStringCount {
        get => NumGet(this, 152, "uint")
        set => NumPut("uint", value, this, 152)
    }

    /**
     * @type {Integer}
     */
    deviceDescriptorSize {
        get => NumGet(this, 156, "uint")
        set => NumPut("uint", value, this, 156)
    }

    /**
     * @type {Pointer<GameInputRawDeviceReportInfo>}
     */
    inputReportInfo {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Pointer<GameInputRawDeviceReportInfo>}
     */
    outputReportInfo {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Pointer<GameInputRawDeviceReportInfo>}
     */
    featureReportInfo {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * @type {Pointer<GameInputControllerAxisInfo>}
     */
    controllerAxisInfo {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * @type {Pointer<GameInputControllerButtonInfo>}
     */
    controllerButtonInfo {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * @type {Pointer<GameInputControllerSwitchInfo>}
     */
    controllerSwitchInfo {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * @type {Pointer<GameInputKeyboardInfo>}
     */
    keyboardInfo {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * @type {Pointer<GameInputMouseInfo>}
     */
    mouseInfo {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * @type {Pointer<GameInputTouchSensorInfo>}
     */
    touchSensorInfo {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * @type {Pointer<GameInputMotionInfo>}
     */
    motionInfo {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * @type {Pointer<GameInputArcadeStickInfo>}
     */
    arcadeStickInfo {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * @type {Pointer<GameInputFlightStickInfo>}
     */
    flightStickInfo {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * @type {Pointer<GameInputGamepadInfo>}
     */
    gamepadInfo {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }

    /**
     * @type {Pointer<GameInputRacingWheelInfo>}
     */
    racingWheelInfo {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }

    /**
     * @type {Pointer<GameInputUiNavigationInfo>}
     */
    uiNavigationInfo {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * @type {Pointer<GameInputForceFeedbackMotorInfo>}
     */
    forceFeedbackMotorInfo {
        get => NumGet(this, 280, "ptr")
        set => NumPut("ptr", value, this, 280)
    }

    /**
     * @type {Pointer<GameInputHapticFeedbackMotorInfo>}
     */
    hapticFeedbackMotorInfo {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * @type {Pointer<GameInputString>}
     */
    displayName {
        get => NumGet(this, 296, "ptr")
        set => NumPut("ptr", value, this, 296)
    }

    /**
     * @type {Pointer<GameInputString>}
     */
    deviceStrings {
        get => NumGet(this, 304, "ptr")
        set => NumPut("ptr", value, this, 304)
    }

    /**
     * @type {Pointer<Void>}
     */
    deviceDescriptorData {
        get => NumGet(this, 312, "ptr")
        set => NumPut("ptr", value, this, 312)
    }

    /**
     * @type {Integer}
     */
    supportedSystemButtons {
        get => NumGet(this, 320, "int")
        set => NumPut("int", value, this, 320)
    }
}
