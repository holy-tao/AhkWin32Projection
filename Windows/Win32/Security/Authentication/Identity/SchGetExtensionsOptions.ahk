#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
class SchGetExtensionsOptions extends Win32BitflagEnum {

    /**
     * Native name: SCH_EXTENSIONS_OPTIONS_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: SCH_NO_RECORD_HEADER
     * @type {Integer (Int32)}
     */
    static NO_RECORD_HEADER => 1
}
