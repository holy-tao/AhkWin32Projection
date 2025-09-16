#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The WINHTTP_PROXY_SETTINGS_EX structure represents extended proxy settings.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_proxy_settings_ex
 * @namespace Windows.Win32.Networking.WinHttp
 * @version v4.0.30319
 */
class WINHTTP_PROXY_SETTINGS_EX extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: **[ULONGLONG](/windows/win32/winprog/windows-data-types)**
     * 
     * The current network generation (incremented each time the configuration is changed).
     * @type {Integer}
     */
    ullGenerationId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[ULONGLONG](/windows/win32/winprog/windows-data-types)**
     * 
     * Flags for the proxy settings (for example, **WINHTTP_PROXY_TYPE_DIRECT**).
     * @type {Integer}
     */
    ullFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * The PAC URL for the network (for example, L"http://proxy.contoso.com/wpad.dat").
     * @type {Pointer<PWSTR>}
     */
    pcwszAutoconfigUrl {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * The proxy address and port for HTTP traffic (for example, L"http://192.168.1.1:8888").
     * @type {Pointer<PWSTR>}
     */
    pcwszProxy {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * The proxy address and port for HTTPS traffic (for example, L"http://192.168.1.1:8888").
     * @type {Pointer<PWSTR>}
     */
    pcwszSecureProxy {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The number of entries in the proxy bypass list (*rgpcwszProxyBypasses*).
     * @type {Integer}
     */
    cProxyBypasses {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: **[PCWSTR](/windows/win32/winprog/windows-data-types)\***
     * 
     * An array of strings containing each site in the proxy bypass list. (for example, L"contoso.com").
     * @type {Pointer<PWSTR>}
     */
    rgpcwszProxyBypasses {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * The interface index for which settings were retrieved.
     * @type {Integer}
     */
    dwInterfaceIndex {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * The WCM connection name for which settings were retrieved.
     * @type {Pointer<PWSTR>}
     */
    pcwszConnectionName {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }
}
