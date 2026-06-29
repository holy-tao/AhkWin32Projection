#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_RLDO_FLAGS.ahk" { D3D12_RLDO_FLAGS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\D3D12_DEBUG_DEVICE_PARAMETER_TYPE.ahk" { D3D12_DEBUG_DEVICE_PARAMETER_TYPE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Specifies device-wide debug layer settings.
 * @remarks
 * This interface is currently in Preview mode.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debugdevice1
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DebugDevice1 extends IUnknown {
    /**
     * The interface identifier for ID3D12DebugDevice1
     * @type {Guid}
     */
    static IID := Guid("{a9b71770-d099-4a65-a698-3dee10020f88}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DebugDevice1 interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDebugParameter       : IntPtr
        GetDebugParameter       : IntPtr
        ReportLiveDeviceObjects : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DebugDevice1.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Modifies the D3D12 optional device-wide Debug Layer settings.
     * @param {D3D12_DEBUG_DEVICE_PARAMETER_TYPE} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_device_parameter_type">D3D12_DEBUG_DEVICE_PARAMETER_TYPE</a></b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_device_parameter_type">D3D12_DEBUG_DEVICE_PARAMETER_TYPE</a> value that indicates which debug parameter data to get.
     * @param {Integer} pData Type: <b>const void*</b>
     * 
     * Debug parameter data to set.
     * @param {Integer} DataSize Type: <b>UINT</b>
     * 
     * Size in bytes of the data pointed to by <i>pData</i>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice1-setdebugparameter
     */
    SetDebugParameter(Type, pData, DataSize) {
        result := ComCall(3, this, D3D12_DEBUG_DEVICE_PARAMETER_TYPE, Type, "ptr", pData, "uint", DataSize, "HRESULT")
        return result
    }

    /**
     * Gets optional device-wide Debug Layer settings.
     * @param {D3D12_DEBUG_DEVICE_PARAMETER_TYPE} Type Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_device_parameter_type">D3D12_DEBUG_DEVICE_PARAMETER_TYPE</a></b>
     * 
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_device_parameter_type">D3D12_DEBUG_DEVICE_PARAMETER_TYPE</a> value that indicates which debug parameter data to set.
     * @param {Integer} pData Type: <b>void*</b>
     * 
     * Points to the memory that will be filled with a copy of the debug parameter data. The interpretation of this data depends on the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_device_parameter_type">D3D12_DEBUG_DEVICE_PARAMETER_TYPE</a> given in the <i>Type</i> parameter.
     * @param {Integer} DataSize Type: <b>UINT</b>
     * 
     * Size in bytes of the memory buffer pointed to by <i>pData</i>.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice1-getdebugparameter
     */
    GetDebugParameter(Type, pData, DataSize) {
        result := ComCall(4, this, D3D12_DEBUG_DEVICE_PARAMETER_TYPE, Type, "ptr", pData, "uint", DataSize, "HRESULT")
        return result
    }

    /**
     * Specifies the amount of information to report on a device object's lifetime.
     * @param {D3D12_RLDO_FLAGS} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_rldo_flags">D3D12_RLDO_FLAGS</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_rldo_flags">D3D12_RLDO_FLAGS</a> enumeration. This method uses the value in <i>Flags</i> to determine the amount of information to report about a device object's lifetime.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice1-reportlivedeviceobjects
     */
    ReportLiveDeviceObjects(Flags) {
        result := ComCall(5, this, D3D12_RLDO_FLAGS, Flags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D12DebugDevice1.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDebugParameter := CallbackCreate(GetMethod(implObj, "SetDebugParameter"), flags, 4)
        this.vtbl.GetDebugParameter := CallbackCreate(GetMethod(implObj, "GetDebugParameter"), flags, 4)
        this.vtbl.ReportLiveDeviceObjects := CallbackCreate(GetMethod(implObj, "ReportLiveDeviceObjects"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDebugParameter)
        CallbackFree(this.vtbl.GetDebugParameter)
        CallbackFree(this.vtbl.ReportLiveDeviceObjects)
    }
}
