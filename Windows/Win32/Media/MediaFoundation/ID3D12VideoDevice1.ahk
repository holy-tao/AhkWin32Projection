#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ID3D12VideoDevice.ahk

/**
 * Adds support for motion estimation.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d12video/nn-d3d12video-id3d12videodevice1
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class ID3D12VideoDevice1 extends ID3D12VideoDevice{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ID3D12VideoDevice1
     * @type {Guid}
     */
    static IID => Guid("{981611ad-a144-4c83-9890-f30e26d658ab}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateVideoMotionEstimator", "CreateVideoMotionVectorHeap"]

    /**
     * 
     * @param {Pointer<D3D12_VIDEO_MOTION_ESTIMATOR_DESC>} pDesc 
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppVideoMotionEstimator 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice1-createvideomotionestimator
     */
    CreateVideoMotionEstimator(pDesc, pProtectedResourceSession, riid, ppVideoMotionEstimator) {
        ppVideoMotionEstimatorMarshal := ppVideoMotionEstimator is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "ptr", pDesc, "ptr", pProtectedResourceSession, "ptr", riid, ppVideoMotionEstimatorMarshal, ppVideoMotionEstimator, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC>} pDesc 
     * @param {ID3D12ProtectedResourceSession} pProtectedResourceSession 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Pointer<Void>>} ppVideoMotionVectorHeap 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/d3d12video/nf-d3d12video-id3d12videodevice1-createvideomotionvectorheap
     */
    CreateVideoMotionVectorHeap(pDesc, pProtectedResourceSession, riid, ppVideoMotionVectorHeap) {
        ppVideoMotionVectorHeapMarshal := ppVideoMotionVectorHeap is VarRef ? "ptr*" : "ptr"

        result := ComCall(8, this, "ptr", pDesc, "ptr", pProtectedResourceSession, "ptr", riid, ppVideoMotionVectorHeapMarshal, ppVideoMotionVectorHeap, "HRESULT")
        return result
    }
}
