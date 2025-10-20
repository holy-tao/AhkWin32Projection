#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Specifies device-wide debug layer settings.
 * @remarks
 * 
  * This interface is currently in Preview mode.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nn-d3d12sdklayers-id3d12debugdevice1
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DebugDevice1 extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12DebugDevice1
     * @type {Guid}
     */
    static IID => Guid("{a9b71770-d099-4a65-a698-3dee10020f88}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDebugParameter", "GetDebugParameter", "ReportLiveDeviceObjects"]

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer} pData 
     * @param {Integer} DataSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice1-setdebugparameter
     */
    SetDebugParameter(Type, pData, DataSize) {
        result := ComCall(3, this, "int", Type, "ptr", pData, "uint", DataSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Type 
     * @param {Pointer} pData 
     * @param {Integer} DataSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice1-getdebugparameter
     */
    GetDebugParameter(Type, pData, DataSize) {
        result := ComCall(4, this, "int", Type, "ptr", pData, "uint", DataSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice1-reportlivedeviceobjects
     */
    ReportLiveDeviceObjects(Flags) {
        result := ComCall(5, this, "int", Flags, "HRESULT")
        return result
    }
}
