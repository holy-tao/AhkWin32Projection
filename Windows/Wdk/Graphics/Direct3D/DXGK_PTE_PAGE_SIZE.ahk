#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class DXGK_PTE_PAGE_SIZE extends Win32Enum {

    /**
     * Native name: DXGK_PTE_PAGE_TABLE_PAGE_4KB
     * @type {Integer (Int32)}
     */
    static TABLE_PAGE_4KB => 0

    /**
     * Native name: DXGK_PTE_PAGE_TABLE_PAGE_64KB
     * @type {Integer (Int32)}
     */
    static TABLE_PAGE_64KB => 1
}
