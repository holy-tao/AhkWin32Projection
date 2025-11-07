#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the predication operation to apply.
 * @remarks
 * 
 * This enum is used by <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-setpredication">SetPredication</a>.
 *         
 * 
 * Predication is decoupled from queries.
 *           Predication can be set based on the value of 64-bits within a buffer.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ne-d3d12-d3d12_predication_op
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_PREDICATION_OP{

    /**
     * Enables predication if all 64-bits are zero.
     * @type {Integer (Int32)}
     */
    static D3D12_PREDICATION_OP_EQUAL_ZERO => 0

    /**
     * Enables predication if at least one of the 64-bits are not zero.
     * @type {Integer (Int32)}
     */
    static D3D12_PREDICATION_OP_NOT_EQUAL_ZERO => 1
}
