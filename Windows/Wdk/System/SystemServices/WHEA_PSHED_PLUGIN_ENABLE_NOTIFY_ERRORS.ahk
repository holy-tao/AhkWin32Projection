#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_PSHED_PLUGIN_ENABLE_NOTIFY_ERRORS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static PshedPiEnableNotifyErrorCreateNotifyEvent => 1

    /**
     * @type {Integer (Int32)}
     */
    static PshedPiEnableNotifyErrorCreateSystemThread => 2

    /**
     * @type {Integer (Int32)}
     */
    static PshedPiEnableNotifyErrorMax => 3
}
