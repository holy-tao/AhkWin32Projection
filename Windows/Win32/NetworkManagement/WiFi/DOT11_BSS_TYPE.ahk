#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/NativeWiFi/dot11-bss-type
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11_BSS_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static dot11_BSS_type_infrastructure => 1

    /**
     * @type {Integer (Int32)}
     */
    static dot11_BSS_type_independent => 2

    /**
     * @type {Integer (Int32)}
     */
    static dot11_BSS_type_any => 3
}
