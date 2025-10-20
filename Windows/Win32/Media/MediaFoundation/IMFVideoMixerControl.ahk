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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetStreamZOrder", "GetStreamZOrder", "SetStreamOutputRect", "GetStreamOutputRect"]

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Integer} dwZ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideomixercontrol-setstreamzorder
     */
    SetStreamZOrder(dwStreamID, dwZ) {
        result := ComCall(3, this, "uint", dwStreamID, "uint", dwZ, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<Integer>} pdwZ 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideomixercontrol-getstreamzorder
     */
    GetStreamZOrder(dwStreamID, pdwZ) {
        result := ComCall(4, this, "uint", dwStreamID, "uint*", pdwZ, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<MFVideoNormalizedRect>} pnrcOutput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideomixercontrol-setstreamoutputrect
     */
    SetStreamOutputRect(dwStreamID, pnrcOutput) {
        result := ComCall(5, this, "uint", dwStreamID, "ptr", pnrcOutput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStreamID 
     * @param {Pointer<MFVideoNormalizedRect>} pnrcOutput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideomixercontrol-getstreamoutputrect
     */
    GetStreamOutputRect(dwStreamID, pnrcOutput) {
        result := ComCall(6, this, "uint", dwStreamID, "ptr", pnrcOutput, "HRESULT")
        return result
    }
}
