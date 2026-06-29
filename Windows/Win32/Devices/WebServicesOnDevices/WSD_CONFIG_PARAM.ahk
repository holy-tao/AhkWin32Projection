#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\WSD_CONFIG_PARAM_TYPE.ahk" { WSD_CONFIG_PARAM_TYPE }

/**
 * Represents configuration parameters for creating WSDAPI objects.
 * @see https://learn.microsoft.com/windows/win32/api/wsdbase/ns-wsdbase-wsd_config_param
 * @namespace Windows.Win32.Devices.WebServicesOnDevices
 */
export default struct WSD_CONFIG_PARAM {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/wsdbase/ne-wsdbase-wsd_config_param_type">WSD_CONFIG_PARAM_TYPE</a> value that indicates the type configuration data contained in this structure.
     */
    configParamType : WSD_CONFIG_PARAM_TYPE

    /**
     * A pointer to a single configuration data structure.   The <i>configParamType</i> member specifies the type of data passed in.
     */
    pConfigData : IntPtr

    /**
     * The size of the configuration data in <i>pConfigData</i>.
     */
    dwConfigDataSize : UInt32

}
