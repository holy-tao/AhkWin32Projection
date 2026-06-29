#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GameInputRawDeviceReportItemInfo.ahk" { GameInputRawDeviceReportItemInfo }
#Import ".\GameInputRawDeviceReportKind.ahk" { GameInputRawDeviceReportKind }

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
export default struct GameInputRawDeviceReportInfo {
    #StructPack 8

    kind : GameInputRawDeviceReportKind

    id : UInt32

    size : UInt32

    itemCount : UInt32

    items : GameInputRawDeviceReportItemInfo.Ptr

}
