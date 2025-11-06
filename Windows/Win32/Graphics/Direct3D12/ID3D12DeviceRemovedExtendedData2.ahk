#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_DRED_PAGE_FAULT_OUTPUT2.ahk
#Include .\ID3D12DeviceRemovedExtendedData1.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DeviceRemovedExtendedData2 extends ID3D12DeviceRemovedExtendedData1{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12DeviceRemovedExtendedData2
     * @type {Guid}
     */
    static IID => Guid("{67fc5816-e4ca-4915-bf18-42541272da54}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetPageFaultAllocationOutput2", "GetDeviceState"]

    /**
     * 
     * @returns {D3D12_DRED_PAGE_FAULT_OUTPUT2} 
     */
    GetPageFaultAllocationOutput2() {
        pOutput := D3D12_DRED_PAGE_FAULT_OUTPUT2()
        result := ComCall(7, this, "ptr", pOutput, "HRESULT")
        return pOutput
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetDeviceState() {
        result := ComCall(8, this, "int")
        return result
    }
}
