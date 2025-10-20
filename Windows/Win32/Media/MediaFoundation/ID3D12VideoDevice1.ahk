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
     * 
     * @param {Pointer<D3D12_VIDEO_MOTION_ESTIMATOR_DESC>} pDesc 
     * @param {Pointer<ID3D12ProtectedResourceSession>} pProtectedResourceSession 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppVideoMotionEstimator 
     * @returns {HRESULT} 
     */
    CreateVideoMotionEstimator(pDesc, pProtectedResourceSession, riid, ppVideoMotionEstimator) {
        result := ComCall(7, this, "ptr", pDesc, "ptr", pProtectedResourceSession, "ptr", riid, "ptr", ppVideoMotionEstimator, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<D3D12_VIDEO_MOTION_VECTOR_HEAP_DESC>} pDesc 
     * @param {Pointer<ID3D12ProtectedResourceSession>} pProtectedResourceSession 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppVideoMotionVectorHeap 
     * @returns {HRESULT} 
     */
    CreateVideoMotionVectorHeap(pDesc, pProtectedResourceSession, riid, ppVideoMotionVectorHeap) {
        result := ComCall(8, this, "ptr", pDesc, "ptr", pProtectedResourceSession, "ptr", riid, "ptr", ppVideoMotionVectorHeap, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
