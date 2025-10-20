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
     * 
     * @param {Integer} dwParamIndex 
     * @param {Pointer<Single>} pValue 
     * @returns {HRESULT} 
     */
    GetParam(dwParamIndex, pValue) {
        result := ComCall(3, this, "uint", dwParamIndex, "float*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwParamIndex 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    SetParam(dwParamIndex, value) {
        result := ComCall(4, this, "uint", dwParamIndex, "float", value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwParamIndex 
     * @param {Integer} cSegments 
     * @param {Pointer<MP_ENVELOPE_SEGMENT>} pEnvelopeSegments 
     * @returns {HRESULT} 
     */
    AddEnvelope(dwParamIndex, cSegments, pEnvelopeSegments) {
        result := ComCall(5, this, "uint", dwParamIndex, "uint", cSegments, "ptr", pEnvelopeSegments, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwParamIndex 
     * @param {Integer} refTimeStart 
     * @param {Integer} refTimeEnd 
     * @returns {HRESULT} 
     */
    FlushEnvelope(dwParamIndex, refTimeStart, refTimeEnd) {
        result := ComCall(6, this, "uint", dwParamIndex, "int64", refTimeStart, "int64", refTimeEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} guidTimeFormat 
     * @param {Integer} mpTimeData 
     * @returns {HRESULT} 
     */
    SetTimeFormat(guidTimeFormat, mpTimeData) {
        result := ComCall(7, this, "ptr", guidTimeFormat, "uint", mpTimeData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
