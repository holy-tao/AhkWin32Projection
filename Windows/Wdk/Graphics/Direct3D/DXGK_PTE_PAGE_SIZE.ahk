#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class DXGK_PTE_PAGE_SIZE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_PTE_PAGE_TABLE_PAGE_4KB => 0

    /**
     * @type {Integer (Int32)}
     */
    static DXGK_PTE_PAGE_TABLE_PAGE_64KB => 1
}
