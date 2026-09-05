#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
class IEObjectType extends Win32Enum {

    /**
     * Native name: IE_EPM_OBJECT_EVENT
     * @type {Integer (Int32)}
     */
    static EPM_OBJECT_EVENT => 0

    /**
     * Native name: IE_EPM_OBJECT_MUTEX
     * @type {Integer (Int32)}
     */
    static EPM_OBJECT_MUTEX => 1

    /**
     * Native name: IE_EPM_OBJECT_SEMAPHORE
     * @type {Integer (Int32)}
     */
    static EPM_OBJECT_SEMAPHORE => 2

    /**
     * Native name: IE_EPM_OBJECT_SHARED_MEMORY
     * @type {Integer (Int32)}
     */
    static EPM_OBJECT_SHARED_MEMORY => 3

    /**
     * Native name: IE_EPM_OBJECT_WAITABLE_TIMER
     * @type {Integer (Int32)}
     */
    static EPM_OBJECT_WAITABLE_TIMER => 4

    /**
     * Native name: IE_EPM_OBJECT_FILE
     * @type {Integer (Int32)}
     */
    static EPM_OBJECT_FILE => 5

    /**
     * Native name: IE_EPM_OBJECT_NAMED_PIPE
     * @type {Integer (Int32)}
     */
    static EPM_OBJECT_NAMED_PIPE => 6

    /**
     * Native name: IE_EPM_OBJECT_REGISTRY
     * @type {Integer (Int32)}
     */
    static EPM_OBJECT_REGISTRY => 7
}
