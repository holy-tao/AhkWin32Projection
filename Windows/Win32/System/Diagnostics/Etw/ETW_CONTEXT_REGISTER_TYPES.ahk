#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class ETW_CONTEXT_REGISTER_TYPES extends Win32BitflagEnum {

    /**
     * Native name: EtwContextRegisterTypeNone
     * @type {Integer (Int32)}
     */
    static TypeNone => 0

    /**
     * Native name: EtwContextRegisterTypeControl
     * @type {Integer (Int32)}
     */
    static TypeControl => 1

    /**
     * Native name: EtwContextRegisterTypeInteger
     * @type {Integer (Int32)}
     */
    static TypeInteger => 2
}
