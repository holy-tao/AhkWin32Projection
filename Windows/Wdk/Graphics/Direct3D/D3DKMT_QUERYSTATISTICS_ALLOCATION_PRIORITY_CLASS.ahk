#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_QUERYSTATISTICS_ALLOCATION_PRIORITY_CLASS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
