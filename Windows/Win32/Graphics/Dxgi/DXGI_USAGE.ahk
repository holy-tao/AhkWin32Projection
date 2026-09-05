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
 */
class DXGI_USAGE extends Win32BitflagEnum {

    /**
     * Native name: DXGI_USAGE_SHADER_INPUT
     * @type {Integer (UInt32)}
     */
    static SHADER_INPUT => 16

    /**
     * Native name: DXGI_USAGE_RENDER_TARGET_OUTPUT
     * @type {Integer (UInt32)}
     */
    static RENDER_TARGET_OUTPUT => 32

    /**
     * Native name: DXGI_USAGE_BACK_BUFFER
     * @type {Integer (UInt32)}
     */
    static BACK_BUFFER => 64

    /**
     * Native name: DXGI_USAGE_SHARED
     * @type {Integer (UInt32)}
     */
    static SHARED => 128

    /**
     * Native name: DXGI_USAGE_READ_ONLY
     * @type {Integer (UInt32)}
     */
    static READ_ONLY => 256

    /**
     * Native name: DXGI_USAGE_DISCARD_ON_PRESENT
     * @type {Integer (UInt32)}
     */
    static DISCARD_ON_PRESENT => 512

    /**
     * Native name: DXGI_USAGE_UNORDERED_ACCESS
     * @type {Integer (UInt32)}
     */
    static UNORDERED_ACCESS => 1024
}
