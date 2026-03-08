#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Documentation varies per use. Refer to each: <see href="https://learn.microsoft.com/windows/win32/api/minidumpapiset/ns-minidumpapiset-minidump_system_info">MINIDUMP_SYSTEM_INFO</see>, <see href="https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_altplatform_info_v1">SP_ALTPLATFORM_INFO_V1</see>, <see href="https://learn.microsoft.com/windows/win32/api/setupapi/ns-setupapi-sp_altplatform_info_v2">SP_ALTPLATFORM_INFO_V2</see>.
 * @see 
 * @namespace Windows.Win32.System.Diagnostics.Debug
 * @version v4.0.30319
 */
class VER_PLATFORM extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static VER_PLATFORM_WIN32s => 0

    /**
     * @type {Integer (UInt32)}
     */
    static VER_PLATFORM_WIN32_WINDOWS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VER_PLATFORM_WIN32_NT => 2
}
