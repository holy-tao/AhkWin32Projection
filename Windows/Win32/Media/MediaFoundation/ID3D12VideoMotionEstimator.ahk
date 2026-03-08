#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Pageable.ahk

/**
 * This interface maintains context for video motion estimation operations.
 * @remarks
 * Create a new instance of this interface by calling [ID3D12VideoDevice1::CreateVideoMotionEstimator](nf-d3d12video-id3d12videodevice1-createvideomotionestimator.md).
 * 
 * This interface is passed into calls to [ID3D12VideoEncodeCommandList::EstimateMotion](nf-d3d12video-id3d12videoencodecommandlist-estimatemotion.md).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nn-d3d12video-id3d12videomotionestimator
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoMotionEstimator extends ID3D12Pageable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoMotionEstimator
     * @type {Guid}
     */
    static IID => Guid("{33fdae0e-098b-428f-87bb-34b695de08f8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDesc", "GetProtectedResourceSession"]

    /**
     * Gets the D3D12_VIDEO_MOTION_ESTIMATOR_DESC structure that was passed into ID3D12VideoDevice1::CreateVideoMotionEstimator) when the ID3D12VideoMotionEstimator was created.
     * @returns {D3D12_VIDEO_MOTION_ESTIMATOR_DESC} This method returns a **D3D12_VIDEO_MOTION_ESTIMATOR_DESC** structure.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videomotionestimator-getdesc
     */
    GetDesc() {
        result := ComCall(8, this, "ptr")
        return result
    }

    /**
     * Gets the ID3D12ProtectedResourceSession that was passed into ID3D12VideoDevice1::CreateVideoMotionEstimator when the ID3D12VideoMotionEstimator was created.
     * @param {Pointer<Guid>} riid The globally unique identifier (GUID) for the **ID3D12ProtectedResourceSession** interface.
     * @returns {Pointer<Void>} Receives a void pointer representing the **ID3D12ProtectedResourceSession** interface.
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videomotionestimator-getprotectedresourcesession
     */
    GetProtectedResourceSession(riid) {
        result := ComCall(9, this, "ptr", riid, "ptr*", &ppProtectedSession := 0, "HRESULT")
        return ppProtectedSession
    }
}
