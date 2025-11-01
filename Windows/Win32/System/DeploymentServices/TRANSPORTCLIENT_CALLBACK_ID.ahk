#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wdstci/ne-wdstci-transportclient_callback_id
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class TRANSPORTCLIENT_CALLBACK_ID{

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTCLIENT_SESSION_START => 0

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTCLIENT_RECEIVE_CONTENTS => 1

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTCLIENT_SESSION_COMPLETE => 2

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTCLIENT_RECEIVE_METADATA => 3

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTCLIENT_SESSION_STARTEX => 4

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTCLIENT_SESSION_NEGOTIATE => 5

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTCLIENT_MAX_CALLBACKS => 6
}
