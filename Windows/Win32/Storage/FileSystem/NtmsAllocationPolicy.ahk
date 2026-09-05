#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class NtmsAllocationPolicy extends Win32Enum {

    /**
     * Native name: NTMS_ALLOCATE_FROMSCRATCH
     * @type {Integer (Int32)}
     */
    static ALLOCATE_FROMSCRATCH => 1
}
