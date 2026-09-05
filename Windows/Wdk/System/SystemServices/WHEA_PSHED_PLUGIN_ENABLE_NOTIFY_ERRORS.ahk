#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_PSHED_PLUGIN_ENABLE_NOTIFY_ERRORS extends Win32Enum {

    /**
     * Native name: PshedPiEnableNotifyErrorCreateNotifyEvent
     * @type {Integer (Int32)}
     */
    static PiEnableNotifyErrorCreateNotifyEvent => 1

    /**
     * Native name: PshedPiEnableNotifyErrorCreateSystemThread
     * @type {Integer (Int32)}
     */
    static PiEnableNotifyErrorCreateSystemThread => 2

    /**
     * Native name: PshedPiEnableNotifyErrorMax
     * @type {Integer (Int32)}
     */
    static PiEnableNotifyErrorMax => 3
}
