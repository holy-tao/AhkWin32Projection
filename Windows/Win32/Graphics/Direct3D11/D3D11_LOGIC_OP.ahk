#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies logical operations to configure for a render target. (D3D11_LOGIC_OP)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ne-d3d11_1-d3d11_logic_op
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_LOGIC_OP extends Win32Enum{

    /**
     * Clears the render target.
     * @type {Integer (Int32)}
     */
    static D3D11_LOGIC_OP_CLEAR => 0

    /**
     * Sets the render target.
     * @type {Integer (Int32)}
     */
    static D3D11_LOGIC_OP_SET => 1

    /**
     * Copys the render target.
     * @type {Integer (Int32)}
     */
    static D3D11_LOGIC_OP_COPY => 2

    /**
     * Performs an inverted-copy of the render target.
     * @type {Integer (Int32)}
     */
    static D3D11_LOGIC_OP_COPY_INVERTED => 3

    /**
     * No operation is performed on the render target.
     * @type {Integer (Int32)}
     */
    static D3D11_LOGIC_OP_NOOP => 4

    /**
     * Inverts the render target.
     * @type {Integer (Int32)}
     */
    static D3D11_LOGIC_OP_INVERT => 5

    /**
     * Performs a logical AND operation on the render target.
     * @type {Integer (Int32)}
     */
    static D3D11_LOGIC_OP_AND => 6

    /**
     * Performs a logical NAND operation on the render target.
     * @type {Integer (Int32)}
     */
    static D3D11_LOGIC_OP_NAND => 7

    /**
     * Performs a logical OR operation on the render target.
     * @type {Integer (Int32)}
     */
    static D3D11_LOGIC_OP_OR => 8

    /**
     * Performs a logical NOR operation on the render target.
     * @type {Integer (Int32)}
     */
    static D3D11_LOGIC_OP_NOR => 9

    /**
     * Performs a logical XOR operation on the render target.
     * @type {Integer (Int32)}
     */
    static D3D11_LOGIC_OP_XOR => 10

    /**
     * Performs a logical equal operation on the render target.
     * @type {Integer (Int32)}
     */
    static D3D11_LOGIC_OP_EQUIV => 11

    /**
     * Performs a logical AND and reverse operation on the render target.
     * @type {Integer (Int32)}
     */
    static D3D11_LOGIC_OP_AND_REVERSE => 12

    /**
     * Performs a logical AND and invert operation on the render target.
     * @type {Integer (Int32)}
     */
    static D3D11_LOGIC_OP_AND_INVERTED => 13

    /**
     * Performs a logical OR and reverse operation on the render target.
     * @type {Integer (Int32)}
     */
    static D3D11_LOGIC_OP_OR_REVERSE => 14

    /**
     * Performs a logical OR and invert operation on the render target.
     * @type {Integer (Int32)}
     */
    static D3D11_LOGIC_OP_OR_INVERTED => 15
}
