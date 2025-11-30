#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class NtmsAllocationPolicy extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NTMS_ALLOCATE_FROMSCRATCH => 1
}
