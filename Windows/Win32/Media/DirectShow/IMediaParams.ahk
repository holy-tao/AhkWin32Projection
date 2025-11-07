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
     * 
     * @param {Integer} dwParamIndex 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparams-getparam
     */
    GetParam(dwParamIndex) {
        result := ComCall(3, this, "uint", dwParamIndex, "float*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} dwParamIndex 
     * @param {Float} value 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparams-setparam
     */
    SetParam(dwParamIndex, value) {
        result := ComCall(4, this, "uint", dwParamIndex, "float", value, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwParamIndex 
     * @param {Integer} cSegments 
     * @param {Pointer<MP_ENVELOPE_SEGMENT>} pEnvelopeSegments 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparams-addenvelope
     */
    AddEnvelope(dwParamIndex, cSegments, pEnvelopeSegments) {
        result := ComCall(5, this, "uint", dwParamIndex, "uint", cSegments, "ptr", pEnvelopeSegments, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwParamIndex 
     * @param {Integer} refTimeStart 
     * @param {Integer} refTimeEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparams-flushenvelope
     */
    FlushEnvelope(dwParamIndex, refTimeStart, refTimeEnd) {
        result := ComCall(6, this, "uint", dwParamIndex, "int64", refTimeStart, "int64", refTimeEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Guid} guidTimeFormat 
     * @param {Integer} mpTimeData 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/medparam/nf-medparam-imediaparams-settimeformat
     */
    SetTimeFormat(guidTimeFormat, mpTimeData) {
        result := ComCall(7, this, "ptr", guidTimeFormat, "uint", mpTimeData, "HRESULT")
        return result
    }
}
