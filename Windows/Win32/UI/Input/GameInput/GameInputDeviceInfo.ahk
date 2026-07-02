#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputVersion.ahk" { GameInputVersion }
#Import ".\GameInputKeyboardInfo.ahk" { GameInputKeyboardInfo }
#Import ".\GameInputHapticFeedbackMotorInfo.ahk" { GameInputHapticFeedbackMotorInfo }
#Import ".\GameInputUsage.ahk" { GameInputUsage }
#Import "..\..\..\Foundation\APP_LOCAL_DEVICE_ID.ahk" { APP_LOCAL_DEVICE_ID }
#Import ".\GameInputMotionInfo.ahk" { GameInputMotionInfo }
#Import ".\GameInputTouchSensorInfo.ahk" { GameInputTouchSensorInfo }
#Import ".\GameInputRacingWheelInfo.ahk" { GameInputRacingWheelInfo }
#Import ".\GameInputControllerButtonInfo.ahk" { GameInputControllerButtonInfo }
#Import ".\GameInputArcadeStickInfo.ahk" { GameInputArcadeStickInfo }
#Import ".\GameInputGamepadInfo.ahk" { GameInputGamepadInfo }
#Import ".\GameInputDeviceCapabilities.ahk" { GameInputDeviceCapabilities }
#Import ".\GameInputForceFeedbackMotorInfo.ahk" { GameInputForceFeedbackMotorInfo }
#Import ".\GameInputDeviceFamily.ahk" { GameInputDeviceFamily }
#Import ".\GameInputMouseInfo.ahk" { GameInputMouseInfo }
#Import ".\GameInputControllerSwitchInfo.ahk" { GameInputControllerSwitchInfo }
#Import ".\GameInputSystemButtons.ahk" { GameInputSystemButtons }
#Import ".\GameInputRawDeviceReportInfo.ahk" { GameInputRawDeviceReportInfo }
#Import ".\GameInputControllerAxisInfo.ahk" { GameInputControllerAxisInfo }
#Import ".\GameInputKind.ahk" { GameInputKind }
#Import ".\GameInputRumbleMotors.ahk" { GameInputRumbleMotors }
#Import ".\GameInputString.ahk" { GameInputString }
#Import ".\GameInputUiNavigationInfo.ahk" { GameInputUiNavigationInfo }
#Import ".\GameInputFlightStickInfo.ahk" { GameInputFlightStickInfo }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputDeviceInfo {
    #StructPack 8

    infoSize : UInt32

    vendorId : UInt16

    productId : UInt16

    revisionNumber : UInt16

    interfaceNumber : Int8

    collectionNumber : Int8

    usage : GameInputUsage

    hardwareVersion : GameInputVersion

    firmwareVersion : GameInputVersion

    deviceId : APP_LOCAL_DEVICE_ID

    deviceRootId : APP_LOCAL_DEVICE_ID

    deviceFamily : GameInputDeviceFamily

    capabilities : GameInputDeviceCapabilities

    supportedInput : GameInputKind

    supportedRumbleMotors : GameInputRumbleMotors

    inputReportCount : UInt32

    outputReportCount : UInt32

    featureReportCount : UInt32

    controllerAxisCount : UInt32

    controllerButtonCount : UInt32

    controllerSwitchCount : UInt32

    touchPointCount : UInt32

    touchSensorCount : UInt32

    forceFeedbackMotorCount : UInt32

    hapticFeedbackMotorCount : UInt32

    deviceStringCount : UInt32

    deviceDescriptorSize : UInt32

    inputReportInfo : GameInputRawDeviceReportInfo.Ptr

    outputReportInfo : GameInputRawDeviceReportInfo.Ptr

    featureReportInfo : GameInputRawDeviceReportInfo.Ptr

    controllerAxisInfo : GameInputControllerAxisInfo.Ptr

    controllerButtonInfo : GameInputControllerButtonInfo.Ptr

    controllerSwitchInfo : GameInputControllerSwitchInfo.Ptr

    keyboardInfo : GameInputKeyboardInfo.Ptr

    mouseInfo : GameInputMouseInfo.Ptr

    touchSensorInfo : GameInputTouchSensorInfo.Ptr

    motionInfo : GameInputMotionInfo.Ptr

    arcadeStickInfo : GameInputArcadeStickInfo.Ptr

    flightStickInfo : GameInputFlightStickInfo.Ptr

    gamepadInfo : GameInputGamepadInfo.Ptr

    racingWheelInfo : GameInputRacingWheelInfo.Ptr

    uiNavigationInfo : GameInputUiNavigationInfo.Ptr

    forceFeedbackMotorInfo : GameInputForceFeedbackMotorInfo.Ptr

    hapticFeedbackMotorInfo : GameInputHapticFeedbackMotorInfo.Ptr

    displayName : GameInputString.Ptr

    deviceStrings : GameInputString.Ptr

    deviceDescriptorData : IntPtr

    supportedSystemButtons : GameInputSystemButtons

}
