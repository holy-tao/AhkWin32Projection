#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies logical operations to configure for a render target. (D3D12_LOGIC_OP)
 * @remarks
 * This enum is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/ns-d3d12-d3d12_render_target_blend_desc">D3D12_RENDER_TARGET_BLEND_DESC</a> structure.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_logic_op
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_LOGIC_OP{

    /**
     * Clears the render target (<c>0</c>).
     * @type {Integer (Int32)}
     */
    static D3D12_LOGIC_OP_CLEAR => 0

    /**
     * Sets the render target ( <c>1</c>).
     * @type {Integer (Int32)}
     */
    static D3D12_LOGIC_OP_SET => 1

    /**
     * Copys the render target (<code>s<code> source from Pixel Shader output).
     * @type {Integer (Int32)}
     */
    static D3D12_LOGIC_OP_COPY => 2

    /**
     * Performs an inverted-copy of the render target (<c>~s</c>).
     * @type {Integer (Int32)}
     */
    static D3D12_LOGIC_OP_COPY_INVERTED => 3

    /**
     * No operation is performed on the render target (<c>d</c> destination in the Render Target View).
     * @type {Integer (Int32)}
     */
    static D3D12_LOGIC_OP_NOOP => 4

    /**
     * Inverts the render target (<c>~d</c>).
     * @type {Integer (Int32)}
     */
    static D3D12_LOGIC_OP_INVERT => 5

    /**
     * Performs a logical AND operation on the render target (<c>s & d</c>).
     * @type {Integer (Int32)}
     */
    static D3D12_LOGIC_OP_AND => 6

    /**
     * Performs a logical NAND operation on the render target (<c>~(s & d)</c>).
     * @type {Integer (Int32)}
     */
    static D3D12_LOGIC_OP_NAND => 7

    /**
     * Performs a logical OR operation on the render target (<c>s | d</c>).
     * @type {Integer (Int32)}
     */
    static D3D12_LOGIC_OP_OR => 8

    /**
     * Performs a logical NOR operation on the render target (<c>~(s | d)</c>).
     * @type {Integer (Int32)}
     */
    static D3D12_LOGIC_OP_NOR => 9

    /**
     * Performs a logical XOR operation on the render target (<c>s ^ d</c>).
     * @type {Integer (Int32)}
     */
    static D3D12_LOGIC_OP_XOR => 10

    /**
     * Performs a logical equal operation on the render target (<c>~(s ^ d)</c>).
     * @type {Integer (Int32)}
     */
    static D3D12_LOGIC_OP_EQUIV => 11

    /**
     * Performs a logical AND and reverse operation on the render target (<c>s & ~d</c>).
     * @type {Integer (Int32)}
     */
    static D3D12_LOGIC_OP_AND_REVERSE => 12

    /**
     * Performs a logical AND and invert operation on the render target (<c>~s & d</c>).
     * @type {Integer (Int32)}
     */
    static D3D12_LOGIC_OP_AND_INVERTED => 13

    /**
     * Performs a logical OR and reverse operation on the render target (<c>s | ~d</c>).
     * @type {Integer (Int32)}
     */
    static D3D12_LOGIC_OP_OR_REVERSE => 14

    /**
     * Performs a logical OR and invert operation on the render target (<c>~s | d</c>).
     * @type {Integer (Int32)}
     */
    static D3D12_LOGIC_OP_OR_INVERTED => 15
}
