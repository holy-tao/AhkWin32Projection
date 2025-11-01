#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12DeviceRemovedExtendedData.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DeviceRemovedExtendedData1 extends ID3D12DeviceRemovedExtendedData{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12DeviceRemovedExtendedData1
     * @type {Guid}
     */
    static IID => Guid("{9727a022-cf1d-4dda-9eba-effa653fc506}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 5

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAutoBreadcrumbsOutput1", "GetPageFaultAllocationOutput1"]

    /**
     * 
     * @param {Pointer<D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT1>} pOutput 
     * @returns {HRESULT} 
     */
    GetAutoBreadcrumbsOutput1(pOutput) {
        result := ComCall(5, this, "ptr", pOutput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_DRED_PAGE_FAULT_OUTPUT1>} pOutput 
     * @returns {HRESULT} 
     */
    GetPageFaultAllocationOutput1(pOutput) {
        result := ComCall(6, this, "ptr", pOutput, "HRESULT")
        return result
    }
}
