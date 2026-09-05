#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 */
class JOBOBJECT_IO_ATTRIBUTION_CONTROL_FLAGS extends Win32Enum {

    /**
     * Native name: JOBOBJECT_IO_ATTRIBUTION_CONTROL_ENABLE
     * @type {Integer (Int32)}
     */
    static ENABLE => 1

    /**
     * Native name: JOBOBJECT_IO_ATTRIBUTION_CONTROL_DISABLE
     * @type {Integer (Int32)}
     */
    static DISABLE => 2

    /**
     * Native name: JOBOBJECT_IO_ATTRIBUTION_CONTROL_VALID_FLAGS
     * @type {Integer (Int32)}
     */
    static VALID_FLAGS => 3
}
