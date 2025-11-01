#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface represents a graphics device for debugging.
 * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nn-d3d12sdklayers-id3d12debugdevice
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class ID3D12DebugDevice extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12DebugDevice
     * @type {Guid}
     */
    static IID => Guid("{3febd6dd-4973-4787-8194-e45f9e28923e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetFeatureMask", "GetFeatureMask", "ReportLiveDeviceObjects"]

    /**
     * 
     * @param {Integer} Mask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice-setfeaturemask
     */
    SetFeatureMask(Mask) {
        result := ComCall(3, this, "int", Mask, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice-getfeaturemask
     */
    GetFeatureMask() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice-reportlivedeviceobjects
     */
    ReportLiveDeviceObjects(Flags) {
        result := ComCall(5, this, "int", Flags, "HRESULT")
        return result
    }
}
