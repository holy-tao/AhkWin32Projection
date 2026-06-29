#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MFVP_MESSAGE_TYPE.ahk" { MFVP_MESSAGE_TYPE }
#Import ".\IMFVideoMediaType.ahk" { IMFVideoMediaType }
#Import ".\IMFClockStateSink.ahk" { IMFClockStateSink }

/**
 * Represents a video presenter. A video presenter is an object that receives video frames, typically from a video mixer, and presents them in some way, typically by rendering them to the display.
 * @see https://learn.microsoft.com/windows/win32/api/evr/nn-evr-imfvideopresenter
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFVideoPresenter extends IMFClockStateSink {
    /**
     * The interface identifier for IMFVideoPresenter
     * @type {Guid}
     */
    static IID := Guid("{29aff080-182a-4a5d-af3b-448f3a6346cb}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFVideoPresenter interfaces
    */
    struct Vtbl extends IMFClockStateSink.Vtbl {
        ProcessMessage      : IntPtr
        GetCurrentMediaType : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFVideoPresenter.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sends a message to the video presenter. Messages are used to signal the presenter that it must perform some action, or that some event has occurred.
     * @param {MFVP_MESSAGE_TYPE} eMessage Specifies the message as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/evr/ne-evr-mfvp_message_type">MFVP_MESSAGE_TYPE</a> enumeration.
     * @param {Pointer} ulParam Message parameter. The meaning of this parameter depends on the message type.
     * @returns {HRESULT} The method returns an HRESULT. Possible values include, but are not limited to, those in the following table.
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
     * The method succeeded.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>MF_E_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The video renderer has been shut down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideopresenter-processmessage
     */
    ProcessMessage(eMessage, ulParam) {
        result := ComCall(8, this, MFVP_MESSAGE_TYPE, eMessage, "ptr", ulParam, "HRESULT")
        return result
    }

    /**
     * Retrieves the presenter's media type.
     * @remarks
     * This method returns the media type that the presenter sets for the mixer's output type. It describes the format of the composited image.
     * @returns {IMFVideoMediaType} Receives a pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/mfobjects/nn-mfobjects-imfvideomediatype">IMFVideoMediaType</a> interface. The caller must release the interface.
     * @see https://learn.microsoft.com/windows/win32/api/evr/nf-evr-imfvideopresenter-getcurrentmediatype
     */
    GetCurrentMediaType() {
        result := ComCall(9, this, "ptr*", &ppMediaType := 0, "HRESULT")
        return IMFVideoMediaType(ppMediaType)
    }

    Query(iid) {
        if (IMFVideoPresenter.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.ProcessMessage := CallbackCreate(GetMethod(implObj, "ProcessMessage"), flags, 3)
        this.vtbl.GetCurrentMediaType := CallbackCreate(GetMethod(implObj, "GetCurrentMediaType"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.ProcessMessage)
        CallbackFree(this.vtbl.GetCurrentMediaType)
    }
}
