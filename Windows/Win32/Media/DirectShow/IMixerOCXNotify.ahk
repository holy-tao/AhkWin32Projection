#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMixerOCXNotify interface is implemented by clients and called by the Overlay Mixer to send notifications of events affecting the video display rectangle.
 * @see https://learn.microsoft.com/windows/win32/api/mixerocx/nn-mixerocx-imixerocxnotify
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IMixerOCXNotify extends IUnknown {
    /**
     * The interface identifier for IMixerOCXNotify
     * @type {Guid}
     */
    static IID := Guid("{81a3bd31-dee1-11d1-8508-00a0c91f9ca0}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMixerOCXNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        OnInvalidateRect : IntPtr
        OnStatusChange   : IntPtr
        OnDataChange     : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMixerOCXNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The OnInvalidateRect method notifies the client that the video rectangle has been invalidated.
     * @param {Pointer<RECT>} lpcRect Specifies the rectangle that has been invalidated, in screen coordinates.
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/mixerocx/nf-mixerocx-imixerocxnotify-oninvalidaterect
     */
    OnInvalidateRect(lpcRect) {
        result := ComCall(3, this, RECT.Ptr, lpcRect, "HRESULT")
        return result
    }

    /**
     * The OnStatusChange method informs the client that a status change has occurred.
     * @param {Integer} ulStatusFlags Bitwise OR of one or more of the following status flags.
     * 
     * <table>
     * <tr>
     * <th>Flag
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>MIXER_STATE_UNCONNECTED (0x00000000)</td>
     * <td>The Overlay Mixer is unconnected and stopped.</td>
     * </tr>
     * <tr>
     * <td>MIXER_STATE_CONNECTED_STOPPED (0x00000001)</td>
     * <td>The Overlay Mixer is connected and stopped.</td>
     * </tr>
     * <tr>
     * <td>MIXER_STATE_CONNECTED_PAUSED (0x00000002)</td>
     * <td>The Overlay Mixer is connected and paused.</td>
     * </tr>
     * <tr>
     * <td>MIXER_STATE_CONNECTED_PLAYING (0x00000003)</td>
     * <td>The Overlay Mixer is connected and playing.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/mixerocx/nf-mixerocx-imixerocxnotify-onstatuschange
     */
    OnStatusChange(ulStatusFlags) {
        result := ComCall(4, this, "uint", ulStatusFlags, "HRESULT")
        return result
    }

    /**
     * The OnDataChange method notifies the client when the video rectangle's aspect ratio or size, or the display palette, has changed.
     * @param {Integer} ulDataFlags Flag indicating which set of data has changed. The following flags are defined.
     * 
     * <table>
     * <tr>
     * <th>Flags
     *                 </th>
     * <th>Description
     *                 </th>
     * </tr>
     * <tr>
     * <td>MIXER_DATA_ASPECT_RATIO (0x00000001)</td>
     * <td>Picture aspect ratio.</td>
     * </tr>
     * <tr>
     * <td>MIXER_DATA_NATIVE_SIZE (0x00000002)</td>
     * <td>The video stream's native size changed.</td>
     * </tr>
     * <tr>
     * <td>MIXER_DATA_PALETTE (0x00000004)</td>
     * <td>The video palette changed.</td>
     * </tr>
     * </table>
     * @returns {HRESULT} If the method succeeds, it returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/mixerocx/nf-mixerocx-imixerocxnotify-ondatachange
     */
    OnDataChange(ulDataFlags) {
        result := ComCall(5, this, "uint", ulDataFlags, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMixerOCXNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.OnInvalidateRect := CallbackCreate(GetMethod(implObj, "OnInvalidateRect"), flags, 2)
        this.vtbl.OnStatusChange := CallbackCreate(GetMethod(implObj, "OnStatusChange"), flags, 2)
        this.vtbl.OnDataChange := CallbackCreate(GetMethod(implObj, "OnDataChange"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.OnInvalidateRect)
        CallbackFree(this.vtbl.OnStatusChange)
        CallbackFree(this.vtbl.OnDataChange)
    }
}
