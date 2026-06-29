#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Flags for surface and resource creation options.
 * @remarks
 * Each flag is defined as an unsigned integer.
 * 
 * ``` syntax
 * @see https://learn.microsoft.com/windows/win32/direct3ddxgi/dxgi-usage
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_USAGE {
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
    static DXGI_USAGE_SHADER_INPUT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_USAGE_RENDER_TARGET_OUTPUT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_USAGE_BACK_BUFFER => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_USAGE_SHARED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_USAGE_READ_ONLY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_USAGE_DISCARD_ON_PRESENT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DXGI_USAGE_UNORDERED_ACCESS => 1024
}
