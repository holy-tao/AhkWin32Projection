#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\MPRAPI_OBJECT_HEADER.ahk
#Include ..\..\Security\Cryptography\CRYPT_INTEGER_BLOB.ahk
#Include .\ROUTER_IKEv2_IF_CUSTOM_CONFIG0.ahk

/**
 * Gets or sets tunnel specific custom configuration for a demand dial interfaces.
 * @see https://learn.microsoft.com/windows/win32/api/mprapi/ns-mprapi-mpr_if_custominfoex0
 * @namespace Windows.Win32.NetworkManagement.Rras
 * @version v4.0.30319
 */
class MPR_IF_CUSTOMINFOEX0 extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-mprapi_object_header">MPRAPI_OBJECT_HEADER</a> structure that specifies the version of the <b>MPR_IF_CUSTOMINFOEX0</b> structure.
     * @type {MPRAPI_OBJECT_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := MPRAPI_OBJECT_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * A value that specifies the tunnel type for which the custom configuration is available. The following values are supported.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>0x0</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * No custom configuration available.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="MPRAPI_IF_CUSTOM_CONFIG_FOR_IKEV2_"></a><a id="mprapi_if_custom_config_for_ikev2_"></a><dl>
     * <dt><b>MPRAPI_IF_CUSTOM_CONFIG_FOR_IKEV2 </b></dt>
     * <dt>0x1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * IKEv2 tunnel specific configuration is available.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/mprapi/ns-mprapi-router_ikev2_if_custom_config0">ROUTER_IKEv2_IF_CUSTOM_CONFIG0</a> structure that specifies the IKEv2 tunnel configuration parameters.
     * @type {ROUTER_IKEv2_IF_CUSTOM_CONFIG0}
     */
    customIkev2Config{
        get {
            if(!this.HasProp("__customIkev2Config"))
                this.__customIkev2Config := ROUTER_IKEv2_IF_CUSTOM_CONFIG0(this.ptr + 8)
            return this.__customIkev2Config
        }
    }
}
