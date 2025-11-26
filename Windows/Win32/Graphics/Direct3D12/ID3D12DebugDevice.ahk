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
     * Set a bit field of flags that will turn debug features on and off.
     * @param {Integer} Mask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_feature">D3D12_DEBUG_FEATURE</a></b>
     * 
     * Feature-mask flags, as a bitwise-OR'd combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_feature">D3D12_DEBUG_FEATURE</a> enumeration constants.
     *             If a flag is present, that feature will be set to on; otherwise, the feature will be set to off.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     *             <a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a>
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice-setfeaturemask
     */
    SetFeatureMask(Mask) {
        result := ComCall(3, this, "int", Mask, "HRESULT")
        return result
    }

    /**
     * Gets a bit field of flags that indicates which debug features are on or off.
     * @returns {Integer} Type: <b><a href="/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_feature">D3D12_DEBUG_FEATURE</a></b>
     * 
     * Mask of feature-mask flags,
     *             as a bitwise OR'ed combination of <a href="/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_feature">D3D12_DEBUG_FEATURE</a> enumeration constants.
     *             If a flag is present, then that feature will be set to on, otherwise the feature will be set to off.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice-getfeaturemask
     */
    GetFeatureMask() {
        result := ComCall(4, this, "int")
        return result
    }

    /**
     * Reports information about a device object's lifetime.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_rldo_flags">D3D12_RLDO_FLAGS</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_rldo_flags">D3D12_RLDO_FLAGS</a> enumeration.
     *             This method uses the value in <i>Flags</i> to determine the amount of information to report about a device object's lifetime.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     *             <a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a>
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice-reportlivedeviceobjects
     */
    ReportLiveDeviceObjects(Flags) {
        result := ComCall(5, this, "int", Flags, "HRESULT")
        return result
    }
}
