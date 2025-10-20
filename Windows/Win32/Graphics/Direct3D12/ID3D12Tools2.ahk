#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Tools1.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Tools2 extends ID3D12Tools1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Tools2
     * @type {Guid}
     */
    static IID => Guid("{01d393c5-c9b0-42a1-958c-c26b02d4d097}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetApplicationSpecificDriverState"]

    /**
     * 
     * @param {IUnknown} pAdapter 
     * @param {ID3DBlob} pBlob 
     * @returns {HRESULT} 
     */
    SetApplicationSpecificDriverState(pAdapter, pBlob) {
        result := ComCall(7, this, "ptr", pAdapter, "ptr", pBlob, "HRESULT")
        return result
    }
}
