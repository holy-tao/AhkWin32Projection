#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputKind.ahk" { GameInputKind }
#Import ".\GameInputRawDeviceReportItemInfo.ahk" { GameInputRawDeviceReportItemInfo }
#Import ".\GameInputRawDeviceReportInfo.ahk" { GameInputRawDeviceReportInfo }
#Import ".\GameInputLabel.ahk" { GameInputLabel }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputControllerButtonInfo {
    #StructPack 8

    mappedInputKinds : GameInputKind

    label : GameInputLabel

    legacyDInputIndex : UInt16

    legacyHidIndex : UInt16

    rawReportIndex : UInt32

    inputReport : GameInputRawDeviceReportInfo.Ptr

    inputReportItem : GameInputRawDeviceReportItemInfo.Ptr

}
