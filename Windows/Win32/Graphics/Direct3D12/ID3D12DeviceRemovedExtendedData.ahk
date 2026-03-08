#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT.ahk
#Include .\D3D12_DRED_PAGE_FAULT_OUTPUT.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides runtime access to Device Removed Extended Data (DRED) data.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/nn-d3d12-id3d12deviceremovedextendeddata
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DeviceRemovedExtendedData extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12DeviceRemovedExtendedData
     * @type {Guid}
     */
    static IID => Guid("{98931d33-5ae8-4791-aa3c-1a73a2934e71}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAutoBreadcrumbsOutput", "GetPageFaultAllocationOutput"]

    /**
     * Retrieves the Device Removed Extended Data (DRED) auto-breadcrumbs output after device removal.
     * @returns {D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT} An output parameter that takes the address of a [D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT](ns-d3d12-d3d12_dred_auto_breadcrumbs_output.md) object. The object whose address is passed receives the data.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12deviceremovedextendeddata-getautobreadcrumbsoutput
     */
    GetAutoBreadcrumbsOutput() {
        pOutput := D3D12_DRED_AUTO_BREADCRUMBS_OUTPUT()
        result := ComCall(3, this, "ptr", pOutput, "HRESULT")
        return pOutput
    }

    /**
     * Retrieves the Device Removed Extended Data (DRED) page fault data.
     * @returns {D3D12_DRED_PAGE_FAULT_OUTPUT} An output parameter that takes the address of a [D3D12_DRED_PAGE_FAULT_OUTPUT](ns-d3d12-d3d12_dred_page_fault_output.md) object.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12/nf-d3d12-id3d12deviceremovedextendeddata-getpagefaultallocationoutput
     */
    GetPageFaultAllocationOutput() {
        pOutput := D3D12_DRED_PAGE_FAULT_OUTPUT()
        result := ComCall(4, this, "ptr", pOutput, "HRESULT")
        return pOutput
    }
}
