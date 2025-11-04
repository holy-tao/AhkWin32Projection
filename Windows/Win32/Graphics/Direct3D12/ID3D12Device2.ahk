#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device1.ahk

/**
 * Represents a virtual adapter. This interface extends ID3D12Device1 to create pipeline state objects from pipeline state stream descriptions.
 * @remarks
 * 
  * Use <a href="https://docs.microsoft.com/windows/desktop/api/d3d12/nf-d3d12-d3d12createdevice">D3D12CreateDevice</a> to create a device.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12device2
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device2 extends ID3D12Device1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Device2
     * @type {Guid}
     */
    static IID => Guid("{30baa41e-b15b-475c-a0bb-1af5c5b64328}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 47

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePipelineState"]

    /**
     * 
     * @param {Pointer<D3D12_PIPELINE_STATE_STREAM_DESC>} pDesc 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppPipelineState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12device2-createpipelinestate
     */
    CreatePipelineState(pDesc, riid, ppPipelineState) {
        ppPipelineStateMarshal := ppPipelineState is VarRef ? "ptr*" : "ptr"

        result := ComCall(47, this, "ptr", pDesc, "ptr", riid, ppPipelineStateMarshal, ppPipelineState, "HRESULT")
        return result
    }
}
