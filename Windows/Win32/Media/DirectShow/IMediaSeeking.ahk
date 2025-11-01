#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IMediaSeeking interface contains methods for seeking to a position within a stream, and for setting the playback rate.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/nn-strmif-imediaseeking
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class IMediaSeeking extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMediaSeeking
     * @type {Guid}
     */
    static IID => Guid("{36b73880-c2c8-11cf-8b46-00805f6cef60}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCapabilities", "CheckCapabilities", "IsFormatSupported", "QueryPreferredFormat", "GetTimeFormat", "IsUsingTimeFormat", "SetTimeFormat", "GetDuration", "GetStopPosition", "GetCurrentPosition", "ConvertTimeFormat", "SetPositions", "GetPositions", "GetAvailable", "SetRate", "GetRate", "GetPreroll"]

    /**
     * 
     * @param {Pointer<Integer>} pCapabilities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-getcapabilities
     */
    GetCapabilities(pCapabilities) {
        pCapabilitiesMarshal := pCapabilities is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, pCapabilitiesMarshal, pCapabilities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCapabilities 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-checkcapabilities
     */
    CheckCapabilities(pCapabilities) {
        pCapabilitiesMarshal := pCapabilities is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, pCapabilitiesMarshal, pCapabilities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-isformatsupported
     */
    IsFormatSupported(pFormat) {
        result := ComCall(5, this, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-querypreferredformat
     */
    QueryPreferredFormat(pFormat) {
        result := ComCall(6, this, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-gettimeformat
     */
    GetTimeFormat(pFormat) {
        result := ComCall(7, this, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-isusingtimeformat
     */
    IsUsingTimeFormat(pFormat) {
        result := ComCall(8, this, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-settimeformat
     */
    SetTimeFormat(pFormat) {
        result := ComCall(9, this, "ptr", pFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pDuration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-getduration
     */
    GetDuration(pDuration) {
        pDurationMarshal := pDuration is VarRef ? "int64*" : "ptr"

        result := ComCall(10, this, pDurationMarshal, pDuration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pStop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-getstopposition
     */
    GetStopPosition(pStop) {
        pStopMarshal := pStop is VarRef ? "int64*" : "ptr"

        result := ComCall(11, this, pStopMarshal, pStop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCurrent 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-getcurrentposition
     */
    GetCurrentPosition(pCurrent) {
        pCurrentMarshal := pCurrent is VarRef ? "int64*" : "ptr"

        result := ComCall(12, this, pCurrentMarshal, pCurrent, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pTarget 
     * @param {Pointer<Guid>} pTargetFormat 
     * @param {Integer} Source 
     * @param {Pointer<Guid>} pSourceFormat 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-converttimeformat
     */
    ConvertTimeFormat(pTarget, pTargetFormat, Source, pSourceFormat) {
        pTargetMarshal := pTarget is VarRef ? "int64*" : "ptr"

        result := ComCall(13, this, pTargetMarshal, pTarget, "ptr", pTargetFormat, "int64", Source, "ptr", pSourceFormat, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCurrent 
     * @param {Integer} dwCurrentFlags 
     * @param {Pointer<Integer>} pStop 
     * @param {Integer} dwStopFlags 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-setpositions
     */
    SetPositions(pCurrent, dwCurrentFlags, pStop, dwStopFlags) {
        pCurrentMarshal := pCurrent is VarRef ? "int64*" : "ptr"
        pStopMarshal := pStop is VarRef ? "int64*" : "ptr"

        result := ComCall(14, this, pCurrentMarshal, pCurrent, "uint", dwCurrentFlags, pStopMarshal, pStop, "uint", dwStopFlags, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pCurrent 
     * @param {Pointer<Integer>} pStop 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-getpositions
     */
    GetPositions(pCurrent, pStop) {
        pCurrentMarshal := pCurrent is VarRef ? "int64*" : "ptr"
        pStopMarshal := pStop is VarRef ? "int64*" : "ptr"

        result := ComCall(15, this, pCurrentMarshal, pCurrent, pStopMarshal, pStop, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pEarliest 
     * @param {Pointer<Integer>} pLatest 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-getavailable
     */
    GetAvailable(pEarliest, pLatest) {
        pEarliestMarshal := pEarliest is VarRef ? "int64*" : "ptr"
        pLatestMarshal := pLatest is VarRef ? "int64*" : "ptr"

        result := ComCall(16, this, pEarliestMarshal, pEarliest, pLatestMarshal, pLatest, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Float} dRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-setrate
     */
    SetRate(dRate) {
        result := ComCall(17, this, "double", dRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} pdRate 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-getrate
     */
    GetRate(pdRate) {
        pdRateMarshal := pdRate is VarRef ? "double*" : "ptr"

        result := ComCall(18, this, pdRateMarshal, pdRate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pllPreroll 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/strmif/nf-strmif-imediaseeking-getpreroll
     */
    GetPreroll(pllPreroll) {
        pllPrerollMarshal := pllPreroll is VarRef ? "int64*" : "ptr"

        result := ComCall(19, this, pllPrerollMarshal, pllPreroll, "HRESULT")
        return result
    }
}
