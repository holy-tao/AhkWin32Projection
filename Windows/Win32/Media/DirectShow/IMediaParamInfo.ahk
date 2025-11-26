#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\MP_PARAMINFO.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMediaParamInfo interface retrieves information about the parameters that an object supports. The set of parameters that an object supports will not change over the lifetime of an application. To set parameter values, use the IMediaParams interface.
 * @see https://docs.microsoft.com/windows/win32/api//medparam/nn-medparam-imediaparaminfo
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaParamInfo extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaParamInfo
     * @type {Guid}
     */
    static IID => Guid("{6d6cbb60-a223-44aa-842f-a2f06750be6d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetParamCount", "GetParamInfo", "GetParamText", "GetNumTimeFormats", "GetSupportedTimeFormat", "GetCurrentTimeFormat"]

    /**
     * The GetParamCount method retrieves the number of parameters that the object supports.
     * @returns {Integer} Pointer to a variable that receives the number of parameters.
     * @see https://docs.microsoft.com/windows/win32/api//medparam/nf-medparam-imediaparaminfo-getparamcount
     */
    GetParamCount() {
        result := ComCall(3, this, "uint*", &pdwParams := 0, "HRESULT")
        return pdwParams
    }

    /**
     * The GetParamInfo method retrieves information about a specified parameter.
     * @param {Integer} dwParamIndex Zero-based index of the parameter.
     * @returns {MP_PARAMINFO} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/medparam/ns-medparam-mp_paraminfo">MP_PARAMINFO</a> structure that is filled with the parameter information.
     * @see https://docs.microsoft.com/windows/win32/api//medparam/nf-medparam-imediaparaminfo-getparaminfo
     */
    GetParamInfo(dwParamIndex) {
        pInfo := MP_PARAMINFO()
        result := ComCall(4, this, "uint", dwParamIndex, "ptr", pInfo, "HRESULT")
        return pInfo
    }

    /**
     * The GetParamText method retrieves a series of text strings that describe the parameter.
     * @param {Integer} dwParamIndex Zero-based index of the parameter.
     * @returns {Pointer<Integer>} Address of a variable that receives a pointer to a series of Unicode™ strings.
     * @see https://docs.microsoft.com/windows/win32/api//medparam/nf-medparam-imediaparaminfo-getparamtext
     */
    GetParamText(dwParamIndex) {
        result := ComCall(5, this, "uint", dwParamIndex, "ptr*", &ppwchText := 0, "HRESULT")
        return ppwchText
    }

    /**
     * The GetNumTimeFormats method retrieves the number of time formats that the object supports.
     * @returns {Integer} Pointer to a variable that receives the number of supported time formats.
     * @see https://docs.microsoft.com/windows/win32/api//medparam/nf-medparam-imediaparaminfo-getnumtimeformats
     */
    GetNumTimeFormats() {
        result := ComCall(6, this, "uint*", &pdwNumTimeFormats := 0, "HRESULT")
        return pdwNumTimeFormats
    }

    /**
     * The GetSupportedTimeFormat method retrieves a supported time format.
     * @param {Integer} dwFormatIndex Index of the time format to retrieve.
     * @returns {Guid} Pointer to a variable that receives a time format GUID.
     * @see https://docs.microsoft.com/windows/win32/api//medparam/nf-medparam-imediaparaminfo-getsupportedtimeformat
     */
    GetSupportedTimeFormat(dwFormatIndex) {
        pguidTimeFormat := Guid()
        result := ComCall(7, this, "uint", dwFormatIndex, "ptr", pguidTimeFormat, "HRESULT")
        return pguidTimeFormat
    }

    /**
     * The GetCurrentTimeFormat method retrieves the current time format.
     * @param {Pointer<Guid>} pguidTimeFormat Pointer to a variable that receives a time format GUID.
     * @param {Pointer<Integer>} pTimeData Pointer to a variable that receives an <b>MP_TIMEDATA</b> value specifying the unit of measure for the new format.
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
     * @see https://docs.microsoft.com/windows/win32/api//medparam/nf-medparam-imediaparaminfo-getcurrenttimeformat
     */
    GetCurrentTimeFormat(pguidTimeFormat, pTimeData) {
        pTimeDataMarshal := pTimeData is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pguidTimeFormat, pTimeDataMarshal, pTimeData, "HRESULT")
        return result
    }
}
