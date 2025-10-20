#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DSRDeviceFactory extends IUnknown{
    /**
     * The interface identifier for ID3D12DSRDeviceFactory
     * @type {Guid}
     */
    static IID => Guid("{f343d1a0-afe3-439f-b13d-cd87a43b70ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ID3D12Device>} pD3D12Device 
     * @param {Integer} NodeMask 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppvDSRDevice 
     * @returns {HRESULT} 
     */
    CreateDSRDevice(pD3D12Device, NodeMask, riid, ppvDSRDevice) {
        result := ComCall(3, this, "ptr", pD3D12Device, "uint", NodeMask, "ptr", riid, "ptr", ppvDSRDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
