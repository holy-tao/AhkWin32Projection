#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_QOS_SETTING_TYPE.ahk" { HTTP_QOS_SETTING_TYPE }

/**
 * Contains information about a QOS setting.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_qos_setting_info
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_QOS_SETTING_INFO {
    #StructPack 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_qos_setting_type">HTTP_QOS_SETTING_TYPE</a> enumeration value that specifies the type of the QOS setting.
     */
    QosType : HTTP_QOS_SETTING_TYPE

    /**
     * A pointer to a structure that contains the setting.
     */
    QosSetting : IntPtr

}
