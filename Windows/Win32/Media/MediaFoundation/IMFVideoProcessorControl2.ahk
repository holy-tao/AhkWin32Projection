#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFVideoProcessorControl.ahk" { IMFVideoProcessorControl }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Configures the Video Processor MFT. (IMFVideoProcessorControl2)
 * @remarks
 * This interface controls how the <a href="https://docs.microsoft.com/windows/desktop/medfound/video-processor-mft">Video Processor MFT</a> generates output frames.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfvideoprocessorcontrol2
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFVideoProcessorControl2 extends IMFVideoProcessorControl {
    /**
     * The interface identifier for IMFVideoProcessorControl2
     * @type {Guid}
     */
    static IID := Guid("{bde633d3-e1dc-4a7f-a693-bbae399c4a20}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFVideoProcessorControl2 interfaces
    */
    struct Vtbl extends IMFVideoProcessorControl.Vtbl {
        SetRotationOverride         : IntPtr
        EnableHardwareEffects       : IntPtr
        GetSupportedHardwareEffects : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFVideoProcessorControl2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Overrides the rotation operation that is performed in the video processor.
     * @param {Integer} uiRotation Type: <b>UINT</b>
     * 
     * Rotation value in degrees.  Typically, you can only use values from the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ne-mfapi-mfvideorotationformat">MFVideoRotationFormat</a> enumeration.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideoprocessorcontrol2-setrotationoverride
     */
    SetRotationOverride(uiRotation) {
        result := ComCall(9, this, "uint", uiRotation, "HRESULT")
        return result
    }

    /**
     * Enables effects that were implemented with IDirectXVideoProcessor::VideoProcessorBlt.
     * @param {BOOL} fEnabled Type: <b>BOOL</b>
     * 
     * Specifies whether effects are to be enabled. <b>TRUE</b> specifies to enable effects. <b>FALSE</b> specifies to disable effects.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideoprocessorcontrol2-enablehardwareeffects
     */
    EnableHardwareEffects(fEnabled) {
        result := ComCall(10, this, BOOL, fEnabled, "HRESULT")
        return result
    }

    /**
     * Returns the list of supported effects in the currently configured video processor.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_auto_stream_caps">D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies the list of supported effect capabilities.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideoprocessorcontrol2-getsupportedhardwareeffects
     */
    GetSupportedHardwareEffects() {
        result := ComCall(11, this, "uint*", &puiSupport := 0, "HRESULT")
        return puiSupport
    }

    Query(iid) {
        if (IMFVideoProcessorControl2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetRotationOverride := CallbackCreate(GetMethod(implObj, "SetRotationOverride"), flags, 2)
        this.vtbl.EnableHardwareEffects := CallbackCreate(GetMethod(implObj, "EnableHardwareEffects"), flags, 2)
        this.vtbl.GetSupportedHardwareEffects := CallbackCreate(GetMethod(implObj, "GetSupportedHardwareEffects"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetRotationOverride)
        CallbackFree(this.vtbl.EnableHardwareEffects)
        CallbackFree(this.vtbl.GetSupportedHardwareEffects)
    }
}
