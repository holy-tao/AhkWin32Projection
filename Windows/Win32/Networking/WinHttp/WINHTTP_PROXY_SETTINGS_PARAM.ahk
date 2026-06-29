#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * The WINHTTP_PROXY_SETTINGS_PARAM structure represents extended proxy settings.
 * @see https://learn.microsoft.com/windows/win32/api/winhttp/ns-winhttp-winhttp_proxy_settings_param
 * @namespace Windows.Win32.Networking.WinHttp
 * @architecture X64, Arm64
 */
class WINHTTP_PROXY_SETTINGS_PARAM extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **[ULONGLONG](/windows/win32/winprog/windows-data-types)**
     * 
     * Flags.
     * @type {Integer}
     */
    ullFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * The WCM connection name for which settings were retrieved.
     * @type {PWSTR}
     */
    pcwszConnectionName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **[PCWSTR](/windows/win32/winprog/windows-data-types)**
     * 
     * TBD
     * @type {PWSTR}
     */
    pcwszProbeHost {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
