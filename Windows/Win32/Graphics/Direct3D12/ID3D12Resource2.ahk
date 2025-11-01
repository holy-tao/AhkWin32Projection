#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12Resource1.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12Resource2 extends ID3D12Resource1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12Resource2
     * @type {Guid}
     */
    static IID => Guid("{be36ec3b-ea85-4aeb-a45a-e9d76404a495}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 16

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc1"]

    /**
     * 
     * @returns {D3D12_RESOURCE_DESC1} 
     */
    GetDesc1() {
        result := ComCall(16, this, "ptr")
        return result
    }
}
