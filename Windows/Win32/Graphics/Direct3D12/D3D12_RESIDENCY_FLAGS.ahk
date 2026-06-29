#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used with the EnqueuMakeResident function to choose how residency operations proceed when the memory budget is exceeded.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_residency_flags
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_RESIDENCY_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Specifies the default residency policy, which allows residency operations to succeed regardless of the application's current memory budget. EnqueueMakeResident returns E_OUTOFMEMORY only when there is no memory available.
     * @type {Integer (Int32)}
     */
    static D3D12_RESIDENCY_FLAG_NONE => 0

    /**
     * Specifies that the EnqueueMakeResident function should return E_OUTOFMEMORY when the residency operation would exceed the application's current memory budget.
     * @type {Integer (Int32)}
     */
    static D3D12_RESIDENCY_FLAG_DENY_OVERBUDGET => 1
}
