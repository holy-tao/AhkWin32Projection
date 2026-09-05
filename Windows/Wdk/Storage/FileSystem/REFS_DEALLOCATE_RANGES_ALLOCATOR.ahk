#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class REFS_DEALLOCATE_RANGES_ALLOCATOR extends Win32Enum {

    /**
     * Native name: REFS_DEALLOCATE_RANGES_ALLOCATOR_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: REFS_DEALLOCATE_RANGES_ALLOCATOR_SAA
     * @type {Integer (Int32)}
     */
    static SAA => 1

    /**
     * Native name: REFS_DEALLOCATE_RANGES_ALLOCATOR_CAA
     * @type {Integer (Int32)}
     */
    static CAA => 2

    /**
     * Native name: REFS_DEALLOCATE_RANGES_ALLOCATOR_MAA
     * @type {Integer (Int32)}
     */
    static MAA => 3
}
