#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_QUERYSTATISTICS_ALLOCATION_PRIORITY_CLASS extends Win32Enum {

    /**
     * Native name: D3DKMT_AllocationPriorityClassMinimum
     * @type {Integer (Int32)}
     */
    static Minimum => 0

    /**
     * Native name: D3DKMT_AllocationPriorityClassLow
     * @type {Integer (Int32)}
     */
    static Low => 1

    /**
     * Native name: D3DKMT_AllocationPriorityClassNormal
     * @type {Integer (Int32)}
     */
    static Normal => 2

    /**
     * Native name: D3DKMT_AllocationPriorityClassHigh
     * @type {Integer (Int32)}
     */
    static High => 3

    /**
     * Native name: D3DKMT_AllocationPriorityClassMaximum
     * @type {Integer (Int32)}
     */
    static Maximum => 4

    /**
     * Native name: D3DKMT_MaxAllocationPriorityClass
     * @type {Integer (Int32)}
     */
    static MaxAllocationPriorityClass => 5
}
