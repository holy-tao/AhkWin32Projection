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
     * 
     * @param {Integer} Mask 
     * @returns {HRESULT} 
     */
    SetFeatureMask(Mask) {
        result := ComCall(3, this, "int", Mask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    GetFeatureMask() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * 
     * @param {Integer} Flags 
     * @returns {HRESULT} 
     */
    ReportLiveDeviceObjects(Flags) {
        result := ComCall(5, this, "int", Flags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
