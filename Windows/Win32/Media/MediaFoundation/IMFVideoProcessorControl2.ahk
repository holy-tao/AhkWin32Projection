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
     * 
     * @param {Integer} uiRotation 
     * @returns {HRESULT} 
     */
    SetRotationOverride(uiRotation) {
        result := ComCall(9, this, "uint", uiRotation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} fEnabled 
     * @returns {HRESULT} 
     */
    EnableHardwareEffects(fEnabled) {
        result := ComCall(10, this, "int", fEnabled, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} puiSupport 
     * @returns {HRESULT} 
     */
    GetSupportedHardwareEffects(puiSupport) {
        result := ComCall(11, this, "uint*", puiSupport, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
