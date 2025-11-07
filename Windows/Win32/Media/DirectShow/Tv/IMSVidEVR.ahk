#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\MediaFoundation\IMFVideoPresenter.ahk
#Include .\IMSVidVideoRenderer.ahk

/**
 * The IMSVidEVR interface represents the Enhanced Video Renderer (EVR) filter within the Video Control filter graph.
 * @remarks
 * 
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidEVR)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//segment/nn-segment-imsvidevr
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class IMSVidEVR extends IMSVidVideoRenderer{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMSVidEVR
     * @type {Guid}
     */
    static IID => Guid("{15e496ae-82a8-4cf9-a6b6-c561dc60398f}")

    /**
     * The class identifier for MSVidEVR
     * @type {Guid}
     */
    static CLSID => Guid("{c45268a2-fa81-4e19-b1e3-72edbd60aeda}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 46

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Presenter", "put_Presenter", "put_SuppressEffects", "get_SuppressEffects"]

    /**
     * 
     * @returns {IMFVideoPresenter} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidevr-get_presenter
     */
    get_Presenter() {
        result := ComCall(46, this, "ptr*", &ppAllocPresent := 0, "HRESULT")
        return IMFVideoPresenter(ppAllocPresent)
    }

    /**
     * 
     * @param {IMFVideoPresenter} pAllocPresent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidevr-put_presenter
     */
    put_Presenter(pAllocPresent) {
        result := ComCall(47, this, "ptr", pAllocPresent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} bSuppress 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidevr-put_suppresseffects
     */
    put_SuppressEffects(bSuppress) {
        result := ComCall(48, this, "short", bSuppress, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidevr-get_suppresseffects
     */
    get_SuppressEffects() {
        result := ComCall(49, this, "short*", &bSuppress := 0, "HRESULT")
        return bSuppress
    }
}
