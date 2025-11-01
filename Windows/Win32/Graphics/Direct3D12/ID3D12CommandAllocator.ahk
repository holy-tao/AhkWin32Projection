#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Pageable.ahk

/**
 * Represents the allocations of storage for graphics processing unit (GPU) commands.
 * @remarks
 * 
  * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createcommandallocator">ID3D12Device::CreateCommandAllocator</a> to create a command allocator object. 
  * 
  * The command allocator object corresponds to the underlying allocations in which GPU commands are stored.  The command allocator object applies to both direct command lists and bundles.  You must use a command allocator object in a DirectX 12 app.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12commandallocator
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12CommandAllocator extends ID3D12Pageable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12CommandAllocator
     * @type {Guid}
     */
    static IID => Guid("{6102dee4-af59-4b09-b999-b44d73f09b24}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Reset"]

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12commandallocator-reset
     */
    Reset() {
        result := ComCall(8, this, "HRESULT")
        return result
    }
}
