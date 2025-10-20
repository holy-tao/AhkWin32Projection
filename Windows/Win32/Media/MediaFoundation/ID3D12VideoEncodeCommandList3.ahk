#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoEncodeCommandList2.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoEncodeCommandList3 extends ID3D12VideoEncodeCommandList2{
    /**
     * The interface identifier for ID3D12VideoEncodeCommandList3
     * @type {Guid}
     */
    static IID => Guid("{7f027b22-1515-4e85-aa0d-026486580576}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 29

    /**
     * 
     * @param {Integer} NumBarrierGroups 
     * @param {Pointer<D3D12_BARRIER_GROUP>} pBarrierGroups 
     * @returns {String} Nothing - always returns an empty string
     */
    Barrier(NumBarrierGroups, pBarrierGroups) {
        ComCall(29, this, "uint", NumBarrierGroups, "ptr", pBarrierGroups)
        return result
    }
}
