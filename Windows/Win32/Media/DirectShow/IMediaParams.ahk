#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMediaParams interface sets and retrieves envelope-following parameters on an object.
 * @see https://docs.microsoft.com/windows/win32/api//medparam/nn-medparam-imediaparams
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaParams extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaParams
     * @type {Guid}
     */
    static IID => Guid("{6d6cbb61-a223-44aa-842f-a2f06750be6e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetParam", "SetParam", "AddEnvelope", "FlushEnvelope", "SetTimeFormat"]

    /**
     * The GetParam method retrieves the current value of the specified parameter. If the parameter is currently within an envelope segment, the returned value is the value on the most recently processed sample.
     * @param {Integer} dwParamIndex Zero-based index of the parameter.
     * @returns {Float} Pointer to a variable of type <b>MP_DATA</b> that receives the parameter value.
     * @see https://docs.microsoft.com/windows/win32/api//medparam/nf-medparam-imediaparams-getparam
     */
    GetParam(dwParamIndex) {
        result := ComCall(3, this, "uint", dwParamIndex, "float*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * The SetParam method sets the value of a parameter.
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
     * @see https://docs.microsoft.com/windows/win32/api//medparam/nf-medparam-imediaparams-setparam
     */
    SetParam(dwParamIndex, value) {
        result := ComCall(4, this, "uint", dwParamIndex, "float", value, "HRESULT")
        return result
    }

    /**
     * The AddEnvelope method adds an envelope to a parameter.
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
     * @see https://docs.microsoft.com/windows/win32/api//medparam/nf-medparam-imediaparams-addenvelope
     */
    AddEnvelope(dwParamIndex, cSegments, pEnvelopeSegments) {
        result := ComCall(5, this, "uint", dwParamIndex, "uint", cSegments, "ptr", pEnvelopeSegments, "HRESULT")
        return result
    }

    /**
     * The FlushEnvelope method flushes envelope data for a specified parameter over the specified time range.
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
     * @see https://docs.microsoft.com/windows/win32/api//medparam/nf-medparam-imediaparams-flushenvelope
     */
    FlushEnvelope(dwParamIndex, refTimeStart, refTimeEnd) {
        result := ComCall(6, this, "uint", dwParamIndex, "int64", refTimeStart, "int64", refTimeEnd, "HRESULT")
        return result
    }

    /**
     * The SetTimeFormat method specifies the time format for the object.
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
     * @see https://docs.microsoft.com/windows/win32/api//medparam/nf-medparam-imediaparams-settimeformat
     */
    SetTimeFormat(guidTimeFormat, mpTimeData) {
        result := ComCall(7, this, "ptr", guidTimeFormat, "uint", mpTimeData, "HRESULT")
        return result
    }
}
