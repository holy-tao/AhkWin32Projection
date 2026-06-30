#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\D3D12_STATE_OBJECT_STATISTICS.ahk
#Include ..\..\Foundation\HRESULT.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
class ID3D12DeviceStatistics extends IUnknown {

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12DeviceStatistics
     * @type {Guid}
     */
    static IID => Guid("{3d5ca1a8-a39e-4619-95e0-f9b0a40340f5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetStateObjectStatistics"]

    /**
     * 
     * @returns {D3D12_STATE_OBJECT_STATISTICS} 
     */
    GetStateObjectStatistics() {
        pStatistics := D3D12_STATE_OBJECT_STATISTICS()
        result := ComCall(3, this, "ptr", pStatistics, "HRESULT")
        return pStatistics
    }
}
