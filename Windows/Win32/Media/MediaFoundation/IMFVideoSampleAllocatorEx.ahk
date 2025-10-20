#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFVideoSampleAllocator.ahk

/**
 * Allocates video samples that contain Microsoft Direct3D 11 texture surfaces.
 * @remarks
 * 
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
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfvideosampleallocatorex
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoSampleAllocatorEx extends IMFVideoSampleAllocator{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFVideoSampleAllocatorEx
     * @type {Guid}
     */
    static IID => Guid("{545b3a48-3283-4f62-866f-a62d8f598f9f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["InitializeSampleAllocatorEx"]

    /**
     * 
     * @param {Integer} cInitialSamples 
     * @param {Integer} cMaximumSamples 
     * @param {IMFAttributes} pAttributes 
     * @param {IMFMediaType} pMediaType 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfvideosampleallocatorex-initializesampleallocatorex
     */
    InitializeSampleAllocatorEx(cInitialSamples, cMaximumSamples, pAttributes, pMediaType) {
        result := ComCall(7, this, "uint", cInitialSamples, "uint", cMaximumSamples, "ptr", pAttributes, "ptr", pMediaType, "HRESULT")
        return result
    }
}
