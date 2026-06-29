#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MF_QUALITY_LEVEL.ahk" { MF_QUALITY_LEVEL }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\MF_QUALITY_DROP_MODE.ahk" { MF_QUALITY_DROP_MODE }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Enables the quality manager to adjust the audio or video quality of a component in the pipeline.
 * @remarks
 * The quality manager typically obtains this interface when the quality manager's <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/nf-mfidl-imfqualitymanager-notifytopology">IMFQualityManager::NotifyTopology</a> method is called.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/nn-mfidl-imfqualityadvise
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFQualityAdvise extends IUnknown {
    /**
     * The interface identifier for IMFQualityAdvise
     * @type {Guid}
     */
    static IID := Guid("{ec15e2e9-e36b-4f7c-8758-77d452ef4ce7}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFQualityAdvise interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDropMode     : IntPtr
        SetQualityLevel : IntPtr
        GetDropMode     : IntPtr
        GetQualityLevel : IntPtr
        DropTime        : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFQualityAdvise.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the drop mode. In drop mode, a component drops samples, more or less aggressively depending on the level of the drop mode.
     * @remarks
     * If this method is called on a media source, the media source might switch between thinned and non-thinned output. If that occurs, the affected streams will send an <a href="https://docs.microsoft.com/windows/desktop/medfound/mestreamthinmode">MEStreamThinMode</a> event to indicate the transition. The operation is asynchronous; after <b>SetDropMode</b> returns, you might receive samples that were queued before the transition. The MEStreamThinMode event marks the exact point in the stream where the transition occurs.
     * @param {MF_QUALITY_DROP_MODE} eDropMode Requested drop mode, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_quality_drop_mode">MF_QUALITY_DROP_MODE</a> enumeration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>MF_E_NO_MORE_DROP_MODES</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The component does not support the specified mode or any higher modes.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualityadvise-setdropmode
     */
    SetDropMode(eDropMode) {
        result := ComCall(3, this, MF_QUALITY_DROP_MODE, eDropMode, "HRESULT")
        return result
    }

    /**
     * Sets the quality level. The quality level determines how the component consumes or produces samples.
     * @param {MF_QUALITY_LEVEL} eQualityLevel Requested quality level, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_quality_level">MF_QUALITY_LEVEL</a> enumeration.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>MF_E_NO_MORE_QUALITY_LEVELS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The component does not support the specified quality level or any levels below it.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualityadvise-setqualitylevel
     */
    SetQualityLevel(eQualityLevel) {
        result := ComCall(4, this, MF_QUALITY_LEVEL, eQualityLevel, "HRESULT")
        return result
    }

    /**
     * Retrieves the current drop mode.
     * @returns {MF_QUALITY_DROP_MODE} Receives the drop mode, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_quality_drop_mode">MF_QUALITY_DROP_MODE</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualityadvise-getdropmode
     */
    GetDropMode() {
        result := ComCall(5, this, "int*", &peDropMode := 0, "HRESULT")
        return peDropMode
    }

    /**
     * Retrieves the current quality level.
     * @returns {MF_QUALITY_LEVEL} Receives the quality level, specified as a member of the <a href="https://docs.microsoft.com/windows/desktop/api/mfidl/ne-mfidl-mf_quality_level">MF_QUALITY_LEVEL</a> enumeration.
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualityadvise-getqualitylevel
     */
    GetQualityLevel() {
        result := ComCall(6, this, "int*", &peQualityLevel := 0, "HRESULT")
        return peQualityLevel
    }

    /**
     * Drops samples over a specified interval of time.
     * @remarks
     * Ideally the quality manager can prevent a renderer from falling behind. But if this does occur, then simply lowering quality does not guarantee the renderer will ever catch up. As a result, audio and video might fall out of sync. To correct this problem, the quality manager can call <b>DropTime</b> to request that the renderer drop samples quickly over a specified time interval. After that period, the renderer stops dropping samples.
     * 
     * This method is primarily intended for the video renderer. Dropped audio samples cause audio glitching, which is not desirable.
     * 
     * If a component does not support this method, it should return MF_E_DROPTIME_NOT_SUPPORTED.
     * @param {Integer} hnsAmountToDrop Amount of time to drop, in 100-nanosecond units. This value is always absolute. If the method is called multiple times, do not add the times from previous calls.
     * @returns {HRESULT} The method returns an <b>HRESULT</b>. Possible values include, but are not limited to, those in the following table.
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
     * <dt><b>MF_E_DROPTIME_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The object does not support this method.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/mfidl/nf-mfidl-imfqualityadvise-droptime
     */
    DropTime(hnsAmountToDrop) {
        result := ComCall(7, this, "int64", hnsAmountToDrop, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFQualityAdvise.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDropMode := CallbackCreate(GetMethod(implObj, "SetDropMode"), flags, 2)
        this.vtbl.SetQualityLevel := CallbackCreate(GetMethod(implObj, "SetQualityLevel"), flags, 2)
        this.vtbl.GetDropMode := CallbackCreate(GetMethod(implObj, "GetDropMode"), flags, 2)
        this.vtbl.GetQualityLevel := CallbackCreate(GetMethod(implObj, "GetQualityLevel"), flags, 2)
        this.vtbl.DropTime := CallbackCreate(GetMethod(implObj, "DropTime"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDropMode)
        CallbackFree(this.vtbl.SetQualityLevel)
        CallbackFree(this.vtbl.GetDropMode)
        CallbackFree(this.vtbl.GetQualityLevel)
        CallbackFree(this.vtbl.DropTime)
    }
}
