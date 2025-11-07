#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes additional property information when delegating a request.
 * @remarks
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-http_delegate_request_property_info
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_DELEGATE_REQUEST_PROPERTY_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: **[HTTP_DELEGATE_REQUEST_PROPERTY_ID](./ne-http-http_delegate_request_property_id.md)**
     * 
     * The type of property info pointed to by this struct.
     * @type {Integer}
     */
    PropertyId {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: **[ULONG](/windows/win32/winprog/windows-data-types)**
     * 
     * The length in bytes of the value of the *PropertyInfo* parameter.
     * @type {Integer}
     */
    PropertyInfoLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: **[PVOID](/windows/win32/winprog/windows-data-types)**
     * 
     * A pointer to the property information.
     * @type {Pointer<Void>}
     */
    PropertyInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
