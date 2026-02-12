#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Documentation varies per use. Refer to each: <see href="https://learn.microsoft.com/windows/win32/api//content/winsvc/nf-winsvc-changeserviceconfiga">ChangeServiceConfig</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winsvc/nf-winsvc-changeserviceconfigw">ChangeServiceConfig</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winsvc/nf-winsvc-changeserviceconfiga">ChangeServiceConfigA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winsvc/nf-winsvc-changeserviceconfigw">ChangeServiceConfigA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winsvc/nf-winsvc-changeserviceconfiga">ChangeServiceConfigW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winsvc/nf-winsvc-changeserviceconfigw">ChangeServiceConfigW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winsvc/nf-winsvc-createservicea">CreateService</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winsvc/nf-winsvc-createservicew">CreateService</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winsvc/nf-winsvc-createservicea">CreateServiceA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winsvc/nf-winsvc-createservicew">CreateServiceA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winsvc/nf-winsvc-createservicea">CreateServiceW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winsvc/nf-winsvc-createservicew">CreateServiceW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winsvc/ns-winsvc-query_service_configa">QUERY_SERVICE_CONFIG</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winsvc/ns-winsvc-query_service_configw">QUERY_SERVICE_CONFIG</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winsvc/ns-winsvc-query_service_configa">QUERY_SERVICE_CONFIGA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winsvc/ns-winsvc-query_service_configw">QUERY_SERVICE_CONFIGA</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winsvc/ns-winsvc-query_service_configa">QUERY_SERVICE_CONFIGW</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/winsvc/ns-winsvc-query_service_configw">QUERY_SERVICE_CONFIGW</see>.
 * @see 
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class SERVICE_ERROR extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ERROR_CRITICAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ERROR_IGNORE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ERROR_NORMAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ERROR_SEVERE => 2
}
