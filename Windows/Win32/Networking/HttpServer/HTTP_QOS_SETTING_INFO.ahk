#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a QOS setting.
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_qos_setting_info
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_QOS_SETTING_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_qos_setting_type">HTTP_QOS_SETTING_TYPE</a> enumeration value that specifies the type of the QOS setting.
     * @type {Integer}
     */
    QosType {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * A pointer to a structure that contains the setting.
     * @type {Pointer<Void>}
     */
    QosSetting {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
