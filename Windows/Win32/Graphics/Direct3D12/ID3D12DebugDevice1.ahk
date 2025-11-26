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
     * Modifies the D3D12 optional device-wide Debug Layer settings.
     * @param {Integer} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_device_parameter_type">D3D12_DEBUG_DEVICE_PARAMETER_TYPE</a></b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_device_parameter_type">D3D12_DEBUG_DEVICE_PARAMETER_TYPE</a> value that indicates which debug parameter data to get.
     * @param {Pointer} pData Type: <b>const void*</b>
     * 
     * Debug parameter data to set.
     * @param {Integer} DataSize Type: <b>UINT</b>
     * 
     * Size in bytes of the data pointed to by <i>pData</i>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice1-setdebugparameter
     */
    SetDebugParameter(Type, pData, DataSize) {
        result := ComCall(3, this, "int", Type, "ptr", pData, "uint", DataSize, "HRESULT")
        return result
    }

    /**
     * Gets optional device-wide Debug Layer settings.
     * @param {Integer} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_device_parameter_type">D3D12_DEBUG_DEVICE_PARAMETER_TYPE</a></b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_device_parameter_type">D3D12_DEBUG_DEVICE_PARAMETER_TYPE</a> value that indicates which debug parameter data to set.
     * @param {Pointer} pData Type: <b>void*</b>
     * 
     * Points to the memory that will be filled with a copy of the debug parameter data. The interpretation of this data depends on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_device_parameter_type">D3D12_DEBUG_DEVICE_PARAMETER_TYPE</a> given in the <i>Type</i> parameter.
     * @param {Integer} DataSize Type: <b>UINT</b>
     * 
     * Size in bytes of the memory buffer pointed to by <i>pData</i>.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice1-getdebugparameter
     */
    GetDebugParameter(Type, pData, DataSize) {
        result := ComCall(4, this, "int", Type, "ptr", pData, "uint", DataSize, "HRESULT")
        return result
    }

    /**
     * Specifies the amount of information to report on a device object's lifetime.
     * @param {Integer} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_rldo_flags">D3D12_RLDO_FLAGS</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_rldo_flags">D3D12_RLDO_FLAGS</a> enumeration. This method uses the value in <i>Flags</i> to determine the amount of information to report about a device object's lifetime.
     * @returns {HRESULT} Type: <b><a href="/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice1-reportlivedeviceobjects
     */
    ReportLiveDeviceObjects(Flags) {
        result := ComCall(5, this, "int", Flags, "HRESULT")
        return result
    }
}
