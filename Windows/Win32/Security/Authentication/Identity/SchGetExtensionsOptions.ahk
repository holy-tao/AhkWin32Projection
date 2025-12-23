#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 * @version v4.0.30319
 */
class SchGetExtensionsOptions extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static SCH_EXTENSIONS_OPTIONS_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static SCH_NO_RECORD_HEADER => 1
}
