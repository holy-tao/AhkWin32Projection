#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFVideoSampleAllocator.ahk" { IMFVideoSampleAllocator }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFAttributes.ahk" { IMFAttributes }
#Import ".\IMFMediaType.ahk" { IMFMediaType }

/**
 * Allocates video samples that contain Microsoft Direct3D 11 texture surfaces.
 * @remarks
 * You can use this interface to allocate Direct3D 11 video samples, rather than allocate the texture surfaces and media samples directly. To get a pointer to this interface, call the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatevideosampleallocatorex">MFCreateVideoSampleAllocatorEx</a> function. 
 * 
 * To allocate video samples, perform the following steps:
 * 
 * <ol>
 * <li>Obtain a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgidevicemanager">IMFDXGIDeviceManager</a> interface. For a Media Foundation transform (MFT), this step occurs during the <a href="https://docs.microsoft.com/windows/desktop/medfound/mft-message-set-d3d-manager">MFT_MESSAGE_SET_D3D_MANAGER</a> event.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreatevideosampleallocatorex">MFCreateVideoSampleAllocatorEx</a> to create the allocator object and get a pointer to the <b>IMFVideoSampleAllocatorEx</b> interface.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfvideosampleallocator-setdirectxmanager">IMFVideoSampleAllocator::SetDirectXManager</a> on the allocator to set the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfdxgidevicemanager">IMFDXGIDeviceManager</a> pointer on the allocator.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/nf-mfapi-mfcreateattributes">MFCreateAttributes</a> to get a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface.</li>
 * <li>Set the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-sa-d3d11-usage">MF_SA_D3D11_USAGE</a> and <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-sa-d3d11-bindflags">MF_SA_D3D11_BINDFLAGS</a> attributes.</li>
 * <li>Call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfvideosampleallocatorex-initializesampleallocatorex">IMFVideoSampleAllocator::InitializeSampleAllocatorEx</a>.</li>
 * </ol>
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfvideosampleallocatorex
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFVideoSampleAllocatorEx extends IMFVideoSampleAllocator {
    /**
     * The interface identifier for IMFVideoSampleAllocatorEx
     * @type {Guid}
     */
    static IID := Guid("{545b3a48-3283-4f62-866f-a62d8f598f9f}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFVideoSampleAllocatorEx interfaces
    */
    struct Vtbl extends IMFVideoSampleAllocator.Vtbl {
        InitializeSampleAllocatorEx : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFVideoSampleAllocatorEx.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Initializes the video sample allocator object.
     * @param {Integer} cInitialSamples The initial number of samples to allocate.
     * @param {Integer} cMaximumSamples The maximum number of samples to allocate.
     * @param {IMFAttributes} pAttributes A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfattributes">IMFAttributes</a> interface. You can use this interface to configure the allocator. Currently, the following configuration attributes are defined:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-sa-buffers-per-sample">MF_SA_BUFFERS_PER_SAMPLE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-sa-d3d11-bindflags">MF_SA_D3D11_BINDFLAGS</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-sa-d3d11-usage">MF_SA_D3D11_USAGE</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-sa-d3d11-shared">MF_SA_D3D11_SHARED</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-sa-d3d11-shared-without-mutex">MF_SA_D3D11_SHARED_WITHOUT_MUTEX</a>
     * </li>
     * </ul>
     * @param {IMFMediaType} pMediaType A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfmediatype">IMFMediaType</a> interface of a media type that describes the video format.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideosampleallocatorex-initializesampleallocatorex
     */
    InitializeSampleAllocatorEx(cInitialSamples, cMaximumSamples, pAttributes, pMediaType) {
        result := ComCall(7, this, "uint", cInitialSamples, "uint", cMaximumSamples, "ptr", pAttributes, "ptr", pMediaType, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFVideoSampleAllocatorEx.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.InitializeSampleAllocatorEx := CallbackCreate(GetMethod(implObj, "InitializeSampleAllocatorEx"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.InitializeSampleAllocatorEx)
    }
}
