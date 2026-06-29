#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HTTP_DELEGATE_REQUEST_PROPERTY_ID.ahk" { HTTP_DELEGATE_REQUEST_PROPERTY_ID }

/**
 * Describes additional property information when delegating a request.
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-http_delegate_request_property_info
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTP_DELEGATE_REQUEST_PROPERTY_INFO {
    #StructPack 8

    /**
     * Type: **[HTTP_DELEGATE_REQUEST_PROPERTY_ID](./ne-http-http_delegate_request_property_id.md)**
     * 
     * The type of property info pointed to by this struct.
     */
    PropertyId : HTTP_DELEGATE_REQUEST_PROPERTY_ID

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * The length in bytes of the value of the *PropertyInfo* parameter.
     */
    PropertyInfoLength : UInt32

    /**
     * Type: **[PVOID](/windows/win32/winprog/windows-data-types)**
     * 
     * A pointer to the property information.
     */
    PropertyInfo : IntPtr

}
