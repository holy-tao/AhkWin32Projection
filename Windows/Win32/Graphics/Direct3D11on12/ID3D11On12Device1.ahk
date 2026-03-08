#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11On12Device.ahk

/**
 * Enables better interoperability with a component that might be handed a Direct3D 11 device, but which wants to leverage Direct3D 12 instead.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11on12/nn-d3d11on12-id3d11on12device1
 * @namespace Windows.Win32.Graphics.Direct3D11on12
 * @version v4.0.30319
 */
class ID3D11On12Device1 extends ID3D11On12Device{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11On12Device1
     * @type {Guid}
     */
    static IID => Guid("{bdb64df4-ea2f-4c70-b861-aaab1258bb5d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetD3D12Device"]

    /**
     * Retrieves the [Direct3D 12 device](/windows/desktop/api/d3d12/nn-d3d12-id3d12device) being interoperated with.
     * @param {Pointer<Guid>} riid Type: **REFIID**
     * 
     * A reference to the globally unique identifier (GUID) of the interface that you wish to be returned in `ppvDevice`. This is expected to be the GUID of [ID3D12Device](/windows/desktop/api/d3d12/nn-d3d12-id3d12device).
     * @returns {Pointer<Void>} Type: **[void](/windows/desktop/winprog/windows-data-types)\*\***
     * 
     * A pointer to a memory block that receives a pointer to the device. This is the address of a pointer to an [ID3D12Device](/windows/desktop/api/d3d12/nn-d3d12-id3d12device), representing the Direct3D 12 device.
     * @see https://learn.microsoft.com/windows/win32/api/d3d11on12/nf-d3d11on12-id3d11on12device1-getd3d12device
     */
    GetD3D12Device(riid) {
        result := ComCall(6, this, "ptr", riid, "ptr*", &ppvDevice := 0, "HRESULT")
        return ppvDevice
    }
}
