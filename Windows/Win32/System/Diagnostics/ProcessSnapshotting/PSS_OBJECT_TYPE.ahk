#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the object type in a PSS_HANDLE_ENTRY structure.
 * @see https://learn.microsoft.com/windows/win32/api/processsnapshot/ne-processsnapshot-pss_object_type
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 */
class PSS_OBJECT_TYPE extends Win32Enum {

    /**
     * The object type is either unknown or unsupported.
     * Native name: PSS_OBJECT_TYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * The object is a process.
     * Native name: PSS_OBJECT_TYPE_PROCESS
     * @type {Integer (Int32)}
     */
    static PROCESS => 1

    /**
     * The object is a thread.
     * Native name: PSS_OBJECT_TYPE_THREAD
     * @type {Integer (Int32)}
     */
    static THREAD => 2

    /**
     * The object is a mutant/mutex.
     * Native name: PSS_OBJECT_TYPE_MUTANT
     * @type {Integer (Int32)}
     */
    static MUTANT => 3

    /**
     * The object is an event.
     * Native name: PSS_OBJECT_TYPE_EVENT
     * @type {Integer (Int32)}
     */
    static EVENT => 4

    /**
     * The object is a file-mapping object.
     * Native name: PSS_OBJECT_TYPE_SECTION
     * @type {Integer (Int32)}
     */
    static SECTION => 5

    /**
     * Native name: PSS_OBJECT_TYPE_SEMAPHORE
     * @type {Integer (Int32)}
     */
    static SEMAPHORE => 6
}
