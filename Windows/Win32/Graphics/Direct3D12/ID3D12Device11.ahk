#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Device10.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Device11 extends ID3D12Device10{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Device11
     * @type {Guid}
     */
    static IID => Guid("{5405c344-d457-444e-b4dd-2366e45aee39}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 79

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateSampler2"]

    /**
     * 
     * @param {Pointer<D3D12_SAMPLER_DESC2>} pDesc 
     * @param {D3D12_CPU_DESCRIPTOR_HANDLE} DestDescriptor 
     * @returns {String} Nothing - always returns an empty string
     */
    CreateSampler2(pDesc, DestDescriptor) {
        ComCall(79, this, "ptr", pDesc, "ptr", DestDescriptor)
    }
}
