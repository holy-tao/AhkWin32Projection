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
     * @type {Integer} 
     */
    FramesDroppedInRenderer {
        get => this.get_FramesDroppedInRenderer()
    }

    /**
     * @type {Integer} 
     */
    FramesDrawn {
        get => this.get_FramesDrawn()
    }

    /**
     * @type {Integer} 
     */
    AvgFrameRate {
        get => this.get_AvgFrameRate()
    }

    /**
     * @type {Integer} 
     */
    Jitter {
        get => this.get_Jitter()
    }

    /**
     * @type {Integer} 
     */
    AvgSyncOffset {
        get => this.get_AvgSyncOffset()
    }

    /**
     * @type {Integer} 
     */
    DevSyncOffset {
        get => this.get_DevSyncOffset()
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-iqualprop-get_framesdroppedinrenderer
     */
    get_FramesDroppedInRenderer() {
        result := ComCall(3, this, "int*", &pcFrames := 0, "HRESULT")
        return pcFrames
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-iqualprop-get_framesdrawn
     */
    get_FramesDrawn() {
        result := ComCall(4, this, "int*", &pcFramesDrawn := 0, "HRESULT")
        return pcFramesDrawn
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-iqualprop-get_avgframerate
     */
    get_AvgFrameRate() {
        result := ComCall(5, this, "int*", &piAvgFrameRate := 0, "HRESULT")
        return piAvgFrameRate
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-iqualprop-get_jitter
     */
    get_Jitter() {
        result := ComCall(6, this, "int*", &iJitter := 0, "HRESULT")
        return iJitter
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-iqualprop-get_avgsyncoffset
     */
    get_AvgSyncOffset() {
        result := ComCall(7, this, "int*", &piAvg := 0, "HRESULT")
        return piAvg
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/amvideo/nf-amvideo-iqualprop-get_devsyncoffset
     */
    get_DevSyncOffset() {
        result := ComCall(8, this, "int*", &piDev := 0, "HRESULT")
        return piDev
    }
}
