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
 * <b>Windows Phone 8:
 *         </b> This API is supported.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/nn-d3d11-id3d11devicechild
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class ID3D11DeviceChild extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D11DeviceChild
     * @type {Guid}
     */
    static IID => Guid("{1841e5c8-16b0-489b-bcc8-44cfb0d5deae}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDevice", "GetPrivateData", "SetPrivateData", "SetPrivateDataInterface"]

    /**
     * 
     * @param {Pointer<ID3D11Device>} ppDevice 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicechild-getdevice
     */
    GetDevice(ppDevice) {
        ComCall(3, this, "ptr*", ppDevice)
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Pointer<Integer>} pDataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicechild-getprivatedata
     */
    GetPrivateData(guid, pDataSize, pData) {
        pDataSizeMarshal := pDataSize is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr", guid, pDataSizeMarshal, pDataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {Integer} DataSize 
     * @param {Pointer} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicechild-setprivatedata
     */
    SetPrivateData(guid, DataSize, pData) {
        result := ComCall(5, this, "ptr", guid, "uint", DataSize, "ptr", pData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guid 
     * @param {IUnknown} pData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11devicechild-setprivatedatainterface
     */
    SetPrivateDataInterface(guid, pData) {
        result := ComCall(6, this, "ptr", guid, "ptr", pData, "HRESULT")
        return result
    }
}
