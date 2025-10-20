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
     * 
     * @param {Pointer<UInt32>} pCapabilities 
     * @returns {HRESULT} 
     */
    GetCapabilities(pCapabilities) {
        result := ComCall(3, this, "uint*", pCapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pCapabilities 
     * @returns {HRESULT} 
     */
    CheckCapabilities(pCapabilities) {
        result := ComCall(4, this, "uint*", pCapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pFormat 
     * @returns {HRESULT} 
     */
    IsFormatSupported(pFormat) {
        result := ComCall(5, this, "ptr", pFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pFormat 
     * @returns {HRESULT} 
     */
    QueryPreferredFormat(pFormat) {
        result := ComCall(6, this, "ptr", pFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pFormat 
     * @returns {HRESULT} 
     */
    GetTimeFormat(pFormat) {
        result := ComCall(7, this, "ptr", pFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pFormat 
     * @returns {HRESULT} 
     */
    IsUsingTimeFormat(pFormat) {
        result := ComCall(8, this, "ptr", pFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} pFormat 
     * @returns {HRESULT} 
     */
    SetTimeFormat(pFormat) {
        result := ComCall(9, this, "ptr", pFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pDuration 
     * @returns {HRESULT} 
     */
    GetDuration(pDuration) {
        result := ComCall(10, this, "int64*", pDuration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pStop 
     * @returns {HRESULT} 
     */
    GetStopPosition(pStop) {
        result := ComCall(11, this, "int64*", pStop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pCurrent 
     * @returns {HRESULT} 
     */
    GetCurrentPosition(pCurrent) {
        result := ComCall(12, this, "int64*", pCurrent, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pTarget 
     * @param {Pointer<Guid>} pTargetFormat 
     * @param {Integer} Source 
     * @param {Pointer<Guid>} pSourceFormat 
     * @returns {HRESULT} 
     */
    ConvertTimeFormat(pTarget, pTargetFormat, Source, pSourceFormat) {
        result := ComCall(13, this, "int64*", pTarget, "ptr", pTargetFormat, "int64", Source, "ptr", pSourceFormat, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pCurrent 
     * @param {Integer} dwCurrentFlags 
     * @param {Pointer<Int64>} pStop 
     * @param {Integer} dwStopFlags 
     * @returns {HRESULT} 
     */
    SetPositions(pCurrent, dwCurrentFlags, pStop, dwStopFlags) {
        result := ComCall(14, this, "int64*", pCurrent, "uint", dwCurrentFlags, "int64*", pStop, "uint", dwStopFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pCurrent 
     * @param {Pointer<Int64>} pStop 
     * @returns {HRESULT} 
     */
    GetPositions(pCurrent, pStop) {
        result := ComCall(15, this, "int64*", pCurrent, "int64*", pStop, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pEarliest 
     * @param {Pointer<Int64>} pLatest 
     * @returns {HRESULT} 
     */
    GetAvailable(pEarliest, pLatest) {
        result := ComCall(16, this, "int64*", pEarliest, "int64*", pLatest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Float} dRate 
     * @returns {HRESULT} 
     */
    SetRate(dRate) {
        result := ComCall(17, this, "double", dRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} pdRate 
     * @returns {HRESULT} 
     */
    GetRate(pdRate) {
        result := ComCall(18, this, "double*", pdRate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int64>} pllPreroll 
     * @returns {HRESULT} 
     */
    GetPreroll(pllPreroll) {
        result := ComCall(19, this, "int64*", pllPreroll, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
