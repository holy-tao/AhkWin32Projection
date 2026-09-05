#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Scan opcodes.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcsx/ne-d3dcsx-d3dx11_scan_opcode
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3DX11_SCAN_OPCODE extends Win32Enum {

    /**
     * Add values.
     * Native name: D3DX11_SCAN_OPCODE_ADD
     * @type {Integer (Int32)}
     */
    static ADD => 1

    /**
     * Take the minimum value.
     * Native name: D3DX11_SCAN_OPCODE_MIN
     * @type {Integer (Int32)}
     */
    static MIN => 2

    /**
     * Take the maximum value.
     * Native name: D3DX11_SCAN_OPCODE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 3

    /**
     * Multiply the values.
     * Native name: D3DX11_SCAN_OPCODE_MUL
     * @type {Integer (Int32)}
     */
    static MUL => 4

    /**
     * Perform a logical AND on the values.
     * Native name: D3DX11_SCAN_OPCODE_AND
     * @type {Integer (Int32)}
     */
    static AND => 5

    /**
     * Perform a logical OR on the values.
     * Native name: D3DX11_SCAN_OPCODE_OR
     * @type {Integer (Int32)}
     */
    static OR => 6

    /**
     * Perform a logical XOR on the values.
     * Native name: D3DX11_SCAN_OPCODE_XOR
     * @type {Integer (Int32)}
     */
    static XOR => 7
}
