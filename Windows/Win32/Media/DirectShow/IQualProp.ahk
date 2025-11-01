#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IQualProp interface provides methods for retrieving performance information from video renderers.
 * @see https://docs.microsoft.com/windows/win32/api//amvideo/nn-amvideo-iqualprop
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IQualProp extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IQualProp
     * @type {Guid}
     */
    static IID => Guid("{1bd0ecb0-f8e2-11ce-aac6-0020af0b99a3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_FramesDroppedInRenderer", "get_FramesDrawn", "get_AvgFrameRate", "get_Jitter", "get_AvgSyncOffset", "get_DevSyncOffset"]

    /**
     * 
     * @param {Pointer<Integer>} pcFrames 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-iqualprop-get_framesdroppedinrenderer
     */
    get_FramesDroppedInRenderer(pcFrames) {
        pcFramesMarshal := pcFrames is VarRef ? "int*" : "ptr"

        result := ComCall(3, this, pcFramesMarshal, pcFrames, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pcFramesDrawn 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-iqualprop-get_framesdrawn
     */
    get_FramesDrawn(pcFramesDrawn) {
        pcFramesDrawnMarshal := pcFramesDrawn is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pcFramesDrawnMarshal, pcFramesDrawn, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} piAvgFrameRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-iqualprop-get_avgframerate
     */
    get_AvgFrameRate(piAvgFrameRate) {
        piAvgFrameRateMarshal := piAvgFrameRate is VarRef ? "int*" : "ptr"

        result := ComCall(5, this, piAvgFrameRateMarshal, piAvgFrameRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} iJitter 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-iqualprop-get_jitter
     */
    get_Jitter(iJitter) {
        iJitterMarshal := iJitter is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, iJitterMarshal, iJitter, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} piAvg 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-iqualprop-get_avgsyncoffset
     */
    get_AvgSyncOffset(piAvg) {
        piAvgMarshal := piAvg is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, piAvgMarshal, piAvg, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} piDev 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-iqualprop-get_devsyncoffset
     */
    get_DevSyncOffset(piDev) {
        piDevMarshal := piDev is VarRef ? "int*" : "ptr"

        result := ComCall(8, this, piDevMarshal, piDev, "HRESULT")
        return result
    }
}
