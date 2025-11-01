#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12GraphicsCommandList5.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12GraphicsCommandList6 extends ID3D12GraphicsCommandList5{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12GraphicsCommandList6
     * @type {Guid}
     */
    static IID => Guid("{c3827890-e548-4cfa-96cf-5689a9370f80}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 79

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["DispatchMesh"]

    /**
     * 
     * @param {Integer} ThreadGroupCountX 
     * @param {Integer} ThreadGroupCountY 
     * @param {Integer} ThreadGroupCountZ 
     * @returns {String} Nothing - always returns an empty string
     */
    DispatchMesh(ThreadGroupCountX, ThreadGroupCountY, ThreadGroupCountZ) {
        ComCall(79, this, "uint", ThreadGroupCountX, "uint", ThreadGroupCountY, "uint", ThreadGroupCountZ)
    }
}
