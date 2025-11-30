#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsAllocateOptions extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_ALLOCATE_NEW => 1

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_ALLOCATE_NEXT => 2

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_ALLOCATE_ERROR_IF_UNAVAILABLE => 4
}
