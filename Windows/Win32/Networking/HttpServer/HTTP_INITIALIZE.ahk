#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Documentation varies per use. Refer to each: <see href="https://learn.microsoft.com/windows/win32/api/http/nf-http-httpinitialize">HttpInitialize</see>, <see href="https://learn.microsoft.com/windows/win32/api/http/nf-http-httpterminate">HttpTerminate</see>.
 * @see 
 * @namespace Windows.Win32.Networking.HttpServer
 * @version v4.0.30319
 */
class HTTP_INITIALIZE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_INITIALIZE_CONFIG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static HTTP_INITIALIZE_SERVER => 1
}
