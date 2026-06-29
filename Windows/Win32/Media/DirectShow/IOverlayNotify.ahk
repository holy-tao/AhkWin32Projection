#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Graphics\Gdi\RGNDATA.ahk" { RGNDATA }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\COLORKEY.ahk" { COLORKEY }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import "..\..\Graphics\Gdi\PALETTEENTRY.ahk" { PALETTEENTRY }

/**
 * The IOverlayNotify interface provides an upstream filter, such as a decoder, with notifications of changes to the rendering window.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-ioverlaynotify
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IOverlayNotify extends IUnknown {
    /**
     * The interface identifier for IOverlayNotify
     * @type {Guid}
     */
    static IID := Guid("{56a868a0-0ad4-11ce-b03a-0020af0ba770}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IOverlayNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnPaletteChange  : IntPtr
        OnClipChange     : IntPtr
        OnColorKeyChange : IntPtr
        OnPositionChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IOverlayNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The OnPaletteChange method provides notification that the palette of the window has changed.
     * @remarks
     * Before returning, the filter should copy the array of <b>RGBQUAD</b> values, if necessary.
     * @param {Integer} dwColors Number of colors present.
     * @param {Pointer<PALETTEENTRY>} pPalette Pointer to the array of palette colors.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ioverlaynotify-onpalettechange
     */
    OnPaletteChange(dwColors, pPalette) {
        result := ComCall(3, this, "uint", dwColors, PALETTEENTRY.Ptr, pPalette, "HRESULT")
        return result
    }

    /**
     * The OnClipChange method provides notification that the window's visible region has changed. It is essential that any overlay hardware be updated to reflect the change to the visible region before returning from this method.
     * @remarks
     * The calls to <c>OnClipChange</c> happen in synchronization with the window. It is called with an empty clip list to freeze the video before the window moves, and then called again when the window has stabilized with the new clip list.
     * 
     * If the window rectangle is all zeros, the window is invisible. As is the case for AVI decoders, the decoder should save the image if it relies on the current image to decode the next one.
     * @param {Pointer<RECT>} pSourceRect Pointer to the region of the video to use.
     * @param {Pointer<RECT>} pDestinationRect Pointer to the video destination.
     * @param {Pointer<RGNDATA>} pRgnData Pointer to the clipping information.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ioverlaynotify-onclipchange
     */
    OnClipChange(pSourceRect, pDestinationRect, pRgnData) {
        result := ComCall(4, this, RECT.Ptr, pSourceRect, RECT.Ptr, pDestinationRect, RGNDATA.Ptr, pRgnData, "HRESULT")
        return result
    }

    /**
     * The OnColorKeyChange method provides notification that the window's color key has changed.
     * @param {Pointer<COLORKEY>} pColorKey Pointer to the new chroma key.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ioverlaynotify-oncolorkeychange
     */
    OnColorKeyChange(pColorKey) {
        result := ComCall(5, this, COLORKEY.Ptr, pColorKey, "HRESULT")
        return result
    }

    /**
     * The OnPositionChange method provides notification that the position has changed.
     * @remarks
     * This method is a callback intended for use by hardware overlay cards that do not want the expense of synchronous clipping updates, and just want to know when the source or destination video positions change.
     * 
     * Unlike the <a href="https://docs.microsoft.com/windows/desktop/api/strmif/nf-strmif-ioverlaynotify-onclipchange">IOverlayNotify::OnClipChange</a> method, this method is not called in synchronization with the window changing but, rather, at some point after the window has changed (basically in time with WM_SIZE messages received). This is therefore suitable for overlay cards that do not inlay their data to the frame buffer.
     * @param {Pointer<RECT>} pSourceRect Pointer to the source video rectangle.
     * @param {Pointer<RECT>} pDestinationRect Pointer to the destination video rectangle. Note that this is not clipped to the visible display area.
     * @returns {HRESULT} Returns S_OK if successful. If the method fails, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-ioverlaynotify-onpositionchange
     */
    OnPositionChange(pSourceRect, pDestinationRect) {
        result := ComCall(6, this, RECT.Ptr, pSourceRect, RECT.Ptr, pDestinationRect, "HRESULT")
        return result
    }

    Query(iid) {
        if (IOverlayNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnPaletteChange := CallbackCreate(GetMethod(implObj, "OnPaletteChange"), flags, 3)
        this.vtbl.OnClipChange := CallbackCreate(GetMethod(implObj, "OnClipChange"), flags, 4)
        this.vtbl.OnColorKeyChange := CallbackCreate(GetMethod(implObj, "OnColorKeyChange"), flags, 2)
        this.vtbl.OnPositionChange := CallbackCreate(GetMethod(implObj, "OnPositionChange"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnPaletteChange)
        CallbackFree(this.vtbl.OnClipChange)
        CallbackFree(this.vtbl.OnColorKeyChange)
        CallbackFree(this.vtbl.OnPositionChange)
    }
}
