#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFVideoProcessorControl.ahk

/**
 * Configures the Video Processor MFT.
 * @remarks
 * 
 * This interface controls how the <a href="https://docs.microsoft.com/windows/desktop/medfound/video-processor-mft">Video Processor MFT</a> generates output frames.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfidl/nn-mfidl-imfvideoprocessorcontrol2
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoProcessorControl2 extends IMFVideoProcessorControl{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFVideoProcessorControl2
     * @type {Guid}
     */
    static IID => Guid("{bde633d3-e1dc-4a7f-a693-bbae399c4a20}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetRotationOverride", "EnableHardwareEffects", "GetSupportedHardwareEffects"]

    /**
     * Overrides the rotation operation that is performed in the video processor.
     * @param {Integer} uiRotation Type: <b>UINT</b>
     * 
     * Rotation value in degrees.  Typically, you can only use values from the <a href="https://docs.microsoft.com/windows/desktop/api/mfapi/ne-mfapi-mfvideorotationformat">MFVideoRotationFormat</a> enumeration.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfvideoprocessorcontrol2-setrotationoverride
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
     * If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfvideoprocessorcontrol2-enablehardwareeffects
     */
    EnableHardwareEffects(fEnabled) {
        result := ComCall(10, this, "int", fEnabled, "HRESULT")
        return result
    }

    /**
     * Returns the list of supported effects in the currently configured video processor.
     * @returns {Integer} Type: <b>UINT*</b>
     * 
     * A combination of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_video_processor_auto_stream_caps">D3D11_VIDEO_PROCESSOR_AUTO_STREAM_CAPS</a>-typed values that are combined by using a bitwise OR operation. The resulting value specifies the list of suppported effect capabilities.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-imfvideoprocessorcontrol2-getsupportedhardwareeffects
     */
    GetSupportedHardwareEffects() {
        result := ComCall(11, this, "uint*", &puiSupport := 0, "HRESULT")
        return puiSupport
    }
}
