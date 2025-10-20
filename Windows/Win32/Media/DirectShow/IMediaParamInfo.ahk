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
     * 
     * @param {Pointer<UInt32>} pdwParams 
     * @returns {HRESULT} 
     */
    GetParamCount(pdwParams) {
        result := ComCall(3, this, "uint*", pdwParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwParamIndex 
     * @param {Pointer<MP_PARAMINFO>} pInfo 
     * @returns {HRESULT} 
     */
    GetParamInfo(dwParamIndex, pInfo) {
        result := ComCall(4, this, "uint", dwParamIndex, "ptr", pInfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwParamIndex 
     * @param {Pointer<UInt16>} ppwchText 
     * @returns {HRESULT} 
     */
    GetParamText(dwParamIndex, ppwchText) {
        result := ComCall(5, this, "uint", dwParamIndex, "ushort*", ppwchText, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwNumTimeFormats 
     * @returns {HRESULT} 
     */
    GetNumTimeFormats(pdwNumTimeFormats) {
        result := ComCall(6, this, "uint*", pdwNumTimeFormats, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFormatIndex 
     * @param {Pointer<Guid>} pguidTimeFormat 
     * @returns {HRESULT} 
     */
    GetSupportedTimeFormat(dwFormatIndex, pguidTimeFormat) {
        result := ComCall(7, this, "uint", dwFormatIndex, "ptr", pguidTimeFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pguidTimeFormat 
     * @param {Pointer<UInt32>} pTimeData 
     * @returns {HRESULT} 
     */
    GetCurrentTimeFormat(pguidTimeFormat, pTimeData) {
        result := ComCall(8, this, "ptr", pguidTimeFormat, "uint*", pTimeData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
