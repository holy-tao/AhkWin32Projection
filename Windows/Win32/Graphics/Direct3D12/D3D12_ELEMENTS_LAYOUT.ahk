#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes how the locations of elements are identified.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_elements_layout
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_ELEMENTS_LAYOUT{

    /**
     * For a data set of <i>n</i> elements, the pointer parameter points to the start of <i>n</i> elements in memory.
     * @type {Integer (Int32)}
     */
    static D3D12_ELEMENTS_LAYOUT_ARRAY => 0

    /**
     * For a data set of <i>n</i> elements, the pointer parameter points to an array of <i>n</i> pointers in memory, each pointing to an individual element of the set.
     * @type {Integer (Int32)}
     */
    static D3D12_ELEMENTS_LAYOUT_ARRAY_OF_POINTERS => 1
}
