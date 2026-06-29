#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\MediaFoundation\IMFVideoPresenter.ahk" { IMFVideoPresenter }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMSVidVideoRenderer.ahk" { IMSVidVideoRenderer }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * The IMSVidEVR interface represents the Enhanced Video Renderer (EVR) filter within the Video Control filter graph.
 * @remarks
 * To declare the interface identifier (IID) for this interface, use the <b>__uuidof</b> operator: <c>__uuidof(IMSVidEVR)</c>.
 * @see https://learn.microsoft.com/windows/win32/api/segment/nn-segment-imsvidevr
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct IMSVidEVR extends IMSVidVideoRenderer {
    /**
     * The interface identifier for IMSVidEVR
     * @type {Guid}
     */
    static IID := Guid("{15e496ae-82a8-4cf9-a6b6-c561dc60398f}")

    /**
     * The class identifier for MSVidEVR
     * @type {Guid}
     */
    static CLSID := Guid("{c45268a2-fa81-4e19-b1e3-72edbd60aeda}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMSVidEVR interfaces
    */
    struct Vtbl extends IMSVidVideoRenderer.Vtbl {
        get_Presenter       : IntPtr
        put_Presenter       : IntPtr
        put_SuppressEffects : IntPtr
        get_SuppressEffects : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMSVidEVR.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
     * @returns {IMFVideoPresenter} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/evr/nn-evr-imfvideopresenter">IMFVideoPresenter</a> interface. This interface is documented in this Media Foundation SDK documentation. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidevr-get_presenter
     */
    get_Presenter() {
        result := ComCall(46, this, "ptr*", &ppAllocPresent := 0, "HRESULT")
        return IMFVideoPresenter(ppAllocPresent)
    }

    /**
     * The put_Presenter method sets the presenter object for the Enhanced Video Renderer (EVR) filter.
     * @param {IMFVideoPresenter} pAllocPresent Pointer to a presenter's <a href="https://docs.microsoft.com/windows/desktop/api/evr/nn-evr-imfvideopresenter">IMFVideoPresenter</a> interface. This interface is documented in this Media Foundation SDK documentation.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidevr-put_presenter
     */
    put_Presenter(pAllocPresent) {
        result := ComCall(47, this, "ptr", pAllocPresent, "HRESULT")
        return result
    }

    /**
     * The put_SuppressEffects method specifies whether the Video Control configures the system for optimal video playback.
     * @remarks
     * If <i>bSuppress</i> equals VARIANT_TRUE, the Video Control configures several system parameters during video playback:
     * 
     * <ul>
     * <li>Disables the screen saver timeout.</li>
     * <li>Disables Microsoft ClearType smoothing.</li>
     * <li>Disables the drop shadow effect.</li>
     * <li>Disables alpha-blended mouse cursors.</li>
     * <li>Prevents the system from turning off the display (power management).</li>
     * </ul>
     * For applications based on the Windows Graphics Device Interface (GDI), these settings improve the video playback experience. When playback stops, the Video Control restores the original system settings.
     * 
     * If <i>bSuppress</i> equals VARIANT_FALSE, the Video Control does not modify any of these system settings.
     * 
     * The default value for this property is VARIANT_TRUE. Set this property to VARIANT_FALSE if your application wants to control all of the system settings; for example, if you are providing a custom presenter.
     * @param {VARIANT_BOOL} bSuppress Specifies a Boolean value. See Remarks for more information.
     * @returns {HRESULT} If the method succeeds, it returns S_OK. If it fails, it returns an error code.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidevr-put_suppresseffects
     */
    put_SuppressEffects(bSuppress) {
        result := ComCall(48, this, VARIANT_BOOL, bSuppress, "HRESULT")
        return result
    }

    /**
     * The get_SuppressEffects method queries whether the Video Control configures the system for optimal video playback
     * @returns {VARIANT_BOOL} Receives a <b>VARIANT_BOOL</b>. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/segment/nf-segment-imsvidevr-put_suppresseffects">IMSVidEVR::put_SuppressEffects</a>. The default value is VARIANT_TRUE.
     * @see https://learn.microsoft.com/windows/win32/api/segment/nf-segment-imsvidevr-get_suppresseffects
     */
    get_SuppressEffects() {
        result := ComCall(49, this, VARIANT_BOOL.Ptr, &bSuppress := 0, "HRESULT")
        return bSuppress
    }

    Query(iid) {
        if (IMSVidEVR.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.get_Presenter := CallbackCreate(GetMethod(implObj, "get_Presenter"), flags, 2)
        this.vtbl.put_Presenter := CallbackCreate(GetMethod(implObj, "put_Presenter"), flags, 2)
        this.vtbl.put_SuppressEffects := CallbackCreate(GetMethod(implObj, "put_SuppressEffects"), flags, 2)
        this.vtbl.get_SuppressEffects := CallbackCreate(GetMethod(implObj, "get_SuppressEffects"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.get_Presenter)
        CallbackFree(this.vtbl.put_Presenter)
        CallbackFree(this.vtbl.put_SuppressEffects)
        CallbackFree(this.vtbl.get_SuppressEffects)
    }
}
