#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a value that specifies the type of the log data.
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_log_data
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_LOG_DATA extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_log_data_type">HTTP_LOG_DATA_TYPE</a> enumeration value that specifies the type.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
