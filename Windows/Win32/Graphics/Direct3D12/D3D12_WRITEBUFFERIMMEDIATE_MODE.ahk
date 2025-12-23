#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the mode used by a WriteBufferImmediate operation.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ne-d3d12-d3d12_writebufferimmediate_mode
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_WRITEBUFFERIMMEDIATE_MODE extends Win32Enum{

    /**
     * The write operation behaves the same as normal copy-write operations.
     * @type {Integer (Int32)}
     */
    static D3D12_WRITEBUFFERIMMEDIATE_MODE_DEFAULT => 0

    /**
     * The write operation is guaranteed to occur after all preceding commands in the command stream have started, including previous <b>WriteBufferImmediate</b> operations.
     * @type {Integer (Int32)}
     */
    static D3D12_WRITEBUFFERIMMEDIATE_MODE_MARKER_IN => 1

    /**
     * The write operation is deferred until all previous commands in the command stream have completed through the GPU pipeline, including previous <b>WriteBufferImmediate</b> operations. Write operations that specify <b>D3D12_WRITEBUFFERIMMEDIATE_MODE_MARKER_OUT</b> don't block subsequent operations from starting. If there are no previous operations in the command stream, then the write operation behaves as if <b>D3D12_WRITEBUFFERIMMEDIATE_MODE_MARKER_IN</b> was specified.
     * @type {Integer (Int32)}
     */
    static D3D12_WRITEBUFFERIMMEDIATE_MODE_MARKER_OUT => 2
}
