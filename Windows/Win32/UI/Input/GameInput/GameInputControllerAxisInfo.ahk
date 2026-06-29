#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputKind.ahk" { GameInputKind }
#Import ".\GameInputRawDeviceReportItemInfo.ahk" { GameInputRawDeviceReportItemInfo }
#Import ".\GameInputRawDeviceReportInfo.ahk" { GameInputRawDeviceReportInfo }
#Import ".\GameInputLabel.ahk" { GameInputLabel }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputControllerAxisInfo {
    #StructPack 8

    mappedInputKinds : GameInputKind

    label : GameInputLabel

    isContinuous : Int8

    isNonlinear : Int8

    isQuantized : Int8

    hasRestValue : Int8

    restValue : Float32

    resolution : Int64

    legacyDInputIndex : UInt16

    legacyHidIndex : UInt16

    rawReportIndex : UInt32

    inputReport : GameInputRawDeviceReportInfo.Ptr

    inputReportItem : GameInputRawDeviceReportItemInfo.Ptr

}
