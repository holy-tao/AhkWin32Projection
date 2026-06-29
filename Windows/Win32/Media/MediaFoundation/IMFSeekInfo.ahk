#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\System\Com\StructuredStorage\PROPVARIANT.ahk" { PROPVARIANT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * For a particular seek position, gets the two nearest key frames. (IMFSeekInfo)
 * @remarks
 * A media source can implement this interface as an optional service. To get a pointer to the interface, call <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-mfgetservice">IMFGetService::GetService</a> with the service identifier <b>MF_SCRUBBING_SERVICE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfseekinfo
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFSeekInfo extends IUnknown {
    /**
     * The interface identifier for IMFSeekInfo
     * @type {Guid}
     */
    static IID := Guid("{26afea53-d9ed-42b5-ab80-e64f9ee34779}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFSeekInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetNearestKeyFrames : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFSeekInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * For a particular seek position, gets the two nearest key frames. (IMFSeekInfo.GetNearestKeyFrames)
     * @remarks
     * If an application seeks to a non–key frame, the decoder must start decoding from the previous key frame. This can increase latency, because several frames might get decoded before the requested frame is reached. To reduce latency, an application can call this method to find the two key frames that are closest to the desired time, and then seek to one of those key frames.
     * @param {Pointer<Guid>} pguidTimeFormat A pointer to a GUID that specifies the time format. The time format defines the units for the other parameters of this method. If the value is <b>GUID_NULL</b>, the time format is 100-nanosecond units. Some media sources might support additional time format GUIDs.
     * @param {Pointer<PROPVARIANT>} pvarStartPosition The seek position. The units for this parameter are specified by <i>pguidTimeFormat</i>.
     * @param {Pointer<PROPVARIANT>} pvarPreviousKeyFrame Receives the position of the nearest key frame that appears earlier than <i>pvarStartPosition</i>. The units for this parameter are specified by <i>pguidTimeFormat</i>.
     * @param {Pointer<PROPVARIANT>} pvarNextKeyFrame Receives the position of the nearest key frame that appears later than <i>pvarStartPosition</i>. The units for this parameter are specified by <i>pguidTimeFormat</i>.
     * @returns {HRESULT} This method can return one of these values.
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
     * <dt><b>MF_E_UNSUPPORTED_TIME_FORMAT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The time format specified in <i>pguidTimeFormat</i> is not supported.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfseekinfo-getnearestkeyframes
     */
    GetNearestKeyFrames(pguidTimeFormat, pvarStartPosition, pvarPreviousKeyFrame, pvarNextKeyFrame) {
        result := ComCall(3, this, Guid.Ptr, pguidTimeFormat, PROPVARIANT.Ptr, pvarStartPosition, PROPVARIANT.Ptr, pvarPreviousKeyFrame, PROPVARIANT.Ptr, pvarNextKeyFrame, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFSeekInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetNearestKeyFrames := CallbackCreate(GetMethod(implObj, "GetNearestKeyFrames"), flags, 5)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetNearestKeyFrames)
    }
}
