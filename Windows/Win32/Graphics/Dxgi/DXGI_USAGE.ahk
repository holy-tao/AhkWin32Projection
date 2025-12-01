#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Flags for surface and resource creation options.
 * @remarks
 * Each flag is defined as an unsigned integer.
 * 
 * ``` syntax
 * @see https://learn.microsoft.com/windows/win32/direct3ddxgi/dxgi-usage
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_USAGE extends Win32BitflagEnum{

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
