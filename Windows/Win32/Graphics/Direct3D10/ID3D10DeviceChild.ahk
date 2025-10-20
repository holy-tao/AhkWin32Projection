#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * A device-child interface accesses data used by a device.
 * @remarks
 * 
  * There are several types of device child interfaces, all of which inherit this interface. They include shaders, state objects, and input layouts.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/nn-d3d10-id3d10devicechild
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class ID3D10DeviceChild extends IUnknown{
    /**
     * The interface identifier for ID3D10DeviceChild
     * @type {Guid}
     */
    static IID => Guid("{9b7e4c00-342c-4106-a19f-4f2704f689f0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<ID3D10Device>} ppDevice 
     * @returns {String} Nothing - always returns an empty string
     */
    GetDevice(ppDevice) {
        ComCall(3, this, "ptr", ppDevice)
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<UInt32>} pDataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     */
    GetPrivateData(guid, pDataSize, pData) {
        result := ComCall(4, this, "ptr", guid, "uint*", pDataSize, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     */
    SetPrivateData(guid, DataSize, pData) {
        result := ComCall(5, this, "ptr", guid, "uint", DataSize, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<IUnknown>} pData 
     * @returns {HRESULT} 
     */
    SetPrivateDataInterface(guid, pData) {
        result := ComCall(6, this, "ptr", guid, "ptr", pData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
