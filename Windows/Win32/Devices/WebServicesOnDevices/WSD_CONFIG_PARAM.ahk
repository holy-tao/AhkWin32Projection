#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents configuration parameters for creating WSDAPI objects.
 * @see https://learn.microsoft.com/windows/win32/api/wsdbase/ns-wsdbase-wsd_config_param
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 * @version v4.0.30319
 */
class WSD_CONFIG_PARAM extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/wsdbase/ne-wsdbase-wsd_config_param_type">WSD_CONFIG_PARAM_TYPE</a> value that indicates the type configuration data contained in this structure.
     * @type {Integer}
     */
    configParamType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A pointer to a single configuration data structure.   The <i>configParamType</i> member specifies the type of data passed in.
     * @type {Pointer<Void>}
     */
    pConfigData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size of the configuration data in <i>pConfigData</i>.
     * @type {Integer}
     */
    dwConfigDataSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
