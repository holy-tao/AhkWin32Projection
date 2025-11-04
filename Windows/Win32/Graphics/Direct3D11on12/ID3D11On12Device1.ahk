#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D11On12Device.ahk

/**
 * Enables better interoperability with a component that might be handed a Direct3D 11 device, but which wants to leverage Direct3D 12 instead.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11on12/nn-d3d11on12-id3d11on12device1
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
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppvDevice 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11on12/nf-d3d11on12-id3d11on12device1-getd3d12device
     */
    GetD3D12Device(riid, ppvDevice) {
        ppvDeviceMarshal := ppvDevice is VarRef ? "ptr*" : "ptr"

        result := ComCall(6, this, "ptr", riid, ppvDeviceMarshal, ppvDevice, "HRESULT")
        return result
    }
}
