#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOBOBJECT_IO_ATTRIBUTION_CONTROL_FLAGS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static JOBOBJECT_IO_ATTRIBUTION_CONTROL_ENABLE => 1

    /**
     * @type {Integer (Int32)}
     */
    static JOBOBJECT_IO_ATTRIBUTION_CONTROL_DISABLE => 2

    /**
     * @type {Integer (Int32)}
     */
    static JOBOBJECT_IO_ATTRIBUTION_CONTROL_VALID_FLAGS => 3
}
