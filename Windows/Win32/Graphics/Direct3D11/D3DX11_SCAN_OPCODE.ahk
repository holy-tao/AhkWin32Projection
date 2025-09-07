#Requires AutoHotkey v2.0.0 64-bit

/**
 * Scan opcodes.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/ne-d3dcsx-d3dx11_scan_opcode
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3DX11_SCAN_OPCODE{

    /**
     * Add values.
     * @type {Integer (Int32)}
     */
    static D3DX11_SCAN_OPCODE_ADD => 1

    /**
     * Take the minimum value.
     * @type {Integer (Int32)}
     */
    static D3DX11_SCAN_OPCODE_MIN => 2

    /**
     * Take the maximum value.
     * @type {Integer (Int32)}
     */
    static D3DX11_SCAN_OPCODE_MAX => 3

    /**
     * Multiply the values.
     * @type {Integer (Int32)}
     */
    static D3DX11_SCAN_OPCODE_MUL => 4

    /**
     * Perform a logical AND on the values.
     * @type {Integer (Int32)}
     */
    static D3DX11_SCAN_OPCODE_AND => 5

    /**
     * Perform a logical OR on the values.
     * @type {Integer (Int32)}
     */
    static D3DX11_SCAN_OPCODE_OR => 6

    /**
     * Perform a logical XOR on the values.
     * @type {Integer (Int32)}
     */
    static D3DX11_SCAN_OPCODE_XOR => 7
}
