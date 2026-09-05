#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputRawDeviceReportKind extends Win32Enum {

    /**
     * Native name: GameInputRawInputReport
     * @type {Integer (Int32)}
     */
    static InputReport => 0

    /**
     * Native name: GameInputRawOutputReport
     * @type {Integer (Int32)}
     */
    static OutputReport => 1

    /**
     * Native name: GameInputRawFeatureReport
     * @type {Integer (Int32)}
     */
    static FeatureReport => 2
}
