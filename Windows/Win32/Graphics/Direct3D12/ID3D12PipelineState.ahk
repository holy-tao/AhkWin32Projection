#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Pageable.ahk

/**
 * Represents the state of all currently set shaders as well as certain fixed function state objects.
 * @remarks
 * 
  * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-creategraphicspipelinestate">ID3D12Device::CreateGraphicsPipelineState</a> or  <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-id3d12device-createcomputepipelinestate">ID3D12Device::CreateComputePipelineState</a> to create a pipeline state object (PSO). 
  * 
  * A pipeline state object corresponds to a significant portion of the state of the graphics processing unit (GPU).  This state includes all currently set shaders and certain fixed function state objects.  The only way to change states contained within the pipeline object is to change the currently bound pipeline object.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12pipelinestate
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12PipelineState extends ID3D12Pageable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12PipelineState
     * @type {Guid}
     */
    static IID => Guid("{765a30f3-f624-4c6f-a828-ace948622445}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCachedBlob"]

    /**
     * 
     * @param {Pointer<ID3DBlob>} ppBlob 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12pipelinestate-getcachedblob
     */
    GetCachedBlob(ppBlob) {
        result := ComCall(8, this, "ptr*", ppBlob, "HRESULT")
        return result
    }
}
