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
     * @type {IMFVideoPresenter} 
     */
    Presenter {
        get => this.get_Presenter()
        set => this.put_Presenter(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    SuppressEffects {
        get => this.get_SuppressEffects()
        set => this.put_SuppressEffects(value)
    }

    /**
     * .
     * @returns {IMFVideoPresenter} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/evr/nn-evr-imfvideopresenter">IMFVideoPresenter</a> interface. This interface is documented in this Media Foundation SDK documentaion. The caller must release the interface.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidevr-get_presenter
     */
    get_Presenter() {
        result := ComCall(46, this, "ptr*", &ppAllocPresent := 0, "HRESULT")
        return IMFVideoPresenter(ppAllocPresent)
    }

    /**
     * The put_Presenter method sets the presenter object for the Enhanced Video Renderer (EVR) filter.
     * @param {IMFVideoPresenter} pAllocPresent Pointer to a presenter's <a href="https://docs.microsoft.com/windows/desktop/api/evr/nn-evr-imfvideopresenter">IMFVideoPresenter</a> interface. This interface is documented in this Media Foundation SDK documentaion.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidevr-put_presenter
     */
    put_Presenter(pAllocPresent) {
        result := ComCall(47, this, "ptr", pAllocPresent, "HRESULT")
        return result
    }

    /**
     * The put_SuppressEffects method specifies whether the Video Control configures the system for optimal video playback.
     * @param {VARIANT_BOOL} bSuppress Specifies a Boolean value. See Remarks for more information.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidevr-put_suppresseffects
     */
    put_SuppressEffects(bSuppress) {
        result := ComCall(48, this, "short", bSuppress, "HRESULT")
        return result
    }

    /**
     * The get_SuppressEffects method queries whether the Video Control configures the system for optimal video playback
     * @returns {VARIANT_BOOL} Receives a <b>VARIANT_BOOL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidevr-put_suppresseffects">IMSVidEVR::put_SuppressEffects</a>. The default value is VARIANT_TRUE.
     * @see https://docs.microsoft.com/windows/win32/api//segment/nf-segment-imsvidevr-get_suppresseffects
     */
    get_SuppressEffects() {
        result := ComCall(49, this, "short*", &bSuppress := 0, "HRESULT")
        return bSuppress
    }
}
