#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\D3D12_DEBUG_FEATURE.ahk" { D3D12_DEBUG_FEATURE }
#Import ".\D3D12_RLDO_FLAGS.ahk" { D3D12_RLDO_FLAGS }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * This interface represents a graphics device for debugging.
 * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nn-d3d12sdklayers-id3d12debugdevice
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct ID3D12DebugDevice extends IUnknown {
    /**
     * The interface identifier for ID3D12DebugDevice
     * @type {Guid}
     */
    static IID := Guid("{3febd6dd-4973-4787-8194-e45f9e28923e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D12DebugDevice interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetFeatureMask          : IntPtr
        GetFeatureMask          : IntPtr
        ReportLiveDeviceObjects : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D12DebugDevice.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Set a bit field of flags that will turn debug features on and off. (ID3D12DebugDevice.SetFeatureMask)
     * @param {D3D12_DEBUG_FEATURE} Mask Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_feature">D3D12_DEBUG_FEATURE</a></b>
     * 
     * Feature-mask flags, as a bitwise-OR'd combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_feature">D3D12_DEBUG_FEATURE</a> enumeration constants.
     *             If a flag is present, that feature will be set to on; otherwise, the feature will be set to off.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     *             <a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a>
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice-setfeaturemask
     */
    SetFeatureMask(Mask) {
        result := ComCall(3, this, D3D12_DEBUG_FEATURE, Mask, "HRESULT")
        return result
    }

    /**
     * Gets a bit field of flags that indicates which debug features are on or off.
     * @returns {D3D12_DEBUG_FEATURE} Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_feature">D3D12_DEBUG_FEATURE</a></b>
     * 
     * Mask of feature-mask flags,
     *             as a bitwise OR'ed combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_debug_feature">D3D12_DEBUG_FEATURE</a> enumeration constants.
     *             If a flag is present, then that feature will be set to on, otherwise the feature will be set to off.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice-getfeaturemask
     */
    GetFeatureMask() {
        result := ComCall(4, this, D3D12_DEBUG_FEATURE)
        return result
    }

    /**
     * Reports information about a device object's lifetime.
     * @param {D3D12_RLDO_FLAGS} Flags Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_rldo_flags">D3D12_RLDO_FLAGS</a></b>
     * 
     * A value from the <a href="https://docs.microsoft.com/windows/desktop/api/d3d12sdklayers/ne-d3d12sdklayers-d3d12_rldo_flags">D3D12_RLDO_FLAGS</a> enumeration.
     *             This method uses the value in <i>Flags</i> to determine the amount of information to report about a device object's lifetime.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * This method returns one of the <a href="https://docs.microsoft.com/windows/desktop/direct3d12/d3d12-graphics-reference-returnvalues">Direct3D 12 Return Codes</a>.
     *             <a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a>
     * @see https://learn.microsoft.com/windows/win32/api/d3d12sdklayers/nf-d3d12sdklayers-id3d12debugdevice-reportlivedeviceobjects
     */
    ReportLiveDeviceObjects(Flags) {
        result := ComCall(5, this, D3D12_RLDO_FLAGS, Flags, "HRESULT")
        return result
    }

    Query(iid) {
        if (ID3D12DebugDevice.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetFeatureMask := CallbackCreate(GetMethod(implObj, "SetFeatureMask"), flags, 2)
        this.vtbl.GetFeatureMask := CallbackCreate(GetMethod(implObj, "GetFeatureMask"), flags, 1)
        this.vtbl.ReportLiveDeviceObjects := CallbackCreate(GetMethod(implObj, "ReportLiveDeviceObjects"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetFeatureMask)
        CallbackFree(this.vtbl.GetFeatureMask)
        CallbackFree(this.vtbl.ReportLiveDeviceObjects)
    }
}
