#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Data type of a performance counter.
 * @remarks
 * 
 * These flags are an output parameter in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-checkcounter">ID3D11Device::CheckCounter</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_counter_type
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_COUNTER_TYPE extends Win32Enum{

    /**
     * 32-bit floating point.
     * @type {Integer (Int32)}
     */
    static D3D11_COUNTER_TYPE_FLOAT32 => 0

    /**
     * 16-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static D3D11_COUNTER_TYPE_UINT16 => 1

    /**
     * 32-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static D3D11_COUNTER_TYPE_UINT32 => 2

    /**
     * 64-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static D3D11_COUNTER_TYPE_UINT64 => 3
}
