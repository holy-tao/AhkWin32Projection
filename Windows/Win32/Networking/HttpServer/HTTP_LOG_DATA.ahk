#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_LOG_DATA_TYPE.ahk" { HTTP_LOG_DATA_TYPE }

/**
 * Contains a value that specifies the type of the log data.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_log_data
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_LOG_DATA {
    #StructPack 4

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/http/ne-http-http_log_data_type">HTTP_LOG_DATA_TYPE</a> enumeration value that specifies the type.
     */
    Type : HTTP_LOG_DATA_TYPE

}
