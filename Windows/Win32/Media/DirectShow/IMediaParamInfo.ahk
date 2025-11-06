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
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparaminfo-getparamcount
     */
    GetParamCount() {
        result := ComCall(3, this, "uint*", &pdwParams := 0, "HRESULT")
        return pdwParams
    }

    /**
     * 
     * @param {Integer} dwParamIndex 
     * @returns {MP_PARAMINFO} 
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparaminfo-getparaminfo
     */
    GetParamInfo(dwParamIndex) {
        pInfo := MP_PARAMINFO()
        result := ComCall(4, this, "uint", dwParamIndex, "ptr", pInfo, "HRESULT")
        return pInfo
    }

    /**
     * 
     * @param {Integer} dwParamIndex 
     * @returns {Pointer<Integer>} 
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparaminfo-getparamtext
     */
    GetParamText(dwParamIndex) {
        result := ComCall(5, this, "uint", dwParamIndex, "ptr*", &ppwchText := 0, "HRESULT")
        return ppwchText
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparaminfo-getnumtimeformats
     */
    GetNumTimeFormats() {
        result := ComCall(6, this, "uint*", &pdwNumTimeFormats := 0, "HRESULT")
        return pdwNumTimeFormats
    }

    /**
     * 
     * @param {Integer} dwFormatIndex 
     * @returns {Guid} 
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparaminfo-getsupportedtimeformat
     */
    GetSupportedTimeFormat(dwFormatIndex) {
        pguidTimeFormat := Guid()
        result := ComCall(7, this, "uint", dwFormatIndex, "ptr", pguidTimeFormat, "HRESULT")
        return pguidTimeFormat
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidTimeFormat 
     * @param {Pointer<Integer>} pTimeData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparaminfo-getcurrenttimeformat
     */
    GetCurrentTimeFormat(pguidTimeFormat, pTimeData) {
        pTimeDataMarshal := pTimeData is VarRef ? "uint*" : "ptr"

        result := ComCall(8, this, "ptr", pguidTimeFormat, pTimeDataMarshal, pTimeData, "HRESULT")
        return result
    }
}
