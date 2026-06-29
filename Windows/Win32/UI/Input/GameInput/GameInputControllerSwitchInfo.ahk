#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputSwitchKind.ahk" { GameInputSwitchKind }
#Import ".\GameInputKind.ahk" { GameInputKind }
#Import ".\GameInputRawDeviceReportItemInfo.ahk" { GameInputRawDeviceReportItemInfo }
#Import ".\GameInputRawDeviceReportInfo.ahk" { GameInputRawDeviceReportInfo }
#Import ".\GameInputLabel.ahk" { GameInputLabel }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputControllerSwitchInfo {
    #StructPack 8

    mappedInputKinds : GameInputKind

    label : GameInputLabel

    positionLabels : GameInputLabel[9]

    kind : GameInputSwitchKind

    legacyDInputIndex : UInt16

    legacyHidIndex : UInt16

    rawReportIndex : UInt32

    inputReport : GameInputRawDeviceReportInfo.Ptr

    inputReportItem : GameInputRawDeviceReportItemInfo.Ptr

}
