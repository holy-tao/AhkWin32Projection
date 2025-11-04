#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Graphics\Direct3D12\ID3D12Pageable.ahk

/**
 * This interface maintains context for video motion estimation operations.
 * @remarks
 * 
  * Create a new instance of this interface by calling [ID3D12VideoDevice1::CreateVideoMotionEstimator](nf-d3d12video-id3d12videodevice1-createvideomotionestimator.md).
  * 
  * This interface is passed into calls to [ID3D12VideoEncodeCommandList::EstimateMotion](nf-d3d12video-id3d12videoencodecommandlist-estimatemotion.md).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/nn-d3d12video-id3d12videomotionestimator
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
     * 
     * @returns {D3D12_VIDEO_MOTION_ESTIMATOR_DESC} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videomotionestimator-getdesc
     */
    GetDesc() {
        result := ComCall(8, this, "ptr")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppProtectedSession 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videomotionestimator-getprotectedresourcesession
     */
    GetProtectedResourceSession(riid, ppProtectedSession) {
        ppProtectedSessionMarshal := ppProtectedSession is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "ptr", riid, ppProtectedSessionMarshal, ppProtectedSession, "HRESULT")
        return result
    }
}
