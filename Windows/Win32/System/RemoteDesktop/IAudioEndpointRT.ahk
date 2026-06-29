#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\AE_CURRENT_POSITION.ahk" { AE_CURRENT_POSITION }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\Com\IUnknown.ahk" { IUnknown }

/**
 * Gets the difference between the current read and write positions in the endpoint buffer.
 * @remarks
 * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client 
 *     applications.
 * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nn-audioengineendpoint-iaudioendpointrt
 * @namespace Windows.Win32.System.RemoteDesktop
 */
export default struct IAudioEndpointRT extends IUnknown {
    /**
     * The interface identifier for IAudioEndpointRT
     * @type {Guid}
     */
    static IID := Guid("{dfd2005f-a6e5-4d39-a265-939ada9fbb4d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IAudioEndpointRT interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetCurrentPadding  : IntPtr
        ProcessingComplete : IntPtr
        SetPinInactive     : IntPtr
        SetPinActive       : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IAudioEndpointRT.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Gets the amount, in 100-nanosecond units, of data that is queued up in the endpoint.
     * @remarks
     * The audio engine uses this information to calculate the amount of data that requires processing.
     *     This calculation depends on the implementation.
     *     The  value of the <i>pPadding</i> parameter specifies the number of audio frames that are queued up to play in the endpoint buffer. Before writing to the endpoint buffer, the audio engine can calculate the amount of available space in the buffer by subtracting the padding value from the buffer length. For a CaptureStream endpoint, the padding value reported by the <b>GetCurrentPadding</b> method specifies the number of frames of capture data that are available in the next packet in the endpoint buffer and that might be ready for the audio engine to read from the buffer.
     * 
     * This method can be called from a real-time processing thread. The
     *     implementation of this method must not block, access
     *     paged memory, or call any blocking system routines.
     * 
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @param {Pointer<Integer>} pPadding Receives the number of frames available in the endpoint buffer.
     * @param {Pointer<AE_CURRENT_POSITION>} pAeCurrentPosition Receives information about the position of the  current frame in the endpoint buffer in an <a href="https://docs.microsoft.com/windows/desktop/api/audioengineendpoint/ns-audioengineendpoint-ae_current_position">AE_CURRENT_POSITION</a> structure specified by the caller.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointrt-getcurrentpadding
     */
    GetCurrentPadding(pPadding, pAeCurrentPosition) {
        pPaddingMarshal := pPadding is VarRef ? "int64*" : "ptr"

        ComCall(3, this, pPaddingMarshal, pPadding, AE_CURRENT_POSITION.Ptr, pAeCurrentPosition)
    }

    /**
     * Notifies the endpoint that a processing pass has been completed.
     * @remarks
     * This method enables the audio engine to call into the endpoint to set an event that indicates
     *     that a processing pass had been completed and that there is audio data ready to be retrieved or passed to
     *     the endpoint device.
     * 
     * This method can be called from a real-time processing thread. The
     *     implementation of this method must not block, access
     *     paged memory, or call any blocking system routines.
     * 
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointrt-processingcomplete
     */
    ProcessingComplete() {
        ComCall(4, this)
    }

    /**
     * Notifies the endpoint that it must change the state of the underlying stream resources to an inactive state.
     * @remarks
     * This method enables the audio engine to call into the endpoint to indicate that the endpoint can pause the underlying stream resources.  In most cases, this method can simply return <b>S_OK</b>.
     * 
     * This method can be called from a real-time processing thread. The
     *     implementation of this method must not block, access
     *     paged memory, or call any blocking system routines.
     * 
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointrt-setpininactive
     */
    SetPinInactive() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Notifies the endpoint that it must change the state of the underlying streaming resources to an active state.
     * @remarks
     * This method enables the audio engine to call into the endpoint to indicate that the endpoint must prepare any audio stream resources. In most cases, this method can simply return <b>S_OK</b>.
     * 
     * This method can be called from a real-time processing thread. The
     *     implementation of this method must not block, access
     *     paged memory, or call any blocking system routines.
     * 
     * The Remote Desktop Services AudioEndpoint API is for use in Remote Desktop scenarios; it is not for client applications.
     * @returns {HRESULT} If the method succeeds, it returns <b>S_OK</b>.
     * @see https://learn.microsoft.com/windows/win32/api/audioengineendpoint/nf-audioengineendpoint-iaudioendpointrt-setpinactive
     */
    SetPinActive() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IAudioEndpointRT.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetCurrentPadding := CallbackCreate(GetMethod(implObj, "GetCurrentPadding"), flags, 3)
        this.vtbl.ProcessingComplete := CallbackCreate(GetMethod(implObj, "ProcessingComplete"), flags, 1)
        this.vtbl.SetPinInactive := CallbackCreate(GetMethod(implObj, "SetPinInactive"), flags, 1)
        this.vtbl.SetPinActive := CallbackCreate(GetMethod(implObj, "SetPinActive"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetCurrentPadding)
        CallbackFree(this.vtbl.ProcessingComplete)
        CallbackFree(this.vtbl.SetPinInactive)
        CallbackFree(this.vtbl.SetPinActive)
    }
}
