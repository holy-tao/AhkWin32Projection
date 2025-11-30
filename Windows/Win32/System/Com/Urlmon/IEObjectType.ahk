#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class IEObjectType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static IE_EPM_OBJECT_EVENT => 0

    /**
     * @type {Integer (Int32)}
     */
    static IE_EPM_OBJECT_MUTEX => 1

    /**
     * @type {Integer (Int32)}
     */
    static IE_EPM_OBJECT_SEMAPHORE => 2

    /**
     * @type {Integer (Int32)}
     */
    static IE_EPM_OBJECT_SHARED_MEMORY => 3

    /**
     * @type {Integer (Int32)}
     */
    static IE_EPM_OBJECT_WAITABLE_TIMER => 4

    /**
     * @type {Integer (Int32)}
     */
    static IE_EPM_OBJECT_FILE => 5

    /**
     * @type {Integer (Int32)}
     */
    static IE_EPM_OBJECT_NAMED_PIPE => 6

    /**
     * @type {Integer (Int32)}
     */
    static IE_EPM_OBJECT_REGISTRY => 7
}
