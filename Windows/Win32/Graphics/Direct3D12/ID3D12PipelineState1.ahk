#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12PipelineState.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12PipelineState1 extends ID3D12PipelineState{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12PipelineState1
     * @type {Guid}
     */
    static IID => Guid("{5646804c-9638-48f7-9182-b3ee5a6b60fb}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRootSignature"]

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvRootSignature 
     * @returns {HRESULT} 
     */
    GetRootSignature(riid, ppvRootSignature) {
        result := ComCall(9, this, "ptr", riid, "ptr*", ppvRootSignature, "HRESULT")
        return result
    }
}
