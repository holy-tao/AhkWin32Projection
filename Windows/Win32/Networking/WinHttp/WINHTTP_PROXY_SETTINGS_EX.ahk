#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * The WINHTTP_PROXY_SETTINGS_EX structure represents extended proxy settings.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_proxy_settings_ex
 * @namespace Windows.Win32.Networking.WinHttp
 * @architecture X64, Arm64
 */
export default struct WINHTTP_PROXY_SETTINGS_EX {
    #StructPack 8

    /**
     * Type: **[ULONGLONG](/windows/win32/winprog/windows-data-types)**
     * 
     * The current network generation (incremented each time the configuration is changed).
     */
    ullGenerationId : Int64

    /**
     * Type: **[ULONGLONG](/windows/win32/winprog/windows-data-types)**
     * 
     * Flags for the proxy settings (for example, **WINHTTP_PROXY_TYPE_DIRECT**).
     */
    ullFlags : Int64

    /**
     * Type: **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * The PAC URL for the network (for example, L"http://proxy.contoso.com/wpad.dat").
     */
    pcwszAutoconfigUrl : PWSTR

    /**
     * Type: **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * The proxy address and port for HTTP traffic (for example, L"http://192.168.1.1:8888").
     */
    pcwszProxy : PWSTR

    /**
     * Type: **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * The proxy address and port for HTTPS traffic (for example, L"http://192.168.1.1:8888").
     */
    pcwszSecureProxy : PWSTR

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of entries in the proxy bypass list (*rgpcwszProxyBypasses*).
     */
    cProxyBypasses : UInt32

    /**
     * Type: **[PCWSTR](/windows/win32/winprog/windows-data-types)\***
     * 
     * An array of strings containing each site in the proxy bypass list. (for example, L"contoso.com").
     */
    rgpcwszProxyBypasses : PWSTR.Ptr

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The interface index for which settings were retrieved.
     */
    dwInterfaceIndex : UInt32

    /**
     * Type: **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * The WCM connection name for which settings were retrieved.
     */
    pcwszConnectionName : PWSTR

}
