#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MP_PARAMINFO.ahk" { MP_PARAMINFO }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * The IMediaParamInfo interface retrieves information about the parameters that an object supports. The set of parameters that an object supports will not change over the lifetime of an application. To set parameter values, use the IMediaParams interface.
 * @see https://learn.microsoft.com/windows/win32/api/medparam/nn-medparam-imediaparaminfo
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct IMediaParamInfo extends IUnknown {
    /**
     * The interface identifier for IMediaParamInfo
     * @type {Guid}
     */
    static IID := Guid("{6d6cbb60-a223-44aa-842f-a2f06750be6d}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMediaParamInfo interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetParamCount          : IntPtr
        GetParamInfo           : IntPtr
        GetParamText           : IntPtr
        GetNumTimeFormats      : IntPtr
        GetSupportedTimeFormat : IntPtr
        GetCurrentTimeFormat   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMediaParamInfo.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * The GetParamCount method retrieves the number of parameters that the object supports.
     * @returns {Integer} Pointer to a variable that receives the number of parameters.
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparaminfo-getparamcount
     */
    GetParamCount() {
        result := ComCall(3, this, "uint*", &pdwParams := 0, "HRESULT")
        return pdwParams
    }

    /**
     * The GetParamInfo method retrieves information about a specified parameter.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/medparam/nf-medparam-imediaparaminfo-getparamcount">GetParamCount</a> method to retrieve the number of parameters that the object supports.
     * @param {Integer} dwParamIndex Zero-based index of the parameter.
     * @returns {MP_PARAMINFO} Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/medparam/ns-medparam-mp_paraminfo">MP_PARAMINFO</a> structure that is filled with the parameter information.
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparaminfo-getparaminfo
     */
    GetParamInfo(dwParamIndex) {
        pInfo := MP_PARAMINFO()
        result := ComCall(4, this, "uint", dwParamIndex, MP_PARAMINFO.Ptr, pInfo, "HRESULT")
        return pInfo
    }

    /**
     * The GetParamText method retrieves a series of text strings that describe the parameter.
     * @remarks
     * If the method succeeds, *<i>ppwchText</i> points to a string with the following format:
     * 
     * <c>Name\0Unit\0Enum1\0Enum2\0...EnumN\0\0</c>
     * 
     * where
     * 
     * <ul>
     * <li><i>Name</i> is the name of the parameter.</li>
     * <li><i>Unit</i> is the name of the units; for example, milliseconds.</li>
     * <li><i>Enum1</i> through <i></i></li>
     * <li><i>EnumN</i> are descriptive names for the parameter's enumerated values. (Applies only to parameters of type MPT_ENUM.)</li>
     * </ul>
     * The application can display these values within its user interface. They are not guaranteed to follow a consistent naming scheme. If the user's computer is using an international code page, the method might return a localized string corresponding to that code page.
     * 
     * The object uses the <b>CoTaskMemAlloc</b> function to allocate memory for the string. After you call this method, call <b>CoTaskMemFree</b> to free the buffer.
     * @param {Integer} dwParamIndex Zero-based index of the parameter.
     * @returns {Pointer<Integer>} Address of a variable that receives a pointer to a series of Unicode™ strings.
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparaminfo-getparamtext
     */
    GetParamText(dwParamIndex) {
        result := ComCall(5, this, "uint", dwParamIndex, "ptr*", &ppwchText := 0, "HRESULT")
        return ppwchText
    }

    /**
     * The GetNumTimeFormats method retrieves the number of time formats that the object supports.
     * @returns {Integer} Pointer to a variable that receives the number of supported time formats.
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparaminfo-getnumtimeformats
     */
    GetNumTimeFormats() {
        result := ComCall(6, this, "uint*", &pdwNumTimeFormats := 0, "HRESULT")
        return pdwNumTimeFormats
    }

    /**
     * The GetSupportedTimeFormat method retrieves a supported time format.
     * @remarks
     * Call the <a href="https://docs.microsoft.com/windows/desktop/api/medparam/nf-medparam-imediaparaminfo-getnumtimeformats">GetNumTimeFormats</a> method to retrieve the number of time formats that the object supports.
     * @param {Integer} dwFormatIndex Index of the time format to retrieve.
     * @returns {Guid} Pointer to a variable that receives a time format GUID.
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparaminfo-getsupportedtimeformat
     */
    GetSupportedTimeFormat(dwFormatIndex) {
        pguidTimeFormat := Guid()
        result := ComCall(7, this, "uint", dwFormatIndex, Guid.Ptr, pguidTimeFormat, "HRESULT")
        return pguidTimeFormat
    }

    /**
     * The GetCurrentTimeFormat method retrieves the current time format.
     * @remarks
     * The meaning of the value returned in the <i>pTimeData</i> parameter depends on the time format GUID. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/medparam/nf-medparam-imediaparams-settimeformat">IMediaParams::SetTimeFormat</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparaminfo-getcurrenttimeformat
     */
    GetCurrentTimeFormat(pguidTimeFormat, pTimeData) {
        pTimeDataMarshal := pTimeData is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, Guid.Ptr, pguidTimeFormat, pTimeDataMarshal, pTimeData, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMediaParamInfo.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetParamCount := CallbackCreate(GetMethod(implObj, "GetParamCount"), flags, 2)
        this.vtbl.GetParamInfo := CallbackCreate(GetMethod(implObj, "GetParamInfo"), flags, 3)
        this.vtbl.GetParamText := CallbackCreate(GetMethod(implObj, "GetParamText"), flags, 3)
        this.vtbl.GetNumTimeFormats := CallbackCreate(GetMethod(implObj, "GetNumTimeFormats"), flags, 2)
        this.vtbl.GetSupportedTimeFormat := CallbackCreate(GetMethod(implObj, "GetSupportedTimeFormat"), flags, 3)
        this.vtbl.GetCurrentTimeFormat := CallbackCreate(GetMethod(implObj, "GetCurrentTimeFormat"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetParamCount)
        CallbackFree(this.vtbl.GetParamInfo)
        CallbackFree(this.vtbl.GetParamText)
        CallbackFree(this.vtbl.GetNumTimeFormats)
        CallbackFree(this.vtbl.GetSupportedTimeFormat)
        CallbackFree(this.vtbl.GetCurrentTimeFormat)
    }
}
