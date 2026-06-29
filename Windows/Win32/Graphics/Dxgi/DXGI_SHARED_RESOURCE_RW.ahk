#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Shared resource constants.
 * @see https://learn.microsoft.com/windows/win32/direct3ddxgi/dxgi-shared-resource-rw
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_SHARED_RESOURCE_RW {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_SHARED_RESOURCE_READ => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_SHARED_RESOURCE_WRITE => 1
}
