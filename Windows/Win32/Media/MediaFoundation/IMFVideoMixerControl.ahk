#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Controls how the Enhanced Video Renderer (EVR) mixes video substreams.
 * @see https://docs.microsoft.com/windows/win32/api//evr/nn-evr-imfvideomixercontrol
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFVideoMixerControl extends IUnknown{
    /**
     * The interface identifier for IMFVideoMixerControl
     * @type {Guid}
     */
    static IID => Guid("{a5c6c53f-c202-4aa5-9695-175ba8c508a5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Integer} dwZ 
     * @returns {HRESULT} 
     */
    SetStreamZOrder(dwStreamID, dwZ) {
        result := ComCall(3, this, "uint", dwStreamID, "uint", dwZ, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<UInt32>} pdwZ 
     * @returns {HRESULT} 
     */
    GetStreamZOrder(dwStreamID, pdwZ) {
        result := ComCall(4, this, "uint", dwStreamID, "uint*", pdwZ, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<MFVideoNormalizedRect>} pnrcOutput 
     * @returns {HRESULT} 
     */
    SetStreamOutputRect(dwStreamID, pnrcOutput) {
        result := ComCall(5, this, "uint", dwStreamID, "ptr", pnrcOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<MFVideoNormalizedRect>} pnrcOutput 
     * @returns {HRESULT} 
     */
    GetStreamOutputRect(dwStreamID, pnrcOutput) {
        result := ComCall(6, this, "uint", dwStreamID, "ptr", pnrcOutput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
