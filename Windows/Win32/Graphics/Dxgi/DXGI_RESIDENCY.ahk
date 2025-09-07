#Requires AutoHotkey v2.0.0 64-bit

/**
 * Flags indicating the memory location of a resource.
 * @remarks
 * This enum is used by <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgidevice-queryresourceresidency">QueryResourceResidency</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi/ne-dxgi-dxgi_residency
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_RESIDENCY{

    /**
     * The resource is located in video memory.
     * @type {Integer (Int32)}
     */
    static DXGI_RESIDENCY_FULLY_RESIDENT => 1

    /**
     * At least some of the resource is located in CPU memory.
     * @type {Integer (Int32)}
     */
    static DXGI_RESIDENCY_RESIDENT_IN_SHARED_MEMORY => 2

    /**
     * At least some of the resource has been paged out to the hard drive.
     * @type {Integer (Int32)}
     */
    static DXGI_RESIDENCY_EVICTED_TO_DISK => 3
}
