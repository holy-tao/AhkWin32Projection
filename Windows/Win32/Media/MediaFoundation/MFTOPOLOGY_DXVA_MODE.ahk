#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies whether the topology loader enables Microsoft DirectX Video Acceleration (DXVA) in the topology.
 * @remarks
 * 
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-topology-dxva-mode">MF_TOPOLOGY_DXVA_MODE</a> topology attribute.
 * 
 * If an MFT supports DXVA, the MFT must return <b>TRUE</b> for the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-sa-d3d-aware-attribute">MF_SA_D3D_AWARE</a> attribute. To enable DXVA, the topology loader calls <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processmessage">IMFTransform::ProcessMessage</a> on the MFT, passing the MFT a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/nn-dxva2api-idirect3ddevicemanager9">IDirect3DDeviceManager9</a> interface. The topology loader gets the <b>IDirect3DDeviceManager9</b> pointer from the media sink for the video stream. Typically the enhanced video renderer (EVR) is the media sink.
 * 
 * Previous versions of Microsoft Media Foundation supported DXVA only for decoders.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/ne-mfidl-mftopology_dxva_mode
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class MFTOPOLOGY_DXVA_MODE{

    /**
     * The topology loader enables DXVA
     * on the decoder if possible, and drops optional Media Foundation transforms (MFTs) that do not support DXVA.
     * @type {Integer (Int32)}
     */
    static MFTOPOLOGY_DXVA_DEFAULT => 0

    /**
     * The topology loader disables all video acceleration. This setting forces software processing, even when the decoder supports DXVA.
     * @type {Integer (Int32)}
     */
    static MFTOPOLOGY_DXVA_NONE => 1

    /**
     * The topology loader enables DXVA on every MFT that supports it.
     * @type {Integer (Int32)}
     */
    static MFTOPOLOGY_DXVA_FULL => 2
}
