#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class TRACE_MESSAGE_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_MESSAGE_COMPONENTID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_MESSAGE_GUID => 2

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_MESSAGE_SEQUENCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_MESSAGE_SYSTEMINFO => 32

    /**
     * @type {Integer (UInt32)}
     */
    static TRACE_MESSAGE_TIMESTAMP => 8
}
