#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DeploymentServices
 */
class PFN_WDS_CLI_CALLBACK_MESSAGE_ID extends Win32Enum {

    /**
     * Native name: WDS_CLI_MSG_START
     * @type {Integer (UInt32)}
     */
    static MSG_START => 0

    /**
     * Native name: WDS_CLI_MSG_COMPLETE
     * @type {Integer (UInt32)}
     */
    static MSG_COMPLETE => 1

    /**
     * Native name: WDS_CLI_MSG_PROGRESS
     * @type {Integer (UInt32)}
     */
    static MSG_PROGRESS => 2

    /**
     * Native name: WDS_CLI_MSG_TEXT
     * @type {Integer (UInt32)}
     */
    static MSG_TEXT => 3
}
