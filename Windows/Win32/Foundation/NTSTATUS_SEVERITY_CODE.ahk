#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Foundation
 * @version v4.0.30319
 */
class NTSTATUS_SEVERITY_CODE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static STATUS_SEVERITY_SUCCESS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static STATUS_SEVERITY_INFORMATIONAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static STATUS_SEVERITY_WARNING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static STATUS_SEVERITY_ERROR => 3
}
