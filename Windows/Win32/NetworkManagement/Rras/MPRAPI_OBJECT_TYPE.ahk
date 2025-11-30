#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the structure type in a MPRAPI_OBJECT_HEADER structure.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ne-mprapi-mprapi_object_type
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPRAPI_OBJECT_TYPE extends Win32Enum{

    /**
     * The structure is a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_ex">RAS_CONNECTION_EX</a> structure.
     * @type {Integer (Int32)}
     */
    static MPRAPI_OBJECT_TYPE_RAS_CONNECTION_OBJECT => 1

    /**
     * The structure is a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_ex0">MPR_SERVER_EX</a> structure.
     * @type {Integer (Int32)}
     */
    static MPRAPI_OBJECT_TYPE_MPR_SERVER_OBJECT => 2

    /**
     * The structure is a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_set_config_ex0">MPR_SERVER_SET_CONFIG_EX</a> structure.
     * @type {Integer (Int32)}
     */
    static MPRAPI_OBJECT_TYPE_MPR_SERVER_SET_CONFIG_OBJECT => 3

    /**
     * The structure is a <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-auth_validation_ex">AUTH_VALIDATION_EX</a> structure.
     * @type {Integer (Int32)}
     */
    static MPRAPI_OBJECT_TYPE_AUTH_VALIDATION_OBJECT => 4

    /**
     * The structure is a [RAS_UPDATE_CONNECTION](/windows/desktop/api/mprapi/ns-mprapi-ras_update_connection) structure.
     * @type {Integer (Int32)}
     */
    static MPRAPI_OBJECT_TYPE_UPDATE_CONNECTION_OBJECT => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MPRAPI_OBJECT_TYPE_IF_CUSTOM_CONFIG_OBJECT => 6
}
