#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12DeviceChild.ahk

/**
 * Represents facilities for controlling the lifetime a lifetime-tracked object.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12/nn-d3d12-id3d12lifetimetracker
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12LifetimeTracker extends ID3D12DeviceChild{
    /**
     * The interface identifier for ID3D12LifetimeTracker
     * @type {Guid}
     */
    static IID => Guid("{3fd03d36-4eb1-424a-a582-494ecb8ba813}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * 
     * @param {Pointer<ID3D12DeviceChild>} pObject 
     * @returns {HRESULT} 
     */
    DestroyOwnedObject(pObject) {
        result := ComCall(8, this, "ptr", pObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
