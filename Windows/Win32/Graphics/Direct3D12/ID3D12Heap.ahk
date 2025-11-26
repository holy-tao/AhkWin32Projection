#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Pageable.ahk

/**
 * A heap is an abstraction of contiguous memory allocation, used to manage physical memory. This heap can be used with ID3D12Resource objects to support placed resources or reserved resources.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12heap
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Heap extends ID3D12Pageable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Heap
     * @type {Guid}
     */
    static IID => Guid("{6b3b2502-6e51-45b3-90ee-9884265e8df3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc"]

    /**
     * Gets the heap description.
     * @returns {D3D12_HEAP_DESC} Type: <b><a href="/windows/desktop/api/d3d12/ns-d3d12-d3d12_heap_desc">D3D12_HEAP_DESC</a></b>
     * 
     * Returns the <a href="/windows/desktop/api/d3d12/ns-d3d12-d3d12_heap_desc">D3D12_HEAP_DESC</a> structure that describes the heap.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12/nf-d3d12-id3d12heap-getdesc
     */
    GetDesc() {
        result := ComCall(8, this, "ptr")
        return result
    }
}
