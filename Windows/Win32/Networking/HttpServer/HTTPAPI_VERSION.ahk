#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the version of the HTTP Server API.
 * @remarks
 * 
 * Constants that represents the version of the API  are pre-defined in the Http.h header file as follows:
 * 
 * "#define HTTPAPI_VERSION_1 {1, 0}"
 * 
 * "#define HTTPAPI_VERSION_2 {2, 0}"
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//http/ns-http-httpapi_version
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTPAPI_VERSION extends Win32Struct
{
    static sizeof => 4

    static packingSize => 2

    /**
     * Major version of the HTTP Server API.
     * @type {Integer}
     */
    HttpApiMajorVersion {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Minor version of the HTTP Server API.
     * @type {Integer}
     */
    HttpApiMinorVersion {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }
}
