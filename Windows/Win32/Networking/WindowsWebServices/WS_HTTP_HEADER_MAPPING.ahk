#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WS_XML_STRING.ahk

/**
 * Specifies an individual header that is mapped as part of WS_HTTP_MESSAGE_MAPPING.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ns-webservices-ws_http_header_mapping
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_HTTP_HEADER_MAPPING extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The name of the HTTP header.
     * @type {WS_XML_STRING}
     */
    headerName{
        get {
            if(!this.HasProp("__headerName"))
                this.__headerName := WS_XML_STRING(this.ptr + 0)
            return this.__headerName
        }
    }

    /**
     * A set of flags that control how headers are mapped.  
     *                     See <a href="https://docs.microsoft.com/windows/win32/api/webservices/ne-webservices-ws_xml_canonicalization_algorithm">WS_HTTP_HEADER_MAPPING_OPTIONS</a> for more information.
     * @type {Integer}
     */
    headerMappingOptions {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
