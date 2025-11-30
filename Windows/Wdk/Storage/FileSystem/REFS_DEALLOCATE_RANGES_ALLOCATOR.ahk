#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class REFS_DEALLOCATE_RANGES_ALLOCATOR extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static REFS_DEALLOCATE_RANGES_ALLOCATOR_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static REFS_DEALLOCATE_RANGES_ALLOCATOR_SAA => 1

    /**
     * @type {Integer (Int32)}
     */
    static REFS_DEALLOCATE_RANGES_ALLOCATOR_CAA => 2

    /**
     * @type {Integer (Int32)}
     */
    static REFS_DEALLOCATE_RANGES_ALLOCATOR_MAA => 3
}
