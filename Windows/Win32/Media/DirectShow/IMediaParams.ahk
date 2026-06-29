#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MP_ENVELOPE_SEGMENT.ahk" { MP_ENVELOPE_SEGMENT }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMediaParams interface sets and retrieves envelope-following parameters on an object.
 * @see https://learn.microsoft.com/windows/win32/api/medparam/nn-medparam-imediaparams
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IMediaParams extends IUnknown {
    /**
     * The interface identifier for IMediaParams
     * @type {Guid}
     */
    static IID := Guid("{6d6cbb61-a223-44aa-842f-a2f06750be6e}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMediaParams interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetParam      : IntPtr
        SetParam      : IntPtr
        AddEnvelope   : IntPtr
        FlushEnvelope : IntPtr
        SetTimeFormat : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMediaParams.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetParam method retrieves the current value of the specified parameter. If the parameter is currently within an envelope segment, the returned value is the value on the most recently processed sample.
     * @remarks
     * To enumerate the parameters supported by this object, along with their index values, use the <a href="https://docs.microsoft.com/windows/desktop/api/medparam/nn-medparam-imediaparaminfo">IMediaParamInfo</a> interface.
     * @param {Integer} dwParamIndex Zero-based index of the parameter.
     * @returns {Float} Pointer to a variable of type <b>MP_DATA</b> that receives the parameter value.
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparams-getparam
     */
    GetParam(dwParamIndex) {
        result := ComCall(3, this, "uint", dwParamIndex, "float*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The SetParam method sets the value of a parameter.
     * @remarks
     * If the parameter is currently within an envelope segment, the envelope segment will overwrite the new value. To remove an envelope segment, call the <a href="https://docs.microsoft.com/windows/desktop/api/medparam/nf-medparam-imediaparams-flushenvelope">FlushEnvelope</a> method.
     * 
     * To enumerate the parameters supported by this object, along with their index values, use the <a href="https://docs.microsoft.com/windows/desktop/api/medparam/nn-medparam-imediaparaminfo">IMediaParamInfo</a> interface.
     * @param {Integer} dwParamIndex Zero-based index of the parameter, or DWORD_ALLPARAMS to apply the value to every parameter.
     * @param {Float} value New value of the parameter.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Index out of range, or illegal parameter value.
     * 
     * </td>
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparams-setparam
     */
    SetParam(dwParamIndex, value) {
        result := ComCall(4, this, "uint", dwParamIndex, "float", value, "HRESULT")
        return result
    }

    /**
     * The AddEnvelope method adds an envelope to a parameter.
     * @remarks
     * The caller should add envelopes in time-ascending order. Otherwise, the results on playback are indeterminate. If one envelope overlaps another, the later envelope takes precedence.
     * 
     * To enumerate the parameters supported by this object, along with their index values, use the <a href="https://docs.microsoft.com/windows/desktop/api/medparam/nn-medparam-imediaparaminfo">IMediaParamInfo</a> interface.
     * @param {Integer} dwParamIndex Zero-based index of the parameter, or DWORD_ALLPARAMS to add the envelope to every parameter.
     * @param {Integer} cSegments Number of segments in the envelope.
     * @param {Pointer<MP_ENVELOPE_SEGMENT>} pEnvelopeSegments Pointer to an array of <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/medparam/ns-medparam-mp_envelope_segment">MP_ENVELOPE_SEGMENT</a> structures that define the envelope segments. The size of the array is given in the <i>cPoints</i> parameter.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Index out of range.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMEORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Insufficient memory.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <b>NULL</b> pointer argument.
     * 
     * </td>
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparams-addenvelope
     */
    AddEnvelope(dwParamIndex, cSegments, pEnvelopeSegments) {
        result := ComCall(5, this, "uint", dwParamIndex, "uint", cSegments, MP_ENVELOPE_SEGMENT.Ptr, pEnvelopeSegments, "HRESULT")
        return result
    }

    /**
     * The FlushEnvelope method flushes envelope data for a specified parameter over the specified time range.
     * @remarks
     * If the time span specified by <i>refTimeStart</i> and <i>refTimeEnd</i> overlaps an envelope segment, the entire segment is flushed. On the other hand, if it falls on the boundary of an envelope segment, the entire segment is retained. Thus:
     * 
     * <ul>
     * <li>If the start time falls inside an envelope segment, the segment is flushed.</li>
     * <li>If the end time falls inside an envelope segment, the segment is flushed.</li>
     * <li>If the start time equals the end time of an envelope segment, the segment is retained.</li>
     * <li>If the end time equals the start time of an envelope segment, the segment is retained.</li>
     * </ul>
     * To enumerate the parameters supported by this object, along with their index values, use the <a href="https://docs.microsoft.com/windows/desktop/api/medparam/nn-medparam-imediaparaminfo">IMediaParamInfo</a> interface.
     * @param {Integer} dwParamIndex Zero-based index of the parameter, or DWORD_ALLPARAMS to flush envelope data from every parameter.
     * @param {Integer} refTimeStart Start time of the envelope data to flush.
     * @param {Integer} refTimeEnd Stop time of the envelope data to flush.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Index out of range.
     * 
     * </td>
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparams-flushenvelope
     */
    FlushEnvelope(dwParamIndex, refTimeStart, refTimeEnd) {
        result := ComCall(6, this, "uint", dwParamIndex, "int64", refTimeStart, "int64", refTimeEnd, "HRESULT")
        return result
    }

    /**
     * The SetTimeFormat method specifies the time format for the object.
     * @remarks
     * Objects can support more than one time format. Every object must support reference time, in which each unit of time is 100 nanoseconds (ns). Other formats are optional. The application must ensure that time stamps on the input buffers match whatever time format was set using this method.
     * 
     * The meaning of the <i>mpTimeData</i> parameter depends on the value of the <i>guidTimeFormat</i> parameter.
     * 
     * <table>
     * <tr>
     * <th>Time Format
     *             </th>
     * <th>Meaning of Time Data
     *             </th>
     * </tr>
     * <tr>
     * <td>GUID_TIME_MUSIC</td>
     * <td>Parts per quarter note.</td>
     * </tr>
     * <tr>
     * <td>GUID_TIME_REFERENCE</td>
     * <td>Ignored.</td>
     * </tr>
     * <tr>
     * <td>GUID_TIME_SAMPLES</td>
     * <td>Samples per second.</td>
     * </tr>
     * </table>
     *  
     * 
     * When you call this method, also call the <a href="https://docs.microsoft.com/windows/desktop/api/medparam/nf-medparam-imediaparams-flushenvelope">FlushEnvelope</a> method, to flush any envelopes that were set using the previous time format.
     * 
     * To determine what time formats an object supports, call the <a href="https://docs.microsoft.com/windows/desktop/api/medparam/nf-medparam-imediaparaminfo-getsupportedtimeformat">IMediaParamInfo::GetSupportedTimeFormat</a> method. To retrieve the current format, call the <a href="https://docs.microsoft.com/windows/desktop/api/medparam/nf-medparam-imediaparaminfo-getcurrenttimeformat">IMediaParamInfo::GetCurrentTimeFormat</a> method.
     * @param {Guid} guidTimeFormat Time format GUID that specifies the time format.
     * @param {Integer} mpTimeData Value of type <b>MP_TIMEDATA</b> that specifies the unit of measure for the new format.
     * @returns {HRESULT} Returns an <b>HRESULT</b> value. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Object does not support this time format.
     * 
     * </td>
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
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparams-settimeformat
     */
    SetTimeFormat(guidTimeFormat, mpTimeData) {
        result := ComCall(7, this, Guid, guidTimeFormat, "uint", mpTimeData, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMediaParams.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetParam := CallbackCreate(GetMethod(implObj, "GetParam"), flags, 3)
        this.vtbl.SetParam := CallbackCreate(GetMethod(implObj, "SetParam"), flags, 3)
        this.vtbl.AddEnvelope := CallbackCreate(GetMethod(implObj, "AddEnvelope"), flags, 4)
        this.vtbl.FlushEnvelope := CallbackCreate(GetMethod(implObj, "FlushEnvelope"), flags, 4)
        this.vtbl.SetTimeFormat := CallbackCreate(GetMethod(implObj, "SetTimeFormat"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetParam)
        CallbackFree(this.vtbl.SetParam)
        CallbackFree(this.vtbl.AddEnvelope)
        CallbackFree(this.vtbl.FlushEnvelope)
        CallbackFree(this.vtbl.SetTimeFormat)
    }
}
