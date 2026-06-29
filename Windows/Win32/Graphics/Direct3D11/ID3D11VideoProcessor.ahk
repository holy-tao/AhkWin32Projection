#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\ID3D11DeviceChild.ahk" { ID3D11DeviceChild }
#Import ".\D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS.ahk" { D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS }
#Import ".\D3D11_VIDEO_PROCESSOR_CONTENT_DESC.ahk" { D3D11_VIDEO_PROCESSOR_CONTENT_DESC }

/**
 * Represents a video processor for Microsoft Direct3D 11.
 * @remarks
 * To get a pointer to this interface, call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videodevice-createvideoprocessor">ID3D11VideoDevice::CreateVideoProcessor</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/nn-d3d11-id3d11videoprocessor
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct ID3D11VideoProcessor extends ID3D11DeviceChild {
    /**
     * The interface identifier for ID3D11VideoProcessor
     * @type {Guid}
     */
    static IID := Guid("{1d7b0652-185f-41c6-85ce-0c5be3d4ae6c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ID3D11VideoProcessor interfaces
    */
    struct Vtbl extends ID3D11DeviceChild.Vtbl {
        GetContentDesc        : IntPtr
        GetRateConversionCaps : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ID3D11VideoProcessor.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the content description that was used to create the video processor.
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_CONTENT_DESC>} pDesc A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_content_desc">D3D11_VIDEO_PROCESSOR_CONTENT_DESC</a> structure that receives the content description.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videoprocessor-getcontentdesc
     */
    GetContentDesc(pDesc) {
        ComCall(7, this, D3D11_VIDEO_PROCESSOR_CONTENT_DESC.Ptr, pDesc)
    }

    /**
     * Gets the rate conversion capabilities of the video processor.
     * @param {Pointer<D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS>} pCaps A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_video_processor_rate_conversion_caps">D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS</a> structure that receives the rate conversion capabilities.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/d3d11/nf-d3d11-id3d11videoprocessor-getrateconversioncaps
     */
    GetRateConversionCaps(pCaps) {
        ComCall(8, this, D3D11_VIDEO_PROCESSOR_RATE_CONVERSION_CAPS.Ptr, pCaps)
    }

    Query(iid) {
        if (ID3D11VideoProcessor.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetContentDesc := CallbackCreate(GetMethod(implObj, "GetContentDesc"), flags, 2)
        this.vtbl.GetRateConversionCaps := CallbackCreate(GetMethod(implObj, "GetRateConversionCaps"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetContentDesc)
        CallbackFree(this.vtbl.GetRateConversionCaps)
    }
}
