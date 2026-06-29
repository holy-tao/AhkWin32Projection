#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12RootSignature.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class ID3D12RootSignature1 extends ID3D12RootSignature {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12RootSignature1
     * @type {Guid}
     */
    static IID => Guid("{c390bd7d-9142-4a95-b072-6d3439ade5c4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSerializedSize", "GetSerializedData"]

    /**
     * 
     * @returns {Pointer} 
     */
    GetSerializedSize() {
        result := ComCall(8, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Integer} pData 
     * @param {Pointer} _Size 
     * @returns {HRESULT} 
     */
    GetSerializedData(pData, _Size) {
        result := ComCall(9, this, "ptr", pData, "ptr", _Size, "HRESULT")
        return result
    }
}
