#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Downgrades the frame rate on a digital video (DV) stream.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/nn-strmif-idvsplitter
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IDVSplitter extends IUnknown {
    /**
     * The interface identifier for IDVSplitter
     * @type {Guid}
     */
    static IID := Guid("{92a3a302-da7c-4a1f-ba7e-1802bb5d2d02}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDVSplitter interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        DiscardAlternateVideoFrames : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDVSplitter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The DiscardAlternateVideoFrames method discards half of the frames in the video stream. For NTSC, the frame rate is reduced from 30 frames per second (fps) to 15 fps. For PAL, the frame rate is reduced from 25 fps to 12.5 fps.
     * @param {Integer} nDiscard Flag that specifies whether to discard frames. If the value is non-zero, the filter discards alternate frames. If the value is zero, the filter delivers every frame.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include those shown in the following table.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Success.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_UNEXPECTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Filter is paused or running.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-idvsplitter-discardalternatevideoframes
     */
    DiscardAlternateVideoFrames(nDiscard) {
        result := ComCall(3, this, "int", nDiscard, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDVSplitter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.DiscardAlternateVideoFrames := CallbackCreate(GetMethod(implObj, "DiscardAlternateVideoFrames"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.DiscardAlternateVideoFrames)
    }
}
