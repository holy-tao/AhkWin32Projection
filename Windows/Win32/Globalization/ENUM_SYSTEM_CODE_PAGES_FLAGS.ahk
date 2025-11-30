#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 * @version v4.0.30319
 */
class ENUM_SYSTEM_CODE_PAGES_FLAGS extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CP_INSTALLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CP_SUPPORTED => 2
}
