#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Pageable.ahk

/**
 * Represents the allocations of storage for graphics processing unit (GPU) commands.
 * @remarks
 * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createcommandallocator">ID3D12Device::CreateCommandAllocator</a> to create a command allocator object. 
 * 
 * The command allocator object corresponds to the underlying allocations in which GPU commands are stored.  The command allocator object applies to both direct command lists and bundles.  You must use a command allocator object in a DirectX 12 app.
 * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nn-d3d12-id3d12commandallocator
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
     * Indicates to re-use the memory that is associated with the command allocator.
     * @remarks
     * Apps call <b>Reset</b> to re-use the memory that is associated with a command allocator.  From this call to <b>Reset</b>, the runtime and driver determine that the graphics processing unit (GPU) is no longer executing any command lists that have recorded commands with the command allocator.
     * 
     * Unlike <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12graphicscommandlist-reset">ID3D12GraphicsCommandList::Reset</a>, it is not recommended that you call <b>Reset</b>  on the command allocator while a command list is still being executed. 
     * 
     * The debug layer will issue a warning if it can't prove that there are no pending GPU references to command lists that have recorded commands in the allocator.
     * 
     * The debug layer will issue an error if <b>Reset</b> is called concurrently by multiple threads (on the same allocator object).
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns <b>E_FAIL</b> if there is an actively recording command list referencing the command allocator.  The debug layer will also issue an error in this case.  
     *         See <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a> for other possible return values.
     * @see https://learn.microsoft.com/windows/win32/api//content/d3d12/nf-d3d12-id3d12commandallocator-reset
     */
    Reset() {
        result := ComCall(8, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
