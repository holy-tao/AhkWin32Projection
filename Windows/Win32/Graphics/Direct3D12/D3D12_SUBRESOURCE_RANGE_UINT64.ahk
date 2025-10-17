#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\D3D12_RANGE_UINT64.ahk

/**
 * Describes a subresource memory range.
 * @remarks
 * 
  * This structure is used by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist1-atomiccopybufferuint">AtomicCopyBufferUINT</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist1-atomiccopybufferuint64">AtomicCopyBufferUINT64</a> methods.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/ns-d3d12-d3d12_subresource_range_uint64
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SUBRESOURCE_RANGE_UINT64 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The index of the subresource.
     * @type {Integer}
     */
    Subresource {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A memory range within the subresource.
     * @type {D3D12_RANGE_UINT64}
     */
    Range{
        get {
            if(!this.HasProp("__Range"))
                this.__Range := D3D12_RANGE_UINT64(8, this)
            return this.__Range
        }
    }
}
