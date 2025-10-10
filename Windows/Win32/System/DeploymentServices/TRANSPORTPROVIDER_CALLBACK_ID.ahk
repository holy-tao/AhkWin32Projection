#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class TRANSPORTPROVIDER_CALLBACK_ID{

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_CREATE_INSTANCE => 0

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_COMPARE_CONTENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_OPEN_CONTENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_USER_ACCESS_CHECK => 3

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_GET_CONTENT_SIZE => 4

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_READ_CONTENT => 5

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_CLOSE_CONTENT => 6

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_CLOSE_INSTANCE => 7

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_SHUTDOWN => 8

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_DUMP_STATE => 9

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_REFRESH_SETTINGS => 10

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_GET_CONTENT_METADATA => 11

    /**
     * @type {Integer (Int32)}
     */
    static WDS_TRANSPORTPROVIDER_MAX_CALLBACKS => 12
}
