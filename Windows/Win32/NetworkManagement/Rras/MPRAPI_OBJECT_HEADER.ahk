#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the structure version for the RAS_CONNECTION_EX, MPR_SERVER_EX, MPR_SERVER_SET_CONFIG_EX, RAS_UPDATE_CONNECTION, AUTH_VALIDATION_EX structures, and the structure version used by the MprAdminConnectionEnumEx method.
 * @see https://docs.microsoft.com/windows/win32/api//mprapi/ns-mprapi-mprapi_object_header
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPRAPI_OBJECT_HEADER extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * A value that represents the version of the structure specified by <b>type</b>. Possible values are:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRAPI_RAS_CONNECTION_OBJECT_REVISION_1"></a><a id="mprapi_ras_connection_object_revision_1"></a><dl>
     * <dt><b>MPRAPI_RAS_CONNECTION_OBJECT_REVISION_1</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Represents version 1 of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-ras_connection_ex">RAS_CONNECTION_EX</a> structure if <b>type</b> is <b>MPRAPI_OBJECT_TYPE_RAS_CONNECTION_OBJECT</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRAPI_MPR_SERVER_OBJECT_REVISION_1"></a><a id="mprapi_mpr_server_object_revision_1"></a><dl>
     * <dt><b>MPRAPI_MPR_SERVER_OBJECT_REVISION_1</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Represents version 1 of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_ex0">MPR_SERVER_EX</a> structure if <b>type</b> is <b>MPRAPI_OBJECT_TYPE_MPR_SERVER_OBJECT</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_1"></a><a id="mprapi_mpr_server_set_config_object_revision_1"></a><dl>
     * <dt><b>MPRAPI_MPR_SERVER_SET_CONFIG_OBJECT_REVISION_1</b></dt>
     * <dt>0x01</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Represents version 1 of the <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mpr_server_set_config_ex0">MPR_SERVER_SET_CONFIG_EX</a> structure if <b>type</b> is <b>MPRAPI_OBJECT_TYPE_MPR_SERVER_SET_CONFIG_OBJECT</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    revision {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    type {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }

    /**
     * 
     * @type {Integer}
     */
    size {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
