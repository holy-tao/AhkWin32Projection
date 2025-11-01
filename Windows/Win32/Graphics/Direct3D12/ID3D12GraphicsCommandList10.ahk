#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12GraphicsCommandList9.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12GraphicsCommandList10 extends ID3D12GraphicsCommandList9{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12GraphicsCommandList10
     * @type {Guid}
     */
    static IID => Guid("{7013c015-d161-4b63-a08c-238552dd8acc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 84

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetProgram", "DispatchGraph"]

    /**
     * 
     * @param {Pointer<D3D12_SET_PROGRAM_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     */
    SetProgram(pDesc) {
        ComCall(84, this, "ptr", pDesc)
    }

    /**
     * 
     * @param {Pointer<D3D12_DISPATCH_GRAPH_DESC>} pDesc 
     * @returns {String} Nothing - always returns an empty string
     */
    DispatchGraph(pDesc) {
        ComCall(85, this, "ptr", pDesc)
    }
}
