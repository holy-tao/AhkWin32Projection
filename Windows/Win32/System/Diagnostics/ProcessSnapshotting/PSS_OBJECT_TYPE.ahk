#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * Specifies the object type in a PSS_HANDLE_ENTRY structure.
 * @see https://docs.microsoft.com/windows/win32/api//processsnapshot/ne-processsnapshot-pss_object_type
 * @namespace Windows.Win32.System.Diagnostics.ProcessSnapshotting
 * @version v4.0.30319
 */
class PSS_OBJECT_TYPE extends Win32Enum{

    /**
     * The object type is either unknown or unsupported.
     * @type {Integer (Int32)}
     */
    static PSS_OBJECT_TYPE_UNKNOWN => 0

    /**
     * The object is a process.
     * @type {Integer (Int32)}
     */
    static PSS_OBJECT_TYPE_PROCESS => 1

    /**
     * The object is a thread.
     * @type {Integer (Int32)}
     */
    static PSS_OBJECT_TYPE_THREAD => 2

    /**
     * The object is a mutant/mutex.
     * @type {Integer (Int32)}
     */
    static PSS_OBJECT_TYPE_MUTANT => 3

    /**
     * The object is an event.
     * @type {Integer (Int32)}
     */
    static PSS_OBJECT_TYPE_EVENT => 4

    /**
     * The object is a file-mapping object.
     * @type {Integer (Int32)}
     */
    static PSS_OBJECT_TYPE_SECTION => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static PSS_OBJECT_TYPE_SEMAPHORE => 6
}
