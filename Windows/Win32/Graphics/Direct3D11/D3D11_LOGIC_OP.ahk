#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies logical operations to configure for a render target. (D3D11_LOGIC_OP)
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ne-d3d11_1-d3d11_logic_op
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
class D3D11_LOGIC_OP extends Win32Enum {

    /**
     * Clears the render target.
     * Native name: D3D11_LOGIC_OP_CLEAR
     * @type {Integer (Int32)}
     */
    static CLEAR => 0

    /**
     * Sets the render target.
     * Native name: D3D11_LOGIC_OP_SET
     * @type {Integer (Int32)}
     */
    static SET => 1

    /**
     * Copys the render target.
     * Native name: D3D11_LOGIC_OP_COPY
     * @type {Integer (Int32)}
     */
    static COPY => 2

    /**
     * Performs an inverted-copy of the render target.
     * Native name: D3D11_LOGIC_OP_COPY_INVERTED
     * @type {Integer (Int32)}
     */
    static COPY_INVERTED => 3

    /**
     * No operation is performed on the render target.
     * Native name: D3D11_LOGIC_OP_NOOP
     * @type {Integer (Int32)}
     */
    static NOOP => 4

    /**
     * Inverts the render target.
     * Native name: D3D11_LOGIC_OP_INVERT
     * @type {Integer (Int32)}
     */
    static INVERT => 5

    /**
     * Performs a logical AND operation on the render target.
     * Native name: D3D11_LOGIC_OP_AND
     * @type {Integer (Int32)}
     */
    static AND => 6

    /**
     * Performs a logical NAND operation on the render target.
     * Native name: D3D11_LOGIC_OP_NAND
     * @type {Integer (Int32)}
     */
    static NAND => 7

    /**
     * Performs a logical OR operation on the render target.
     * Native name: D3D11_LOGIC_OP_OR
     * @type {Integer (Int32)}
     */
    static OR => 8

    /**
     * Performs a logical NOR operation on the render target.
     * Native name: D3D11_LOGIC_OP_NOR
     * @type {Integer (Int32)}
     */
    static NOR => 9

    /**
     * Performs a logical XOR operation on the render target.
     * Native name: D3D11_LOGIC_OP_XOR
     * @type {Integer (Int32)}
     */
    static XOR => 10

    /**
     * Performs a logical equal operation on the render target.
     * Native name: D3D11_LOGIC_OP_EQUIV
     * @type {Integer (Int32)}
     */
    static EQUIV => 11

    /**
     * Performs a logical AND and reverse operation on the render target.
     * Native name: D3D11_LOGIC_OP_AND_REVERSE
     * @type {Integer (Int32)}
     */
    static AND_REVERSE => 12

    /**
     * Performs a logical AND and invert operation on the render target.
     * Native name: D3D11_LOGIC_OP_AND_INVERTED
     * @type {Integer (Int32)}
     */
    static AND_INVERTED => 13

    /**
     * Performs a logical OR and reverse operation on the render target.
     * Native name: D3D11_LOGIC_OP_OR_REVERSE
     * @type {Integer (Int32)}
     */
    static OR_REVERSE => 14

    /**
     * Performs a logical OR and invert operation on the render target.
     * Native name: D3D11_LOGIC_OP_OR_INVERTED
     * @type {Integer (Int32)}
     */
    static OR_INVERTED => 15
}
