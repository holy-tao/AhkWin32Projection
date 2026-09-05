#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsAllocateOptions extends Win32Enum {

    /**
     * Native name: NTMS_ALLOCATE_NEW
     * @type {Integer (Int32)}
     */
    static NEW => 1

    /**
     * Native name: NTMS_ALLOCATE_NEXT
     * @type {Integer (Int32)}
     */
    static NEXT => 2

    /**
     * Native name: NTMS_ALLOCATE_ERROR_IF_UNAVAILABLE
     * @type {Integer (Int32)}
     */
    static ERROR_IF_UNAVAILABLE => 4
}
