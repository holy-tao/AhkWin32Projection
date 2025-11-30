#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_QUERYSTATISTICS_ALLOCATION_PRIORITY_CLASS extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_AllocationPriorityClassMinimum => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_AllocationPriorityClassLow => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_AllocationPriorityClassNormal => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_AllocationPriorityClassHigh => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_AllocationPriorityClassMaximum => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_MaxAllocationPriorityClass => 5
}
