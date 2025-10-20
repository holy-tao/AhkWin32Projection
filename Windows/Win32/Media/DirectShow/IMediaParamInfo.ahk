#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<Integer>} pdwParams 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparaminfo-getparamcount
     */
    GetParamCount(pdwParams) {
        result := ComCall(3, this, "uint*", pdwParams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwParamIndex 
     * @param {Pointer<MP_PARAMINFO>} pInfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparaminfo-getparaminfo
     */
    GetParamInfo(dwParamIndex, pInfo) {
        result := ComCall(4, this, "uint", dwParamIndex, "ptr", pInfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwParamIndex 
     * @param {Pointer<Pointer<Integer>>} ppwchText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparaminfo-getparamtext
     */
    GetParamText(dwParamIndex, ppwchText) {
        result := ComCall(5, this, "uint", dwParamIndex, "ptr*", ppwchText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwNumTimeFormats 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparaminfo-getnumtimeformats
     */
    GetNumTimeFormats(pdwNumTimeFormats) {
        result := ComCall(6, this, "uint*", pdwNumTimeFormats, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFormatIndex 
     * @param {Pointer<Guid>} pguidTimeFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparaminfo-getsupportedtimeformat
     */
    GetSupportedTimeFormat(dwFormatIndex, pguidTimeFormat) {
        result := ComCall(7, this, "uint", dwFormatIndex, "ptr", pguidTimeFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidTimeFormat 
     * @param {Pointer<Integer>} pTimeData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparaminfo-getcurrenttimeformat
     */
    GetCurrentTimeFormat(pguidTimeFormat, pTimeData) {
        result := ComCall(8, this, "ptr", pguidTimeFormat, "uint*", pTimeData, "HRESULT")
        return result
    }
}
