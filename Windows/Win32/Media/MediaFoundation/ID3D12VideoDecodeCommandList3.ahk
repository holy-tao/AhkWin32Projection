#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoDecodeCommandList2.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videodecodecommandlist3
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoDecodeCommandList3 extends ID3D12VideoDecodeCommandList2{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoDecodeCommandList3
     * @type {Guid}
     */
    static IID => Guid("{2aee8c37-9562-42da-8abf-61efeb2e4513}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 27

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Barrier"]

    /**
     * 
     * @param {Integer} NumBarrierGroups 
     * @param {Pointer<D3D12_BARRIER_GROUP>} pBarrierGroups 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodecodecommandlist3-barrier
     */
    Barrier(NumBarrierGroups, pBarrierGroups) {
        ComCall(27, this, "uint", NumBarrierGroups, "ptr", pBarrierGroups)
    }
}
