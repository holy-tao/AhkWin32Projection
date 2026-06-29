#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the version of the HTTP Server API.
 * @remarks
 * Constants that represents the version of the API  are pre-defined in the Http.h header file as follows:
 * 
 * "#define HTTPAPI_VERSION_1 {1, 0}"
 * 
 * "#define HTTPAPI_VERSION_2 {2, 0}"
 * @see https://learn.microsoft.com/windows/win32/api/http/ns-http-httpapi_version
 * @namespace Windows.Win32.Networking.HttpServer
 */
export default struct HTTPAPI_VERSION {
    #StructPack 2

    /**
     * Major version of the HTTP Server API.
     */
    HttpApiMajorVersion : UInt16

    /**
     * Minor version of the HTTP Server API.
     */
    HttpApiMinorVersion : UInt16

}
