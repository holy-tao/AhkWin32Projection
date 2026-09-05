#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
class TRACE_MESSAGE_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: TRACE_MESSAGE_COMPONENTID
     * @type {Integer (UInt32)}
     */
    static COMPONENTID => 4

    /**
     * Native name: TRACE_MESSAGE_GUID
     * @type {Integer (UInt32)}
     */
    static GUID => 2

    /**
     * Native name: TRACE_MESSAGE_SEQUENCE
     * @type {Integer (UInt32)}
     */
    static SEQUENCE => 1

    /**
     * Native name: TRACE_MESSAGE_SYSTEMINFO
     * @type {Integer (UInt32)}
     */
    static SYSTEMINFO => 32

    /**
     * Native name: TRACE_MESSAGE_TIMESTAMP
     * @type {Integer (UInt32)}
     */
    static TIMESTAMP => 8
}
