#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.JobObjects
 * @version v4.0.30319
 */
class JOB_OBJECT_TERMINATE_AT_END_ACTION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_TERMINATE_AT_END_OF_JOB => 0

    /**
     * @type {Integer (UInt32)}
     */
    static JOB_OBJECT_POST_AT_END_OF_JOB => 1
}
